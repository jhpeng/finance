#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  find_focus_skills.sh [--names-only]

Outputs discovered *-focus-topics skills from likely local skill roots.

Default format:
  skill-name<TAB>/absolute/path/to/skill

Options:
  --names-only   Print only the discovered skill names
EOF
}

names_only=0

case "${1:-}" in
  "")
    ;;
  --names-only)
    names_only=1
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

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_skills_root="$(cd -- "${script_dir}/../.." && pwd)"
default_codex_root="${CODEX_HOME:-$HOME/.codex}/skills"

declare -a roots=(
  "$repo_skills_root"
  "$default_codex_root"
  "$HOME/.codex/skills"
  "$PWD/skills"
)
seen_roots=""
seen_names=""

list_contains() {
  local list="$1"
  local needle="$2"
  local item=""

  while IFS= read -r item; do
    [ -n "$item" ] || continue
    if [ "$item" = "$needle" ]; then
      return 0
    fi
  done <<EOF
$list
EOF

  return 1
}

list_append() {
  local list="$1"
  local value="$2"

  if [ -z "$list" ]; then
    printf '%s' "$value"
  else
    printf '%s\n%s' "$list" "$value"
  fi
}

for root in "${roots[@]}"; do
  [ -d "$root" ] || continue

  if list_contains "$seen_roots" "$root"; then
    continue
  fi
  seen_roots="$(list_append "$seen_roots" "$root")"

  shopt -s nullglob
  for match in "$root"/*-focus-topics; do
    [ -d "$match" ] || continue

    skill_name="$(basename -- "$match")"
    if list_contains "$seen_names" "$skill_name"; then
      continue
    fi

    skill_path="$(readlink -f -- "$match" 2>/dev/null || printf '%s' "$match")"
    [ -f "$skill_path/SKILL.md" ] || continue

    seen_names="$(list_append "$seen_names" "$skill_name")"

    if [ "$names_only" -eq 1 ]; then
      printf '%s\n' "$skill_name"
    else
      printf '%s\t%s\n' "$skill_name" "$skill_path"
    fi
  done
  shopt -u nullglob
done | sort
