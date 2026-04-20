#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
default_root="$(cd "$script_dir/../../.." && pwd)"

root="$default_root"
report=""
title=""
source_skill=""
summary=""
summary_file=""
request_text=""
request_file=""
output_text=""
output_file=""
notes=""
notes_file=""
input_date=""
generated_at=""

usage() {
  cat <<'EOF'
Usage:
  write_daily_log.sh --report REPORT [options]

Options:
  --root PATH            Repo root. Defaults to the repo that contains this skill.
  --report NAME          Report key. Required. Normalized to lower hyphen case.
  --title TEXT           Human-readable report title. Defaults from the report key.
  --source-skill NAME    Skill or workflow name. Defaults to "manual".
  --summary TEXT         Summary text.
  --summary-file PATH    Read summary text from a file.
  --request TEXT         Request text.
  --request-file PATH    Read request text from a file.
  --output TEXT          Output text.
  --output-file PATH     Read output text from a file.
  --notes TEXT           Notes text.
  --notes-file PATH      Read notes text from a file.
  --date VALUE           Log date as MM-DD-YYYY or YYYY-MM-DD. Defaults to current UTC date.
  --generated-at VALUE   UTC timestamp string. Defaults to current UTC timestamp.
  --help                 Show this help message.

The script writes:
  history/daily/mm-dd-yyyy/{report}-log.md

If the file already exists for the same date and report, it is overwritten.
EOF
}

read_file() {
  local path="$1"
  if [[ ! -f "$path" ]]; then
    printf 'File not found: %s\n' "$path" >&2
    exit 1
  fi
  cat "$path"
}

slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-{2,}/-/g'
}

titleize() {
  printf '%s' "$1" \
    | tr '-' ' ' \
    | awk '{
        for (i = 1; i <= NF; ++i) {
          $i = toupper(substr($i, 1, 1)) substr($i, 2)
        }
        print
      }'
}

yaml_quote() {
  local value="$1"
  value="${value//\\/\\\\}"
  value="${value//\"/\\\"}"
  printf '"%s"' "$value"
}

normalize_date() {
  local raw="$1"
  if [[ "$raw" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]; then
    printf '%s' "$raw"
    return
  fi

  if [[ "$raw" =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})$ ]]; then
    printf '%s-%s-%s' "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[1]}"
    return
  fi

  printf 'Invalid date format: %s\n' "$raw" >&2
  printf 'Expected MM-DD-YYYY or YYYY-MM-DD.\n' >&2
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --root)
      root="$2"
      shift 2
      ;;
    --report)
      report="$2"
      shift 2
      ;;
    --title)
      title="$2"
      shift 2
      ;;
    --source-skill)
      source_skill="$2"
      shift 2
      ;;
    --summary)
      summary="$2"
      shift 2
      ;;
    --summary-file)
      summary_file="$2"
      shift 2
      ;;
    --request)
      request_text="$2"
      shift 2
      ;;
    --request-file)
      request_file="$2"
      shift 2
      ;;
    --output)
      output_text="$2"
      shift 2
      ;;
    --output-file)
      output_file="$2"
      shift 2
      ;;
    --notes)
      notes="$2"
      shift 2
      ;;
    --notes-file)
      notes_file="$2"
      shift 2
      ;;
    --date)
      input_date="$2"
      shift 2
      ;;
    --generated-at)
      generated_at="$2"
      shift 2
      ;;
    --help)
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

if [[ -z "$report" ]]; then
  printf 'Missing required argument: --report\n' >&2
  usage >&2
  exit 1
fi

if [[ -n "$summary_file" ]]; then
  summary="$(read_file "$summary_file")"
fi

if [[ -n "$request_file" ]]; then
  request_text="$(read_file "$request_file")"
fi

if [[ -n "$output_file" ]]; then
  output_text="$(read_file "$output_file")"
elif [[ -z "$output_text" && ! -t 0 ]]; then
  output_text="$(cat)"
fi

if [[ -n "$notes_file" ]]; then
  notes="$(read_file "$notes_file")"
fi

report_slug="$(slugify "$report")"
if [[ -z "$report_slug" ]]; then
  printf 'Report name did not contain any usable characters: %s\n' "$report" >&2
  exit 1
fi

if [[ -z "$title" ]]; then
  title="$(titleize "$report_slug")"
fi

if [[ -z "$source_skill" ]]; then
  source_skill="manual"
fi

if [[ -z "$summary" ]]; then
  summary="(not provided)"
fi

if [[ -z "$request_text" ]]; then
  request_text="(not provided)"
fi

if [[ -z "$output_text" ]]; then
  output_text="(not provided)"
fi

if [[ -z "$notes" ]]; then
  notes="(none)"
fi

if [[ -z "$input_date" ]]; then
  log_date="$(date -u '+%m-%d-%Y')"
else
  log_date="$(normalize_date "$input_date")"
fi

if [[ -z "$generated_at" ]]; then
  generated_at="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
fi

log_dir="$root/history/daily/$log_date"
output_path="$log_dir/${report_slug}-log.md"

mkdir -p "$log_dir"

tmp_file="$(mktemp)"
cleanup() {
  rm -f "$tmp_file"
}
trap cleanup EXIT

{
  printf '%s\n' '---'
  printf 'report: %s\n' "$(yaml_quote "$report_slug")"
  printf 'title: %s\n' "$(yaml_quote "$title")"
  printf 'log_date: %s\n' "$(yaml_quote "$log_date")"
  printf 'generated_at_utc: %s\n' "$(yaml_quote "$generated_at")"
  printf 'source_skill: %s\n' "$(yaml_quote "$source_skill")"
  printf '%s\n\n' '---'

  printf '# %s Log\n\n' "$title"
  printf -- '- Report: `%s`\n' "$report_slug"
  printf -- '- Date: `%s`\n' "$log_date"
  printf -- '- Generated At: `%s`\n' "$generated_at"
  printf -- '- Source Skill: `%s`\n\n' "$source_skill"

  printf '## Summary\n'
  printf '%s\n\n' "$summary"

  printf '## Request\n'
  printf '%s\n\n' "$request_text"

  printf '## Output\n'
  printf '%s\n\n' "$output_text"

  printf '## Notes\n'
  printf '%s\n' "$notes"
} > "$tmp_file"

mv "$tmp_file" "$output_path"
trap - EXIT

printf '%s\n' "$output_path"
