#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  commit_daily_outputs.sh snapshot [--root PATH] [--date VALUE]
  commit_daily_outputs.sh commit --baseline-file PATH [--root PATH] [--date VALUE] [--message TEXT]

Commands:
  snapshot              Print the current git porcelain status for history/daily/MM-DD-YYYY.
  commit                Commit only newly changed files under history/daily/MM-DD-YYYY that
                        were clean at snapshot time.

Options:
  --root PATH           Repo root. Defaults to the repo that contains this skill.
  --date VALUE          Target date as MM-DD-YYYY or YYYY-MM-DD. Defaults to current UTC date.
  --baseline-file PATH  Required for the commit command. File created from the snapshot output.
  --message TEXT        Commit message. Defaults to "Daily research pipeline for YYYY-MM-DD".
  -h, --help            Show this help message.

The commit command is intentionally conservative:
- it only considers files under history/daily/MM-DD-YYYY
- it refuses to commit if files in that directory were already dirty at snapshot time
- it refuses to commit if the git index already contains staged changes
EOF
}

normalize_date() {
  local raw="$1"

  if [[ -z "$raw" ]]; then
    date -u '+%m-%d-%Y'
    return
  fi

  if [[ "$raw" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]; then
    printf '%s\n' "$raw"
    return
  fi

  if [[ "$raw" =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})$ ]]; then
    printf '%s-%s-%s\n' "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[1]}"
    return
  fi

  printf 'Invalid date format: %s\n' "$raw" >&2
  printf 'Expected MM-DD-YYYY or YYYY-MM-DD.\n' >&2
  exit 1
}

status_path_from_line() {
  local line="$1"
  local payload="${line:3}"

  if [[ "$payload" == *" -> "* ]]; then
    printf '%s\n' "${payload##* -> }"
    return
  fi

  printf '%s\n' "$payload"
}

print_key_value() {
  local key="$1"
  local value="$2"
  printf '%s=%s\n' "$key" "$value"
}

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
default_root="$(cd -- "${script_dir}/../../.." && pwd)"

command_name="${1:-}"
if [[ -z "$command_name" ]]; then
  usage >&2
  exit 1
fi
shift || true

root="$default_root"
input_date=""
baseline_file=""
message=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --root)
      root="$2"
      shift 2
      ;;
    --date)
      input_date="$2"
      shift 2
      ;;
    --baseline-file)
      baseline_file="$2"
      shift 2
      ;;
    --message)
      message="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if ! git -C "$root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf 'Not a git repository: %s\n' "$root" >&2
  exit 1
fi

resolved_date="$(normalize_date "$input_date")"
daily_dir="history/daily/$resolved_date"

status_lines() {
  git -C "$root" status --short --untracked-files=all -- "$daily_dir"
}

case "$command_name" in
  snapshot)
    status_lines
    ;;
  commit)
    if [[ -z "$baseline_file" ]]; then
      printf 'Missing required argument for commit: --baseline-file\n' >&2
      usage >&2
      exit 1
    fi

    if [[ ! -f "$baseline_file" ]]; then
      printf 'Baseline file not found: %s\n' "$baseline_file" >&2
      exit 1
    fi

    if ! git -C "$root" diff --cached --quiet; then
      print_key_value "COMMIT_CREATED" "0"
      print_key_value "REASON" "preexisting-staged-changes"
      while IFS= read -r staged_path; do
        [[ -n "$staged_path" ]] || continue
        print_key_value "STAGED_PATH" "$staged_path"
      done < <(git -C "$root" diff --cached --name-only)
      exit 2
    fi

    declare -A baseline_paths=()
    declare -A current_paths=()

    while IFS= read -r line; do
      [[ -n "$line" ]] || continue
      path="$(status_path_from_line "$line")"
      baseline_paths["$path"]=1
    done < "$baseline_file"

    while IFS= read -r line; do
      [[ -n "$line" ]] || continue
      path="$(status_path_from_line "$line")"
      current_paths["$path"]=1
    done < <(status_lines)

    if [[ "${#current_paths[@]}" -eq 0 ]]; then
      print_key_value "COMMIT_CREATED" "0"
      print_key_value "REASON" "no-daily-changes"
      exit 0
    fi

    declare -a blocking_paths=()
    declare -a candidate_paths=()

    while IFS= read -r path; do
      [[ -n "$path" ]] || continue
      if [[ -n "${baseline_paths[$path]:-}" ]]; then
        blocking_paths+=("$path")
      else
        candidate_paths+=("$path")
      fi
    done < <(printf '%s\n' "${!current_paths[@]}" | sort)

    if [[ "${#blocking_paths[@]}" -gt 0 ]]; then
      print_key_value "COMMIT_CREATED" "0"
      print_key_value "REASON" "preexisting-dirty-daily-paths"
      while IFS= read -r path; do
        [[ -n "$path" ]] || continue
        print_key_value "DIRTY_PATH" "$path"
      done < <(printf '%s\n' "${blocking_paths[@]}" | sort -u)
      exit 2
    fi

    if [[ "${#candidate_paths[@]}" -eq 0 ]]; then
      print_key_value "COMMIT_CREATED" "0"
      print_key_value "REASON" "no-new-daily-paths"
      exit 0
    fi

    if [[ -z "$message" ]]; then
      if [[ "$resolved_date" =~ ^([0-9]{2})-([0-9]{2})-([0-9]{4})$ ]]; then
        message="Daily research pipeline for ${BASH_REMATCH[3]}-${BASH_REMATCH[1]}-${BASH_REMATCH[2]}"
      else
        message="Daily research pipeline for $resolved_date"
      fi
    fi

    noise_log="$(mktemp)"
    exec 3>&1 4>&2
    exec >"$noise_log" 2>&1

    if ! git -C "$root" add -- "${candidate_paths[@]}"; then
      exec 1>&3 2>&4
      exec 3>&- 4>&-
      cat "$noise_log" >&2
      rm -f "$noise_log"
      exit 1
    fi

    if git -C "$root" diff --cached --quiet -- "${candidate_paths[@]}"; then
      exec 1>&3 2>&4
      exec 3>&- 4>&-
      rm -f "$noise_log"
      print_key_value "COMMIT_CREATED" "0"
      print_key_value "REASON" "nothing-staged-after-add"
      exit 0
    fi

    if ! git -C "$root" -c commit.verbose=false commit --quiet --no-status -m "$message" -- "${candidate_paths[@]}"; then
      exec 1>&3 2>&4
      exec 3>&- 4>&-
      cat "$noise_log" >&2
      rm -f "$noise_log"
      exit 1
    fi

    commit_hash="$(git -C "$root" rev-parse HEAD)"

    exec 1>&3 2>&4
    exec 3>&- 4>&-
    rm -f "$noise_log"
    print_key_value "COMMIT_CREATED" "1"
    print_key_value "COMMIT_HASH" "$commit_hash"
    print_key_value "COMMIT_MESSAGE" "$message"
    while IFS= read -r path; do
      [[ -n "$path" ]] || continue
      print_key_value "COMMITTED_PATH" "$path"
    done < <(printf '%s\n' "${candidate_paths[@]}" | sort -u)
    ;;
  *)
    printf 'Unknown command: %s\n' "$command_name" >&2
    usage >&2
    exit 1
    ;;
esac
