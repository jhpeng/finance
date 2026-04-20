---
name: daily-research-pipeline
description: Run the repo's standard daily research workflow by invoking `$investigate-topics`, then `$focus-events-forecast`, then `$watchlist-price-predictions`, and finally committing the resulting `history/daily/...` log changes with git. Use when Codex needs the normal once-per-day refresh of focus logs, scenario forecasts, and watchlist price predictions in sequence.
---

# Daily Research Pipeline

## Overview

Run the repo's three daily research workflows in a fixed order for one exact date, then make one safe git commit for the newly generated daily artifacts.

Keep the top-level orchestration local and sequential. Let the downstream skills own any sub-agent fan-out they require.

## Resolve Paths

Treat this skill directory as the anchor for sibling skills and helpers:

- `$investigate-topics`: `../investigate-topics`
- `$focus-events-forecast`: `../focus-events-forecast`
- `$watchlist-price-predictions`: `../watchlist-price-predictions`
- commit helper: `scripts/commit_daily_outputs.sh`

## Workflow

1. Resolve the run date and preferences.
Use the user-specified date if provided. Otherwise default to the current UTC date. Use exact dates in prompts and summaries. Carry forward any user preferences about domains, geography, depth, logging suppression, watchlist path, watchlist symbols, or commit message.

2. Capture the baseline status for the target daily directory.
Before running anything, snapshot the existing git status under `history/daily/MM-DD-YYYY` so the final commit can include only newly generated files from this run.

Example:

```bash
baseline_file="$(mktemp)"
"/workspaces/finance/skills/daily-research-pipeline/scripts/commit_daily_outputs.sh" \
  snapshot \
  --date "$RESOLVED_DATE" \
  > "$baseline_file"
```

3. Run `$investigate-topics` first.
Use the sibling `../investigate-topics` skill for the same resolved date. If the user does not name specific domains, let that skill use its installed default coverage. Preserve the user's logging preference. Ask for a concise orchestration summary and the generated focus-log paths when available.

4. Run `$focus-events-forecast` second.
Use the sibling `../focus-events-forecast` skill for the same resolved date. Forecast the focus logs available for that date after step 3. If step 3 completed only partially, continue with whatever focus logs exist. If no focus logs exist for the resolved date, report that the forecast step was skipped instead of inventing coverage.

5. Run `$watchlist-price-predictions` third.
Use the sibling `../watchlist-price-predictions` skill for the same resolved date. Unless the user explicitly asks otherwise, keep the default enabled-only watchlist behavior. Preserve any watchlist path, symbol filter, horizon emphasis, or logging preference from the user.

6. Build the final run summary.
Return one short section per step with:

- whether the step completed, partially completed, failed, or was skipped
- the main outputs or lead takeaways
- the generated log paths when available
- any caveat that materially changes confidence

7. Commit the generated daily outputs.
Unless the user explicitly asked not to commit, create one non-interactive git commit after the three steps finish. Use `scripts/commit_daily_outputs.sh` so the commit only includes newly changed files under the resolved `history/daily/MM-DD-YYYY` directory.

Use the user's commit message when provided. Otherwise default to:

```text
Daily research pipeline for YYYY-MM-DD
```

Example:

```bash
"/workspaces/finance/skills/daily-research-pipeline/scripts/commit_daily_outputs.sh" \
  commit \
  --date "$RESOLVED_DATE" \
  --baseline-file "$baseline_file" \
  --message "$COMMIT_MESSAGE"
```

If the helper reports that there is nothing new to commit, say so plainly. If it reports pre-existing dirty daily files or staged repo changes, do not force a commit; surface the blocking paths and stop at that point.

8. Return the final result.
End with a concise summary that includes the resolved date, step outcomes, generated log paths, and either the git commit hash or the reason no commit was created.

## Output Shape

Return the final response in this shape:

- `Run Date`: exact date used for the workflow
- `Step Results`: one short subsection each for `investigate-topics`, `focus-events-forecast`, and `watchlist-price-predictions`
- `Generated Logs`: compact list of saved log paths
- `Git Commit`: commit hash and message, or an explicit no-commit reason
- `Open Issues`: only the blockers or low-confidence gaps that materially affect the run

## Guardrails

- Do not reorder the three workflow steps.
- Do not bypass the downstream skills by reimplementing their logic locally.
- Do not claim a forecast step succeeded unless matching focus logs existed for the resolved date.
- Do not use interactive git commands.
- Do not commit files outside `history/daily/MM-DD-YYYY` as part of this skill.
- Do not commit pre-existing dirty files that were already modified before the run started.
- Do not amend existing commits unless the user explicitly asks.
- Do not suppress logs or commits unless the user explicitly asks.
