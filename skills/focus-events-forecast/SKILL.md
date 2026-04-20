---
name: focus-events-forecast
description: Forecast possible future developments from today's `*-focus-log.md` files by reading current focus logs, spawning one sub-agent per log, assigning probabilities across 1-week, 1-month, 3-month, and 1-year scenarios, and saving one forecast log per domain through `$daily-report-logger`. Use when Codex needs scenario forecasts or event predictions based on existing focus reports.
---

# Focus Events Forecast

## Overview

Turn today's focus logs into multi-horizon forecasts. Treat each `*-focus-log.md` as the baseline description of the current situation, delegate one domain forecast per log to a separate sub-agent, require explicit probabilities for each horizon, and persist each finished forecast with `$daily-report-logger`.

## Delegation Contract

Treat an explicit `/focus-events-forecast` invocation, or an explicit request to use `$focus-events-forecast`, as the user's consent to delegated parallel agent work for this workflow.

- Always use sub-agents for this skill when at least one matching `*-focus-log.md` source exists.
- Spawn exactly one fresh worker per selected source log for the first pass, even if only one log is selected.
- Do not silently fall back to running a forecast locally. If sub-agents are unavailable, stop and say that `focus-events-forecast` requires sub-agents for execution.
- Keep orchestration and final synthesis in the parent agent. Only per-log forecasting is delegated.

## Workflow

1. Resolve the requested date and scope.
Use the user-specified date if provided. Otherwise default to the current UTC date. If the user does not name specific logs or domains, process every `*-focus-log.md` available for that date. Treat the skill invocation itself as the user's explicit request for delegated execution.

2. Discover source logs.
Run `scripts/find_focus_logs.sh` from this skill directory. It prints tab-separated `report-key<TAB>absolute-path` rows for the selected date.

If the user asks for a specific date, pass `--date MM-DD-YYYY` or `--date YYYY-MM-DD`. If no logs are found, say so plainly and suggest generating the underlying focus logs first with the matching `*-focus-topics` skills.

3. Select which logs to forecast.
Match explicit user requests first. Otherwise use every discovered source log for the date. Treat each selected log as one independent forecast job.

4. Spawn one worker per log.
Use one fresh `default` sub-agent for each selected log. Do not collapse single-log requests into a local execution path. Prefer `fork_context: false` and pass only the context each worker needs.

Do not set `model` or `reasoning_effort` on `spawn_agent`. Omitting both preserves the parent agent's current model and reasoning effort, which is required for this skill. Worker fan-out is mandatory for this skill whenever matching source logs exist.

5. Give each worker a bounded forecasting task.
Each worker should handle exactly one source log and should not spawn more agents. Pass:

- the original user request
- the resolved date
- the source report key
- the absolute path to the source log
- the absolute path to the sibling `$daily-report-logger` skill
- the absolute path to [references/scenario-forecast-framework.md](references/scenario-forecast-framework.md)

6. Instruct workers to build scenario forecasts.
Each worker should:

- read the source log and extract the current situation, live catalysts, evidence window, and caveats
- treat the source log as the baseline state when it is already for the requested date
- refresh recent facts only when the user explicitly asks for a live refresh, the source log is not for the requested date, or the source log itself says the situation was still materially in flux
- produce forecasts for four horizons: `1 week`, `1 month`, `3 months`, and `1 year`
- create `2` to `4` mutually exclusive scenarios for each horizon
- assign a probability to every scenario, with probabilities summing to `100%` within each horizon
- keep probabilities coarse enough to be defensible, usually in `5%` or `10%` steps
- explain why each scenario is plausible from the current situation and what signals would raise or lower its probability
- distinguish sourced facts from inference

7. Save each finished forecast with `$daily-report-logger`.
After a worker completes its forecast, have it save the result through the sibling logger skill. Use these defaults:

- `report`: `{source-report}-forecast`
- `title`: `{Source Title} Forecast`
- `source_skill`: `focus-events-forecast`
- `summary`: 1 to 2 sentences capturing the lead scenario and main uncertainty
- `request`: the original user request
- `output`: the final forecast
- `notes`: source log path, source log date, refresh status, and `(none)` when there is nothing extra to add

When a deterministic write is helpful, use the logger helper directly:

```bash
tmp_request="$(mktemp)"
tmp_output="$(mktemp)"
tmp_notes="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_FORECAST" > "$tmp_output"
printf '%s' "$NOTES" > "$tmp_notes"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "${SOURCE_REPORT}-forecast" \
  --title "$FORECAST_TITLE" \
  --source-skill "focus-events-forecast" \
  --summary "$SUMMARY" \
  --request-file "$tmp_request" \
  --output-file "$tmp_output" \
  --notes-file "$tmp_notes"
```

This writes to `history/daily/mm-dd-yyyy/{source-report}-forecast-log.md`.

8. Wait efficiently and synthesize at the parent level.
Use a single `wait_agent` call across all worker IDs. The parent agent owns the final synthesis. Return a short completion summary that lists the generated forecast logs, the lead scenario for each domain, and any workers that failed or were skipped.

## Worker Prompt Template

Adapt this template for each selected source log:

```text
You are responsible for one forecast only. Do not spawn more agents.

Source log:
- Report key: SOURCE_REPORT
- Path: SOURCE_LOG_PATH
- Requested date: RESOLVED_DATE

User request:
USER_REQUEST

Forecast requirements:
1. Read the source log and extract the current situation, major drivers, catalysts, evidence window, and caveats.
2. Use the source log as the baseline state unless it is stale or the user explicitly wants a live refresh.
3. Produce four horizon sections: 1 week, 1 month, 3 months, and 1 year.
4. For each horizon, create 2 to 4 mutually exclusive scenarios with probabilities that sum to 100% for that horizon.
5. Keep scenario labels event-driven and specific. Explain why each path is plausible and what signals would confirm or weaken it.
6. Open FORECAST_FRAMEWORK_PATH if you want a reusable scenario and probability rubric.
7. Save the final forecast with $daily-report-logger at LOGGER_SKILL_PATH using report key SOURCE_REPORT-forecast.

Return only:
- the finished forecast
- the saved log path
- any short caveat that materially affects confidence
```

## Output Shape

Ask workers to return forecasts in this shape:

- `Current Situation`: short synthesis of the baseline state from the source log
- `Forecast Horizons`: four subsections for `1 week`, `1 month`, `3 months`, and `1 year`
- `Scenario` entries inside each horizon: label, probability, reasoning, and signposts
- `Most Likely Path`: one short paragraph naming the lead scenario across the near term
- `Markers To Watch`: catalysts or observations that would change the forecast
- `Confidence`: `high`, `medium`, or `low`

The parent agent should return a short orchestration summary that names the generated forecast files and highlights the most likely path for each completed domain.

## Guardrails

- Do not recurse into more forecast workers from inside a worker.
- Do not copy the focus log verbatim and call it a forecast.
- Do not let probabilities for one horizon bleed into another. Each horizon has its own `100%` probability budget.
- Do not use false precision when the evidence does not justify it.
- Do not claim a refreshed current state unless a refresh actually happened.
- Do not silently skip saving the result. If the logger step fails, say so explicitly.
- Do not replace the worker fan-out with local execution just because the scope is small; this skill is defined as a delegated workflow.
