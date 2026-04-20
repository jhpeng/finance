---
name: daily-report-logger
description: Save the output of another skill or task into a standardized daily markdown log under history/daily/mm-dd-yyyy/{report}-log.md. Use when Codex needs to persist a final answer, summary, analysis, or report for the current day and overwrite the same report name if a log already exists for that date.
---

# Daily Report Logger

## Overview

Write a final result into a durable daily log with a stable folder structure and a consistent markdown format. Use this after another skill or workflow has produced the content that should be preserved.

## When To Use It

Use this skill when:

- the user wants today's result saved in the repo
- another skill produced a final answer that should be archived
- you need deterministic overwrite behavior for the same report on the same date

Do not use this skill for append-only journals or scratch notes. This skill replaces the prior file for the same `{date, report}` pair.

## Workflow

1. Choose a stable report key.
Use a short slug such as `market-focus`, `macro-brief`, or `earnings-watch`. The output path is `history/daily/mm-dd-yyyy/{report}-log.md`.

2. Gather the log fields.
Prepare:

- `report`
- `title`
- `source_skill`
- `summary`
- `request`
- `output`
- `notes`

3. Write the log with the helper script.
Prefer `scripts/write_daily_log.sh` so the folder path, file name, date handling, and markdown format stay uniform.

For multi-paragraph content, write the request and output into temp files first, then call the script:

```bash
tmp_request="$(mktemp)"
tmp_output="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_OUTPUT" > "$tmp_output"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "market-focus" \
  --title "Market Focus" \
  --source-skill "market-focus-topics" \
  --summary "Equities, rates, and the dollar all reacted to the same macro themes." \
  --request-file "$tmp_request" \
  --output-file "$tmp_output"
```

If the log date must be pinned, pass `--date "04-20-2026"` or `--date "2026-04-20"`.

4. Confirm the result.
Tell the user which path was written. If the same report already exists for the same date, treat replacement as the intended behavior.

## Standard Report Format

Every file written by this skill uses this structure:

```md
---
report: "market-focus"
title: "Market Focus"
log_date: "04-20-2026"
generated_at_utc: "2026-04-20T14:32:11Z"
source_skill: "market-focus-topics"
---

# Market Focus Log

- Report: `market-focus`
- Date: `04-20-2026`
- Generated At: `2026-04-20T14:32:11Z`
- Source Skill: `market-focus-topics`

## Summary
Short summary or key takeaway.

## Request
Original user request or task description.

## Output
Final saved content.

## Notes
Extra context, caveats, or `(none)`.
```

Keep all four body sections so the logs stay easy to scan and parse. Use `(not provided)` or `(none)` when a field is empty.

## Script Notes

- `scripts/write_daily_log.sh` normalizes the report name to lower hyphen case.
- The default root is the repo that contains this skill, so other skills can call it from any working directory.
- The script creates missing `history/daily/mm-dd-yyyy/` folders automatically.
- The same report key on the same date overwrites the existing file.
- `--output-file` is the safest option for large markdown outputs, but piped stdin also works for the output body.

## Guardrails

- Save the final result, not raw intermediate notes, unless the user explicitly wants the raw notes preserved.
- Use exact dates in metadata.
- Keep the summary short instead of repeating the full output.
- Store one report per file.
