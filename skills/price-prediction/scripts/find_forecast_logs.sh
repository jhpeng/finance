#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  find_forecast_logs.sh [--date VALUE] [--names-only]

Outputs discovered *-focus-forecast-log.md files from history/daily/MM-DD-YYYY/.

Default format:
  report-key<TAB>/absolute/path/to/log

Options:
  --date VALUE   Date as MM-DD-YYYY or YYYY-MM-DD. Defaults to current UTC date.
  --names-only   Print only the discovered report keys.
  -h, --help     Show this help message.
EOF
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

input_date=""
names_only=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --date)
      input_date="$2"
      shift 2
      ;;
    --names-only)
      names_only=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
done

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "${script_dir}/../../.." && pwd)"

resolved_date="${input_date:-$(date -u +%m-%d-%Y)}"
resolved_date="$(normalize_date "$resolved_date")"
logs_dir="${repo_root}/history/daily/${resolved_date}"

[[ -d "$logs_dir" ]] || exit 0

shopt -s nullglob
matches=("${logs_dir}"/*-focus-forecast-log.md)
shopt -u nullglob

for match in "${matches[@]}"; do
  [[ -f "$match" ]] || continue

  filename="$(basename -- "$match")"
  report_key="${filename%-log.md}"
  report_key="${report_key##*/}"
  log_path="$(readlink -f -- "$match" 2>/dev/null || printf '%s' "$match")"

  if [[ "$names_only" -eq 1 ]]; then
    printf '%s\n' "$report_key"
  else
    printf '%s\t%s\n' "$report_key" "$log_path"
  fi
done | sort
