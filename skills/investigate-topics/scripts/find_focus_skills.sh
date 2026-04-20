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
declare -A seen_roots=()
declare -A seen_names=()

for root in "${roots[@]}"; do
  [ -d "$root" ] || continue

  if [ -n "${seen_roots[$root]:-}" ]; then
    continue
  fi
  seen_roots["$root"]=1

  shopt -s nullglob
  matches=("$root"/*-focus-topics)
  shopt -u nullglob

  for match in "${matches[@]}"; do
    [ -d "$match" ] || continue

    skill_name="$(basename -- "$match")"
    if [ -n "${seen_names[$skill_name]:-}" ]; then
      continue
    fi

    skill_path="$(readlink -f -- "$match" 2>/dev/null || printf '%s' "$match")"
    [ -f "$skill_path/SKILL.md" ] || continue

    seen_names["$skill_name"]=1

    if [ "$names_only" -eq 1 ]; then
      printf '%s\n' "$skill_name"
    else
      printf '%s\t%s\n' "$skill_name" "$skill_path"
    fi
  done
done | sort
