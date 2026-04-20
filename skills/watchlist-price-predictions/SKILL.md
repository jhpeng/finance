---
name: watchlist-price-predictions
description: Run `$price-prediction` for every product in `watchlists/products.yaml` by reading the watchlist, selecting the requested entries, spawning one sub-agent per product, summarizing the completed forecasts, and saving one combined batch summary through `$daily-report-logger`. Use when Codex needs batch price predictions for a saved watchlist, a reusable list of symbols, or a portfolio-style set of products instead of forecasting one product at a time.
---

# Watchlist Price Predictions

## Overview

Run `$price-prediction` across a saved watchlist. Read `watchlists/products.yaml`, pick the matching products, delegate one forecast per product to a fresh sub-agent, return a concise summary of the completed product forecasts, and save the combined batch result with `$daily-report-logger`.

## Delegation Contract

Treat an explicit `/watchlist-price-predictions` invocation, or an explicit request to use `$watchlist-price-predictions`, as the user's consent to delegated parallel agent work for this workflow.

- Always use sub-agents for this skill when at least one matching watchlist product exists.
- Spawn exactly one fresh worker per selected product for the first pass, even if only one product is selected.
- Do not silently fall back to running `$price-prediction` locally. If sub-agents are unavailable, stop and say that `watchlist-price-predictions` requires sub-agents for execution.
- Keep orchestration and final synthesis in the parent agent. Only per-product forecasting is delegated.
- Do not set `model` or `reasoning_effort` on `spawn_agent`. Omitting both preserves the parent agent's current model and reasoning effort, which is required for this skill.

## Workflow

1. Resolve the watchlist scope.
Default to the repo watchlist at `watchlists/products.yaml`. If the user provides a different file path, use it. Unless the user explicitly asks otherwise, select only products whose `enabled` field is `true`. If the user names specific symbols or products, filter to those entries first and say which ones matched.

2. Discover watchlist products.
Run [scripts/find_watchlist_products.sh](scripts/find_watchlist_products.sh). By default it prints tab-separated `symbol<TAB>label<TAB>asset_class<TAB>enabled` rows from the watchlist file in file order.

Useful options:

- `--path FILE` to use a different watchlist file
- `--enabled-only` to keep only enabled products
- `--symbols CSV` to filter to a comma-separated symbol list
- `--symbols-only` when only the symbol values are needed

If the watchlist file is missing, empty, or contains no matching rows after filtering, say so plainly and stop.

3. Select products to forecast.
Treat each selected row as one independent forecast job. Preserve file order unless the user asks for a specific subset or priority. If some requested symbols are missing from the watchlist, mention the missing ones and continue with the matched set unless none matched.

4. Prepare one worker per product.
Use a fresh `default` sub-agent for each selected product. Prefer `fork_context: false` and pass only the context each worker needs:

- the original user request
- the absolute path to the watchlist file
- the product `symbol`, `label`, and `asset_class`
- the absolute path to the sibling `$price-prediction` skill

Each worker should handle exactly one product and should not spawn more agents.

5. Spawn workers in parallel.
This fan-out is mandatory for this skill whenever at least one product is selected. Preserve the parent agent's model and reasoning effort by omitting `model` and `reasoning_effort` on `spawn_agent`. If the user asked not to persist logs, pass that instruction through to every worker and also suppress the parent batch log.

6. Instruct workers to run `$price-prediction`.
Ask each worker to use `$price-prediction` for its assigned product. The worker should preserve the user's requested date, horizon emphasis, and logging preference. Workers should return:

- the resolved product name and symbol
- the observed current price summary from `$price-prediction`
- the four horizon targets or the directional fallback when price verification was not possible
- the saved log path when a log was written
- any short caveat that materially changes confidence

7. Wait efficiently and synthesize at the parent level.
Use one `wait_agent` call across all worker IDs. The parent agent owns the final synthesis. Return a concise batch summary that lists:

- the watchlist file used
- the products processed
- one short outcome line per completed product
- failed or skipped products and the reason
- the generated `price-prediction-*` log paths when available

8. Save the batch summary with `$daily-report-logger`.
After producing the combined summary, save it unless the user explicitly asked not to persist logs. The parent agent owns this save step.

Use these defaults:

- `report`: `watchlist-price-predictions-{watchlist-slug}`
- `title`: `Watchlist Price Predictions: {watchlist-name}`
- `source_skill`: `watchlist-price-predictions`
- `summary`: 1 to 2 sentences capturing the dominant cross-product pattern and the biggest uncertainty
- `request`: the original user request
- `output`: the final batch summary
- `notes`: watchlist path, selection rule, product count, completed symbols, failed symbols, and generated per-product log paths

Derive `{watchlist-slug}` from the watchlist file basename without the extension. For the default `watchlists/products.yaml`, the saved file should normally be `history/daily/mm-dd-yyyy/watchlist-price-predictions-products-log.md`.

When a deterministic write is helpful, call the logger helper directly:

```bash
watchlist_name="$(basename -- "$WATCHLIST_PATH")"
watchlist_name="${watchlist_name%.*}"
watchlist_slug="$(printf '%s' "$watchlist_name" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-{2,}/-/g')"

tmp_request="$(mktemp)"
tmp_output="$(mktemp)"
tmp_notes="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_BATCH_SUMMARY" > "$tmp_output"
printf '%s' "$NOTES" > "$tmp_notes"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "watchlist-price-predictions-${watchlist_slug}" \
  --title "Watchlist Price Predictions: ${watchlist_name}" \
  --source-skill "watchlist-price-predictions" \
  --summary "$SUMMARY" \
  --request-file "$tmp_request" \
  --output-file "$tmp_output" \
  --notes-file "$tmp_notes"
```

Tell the user which combined summary log path was written. If the save fails, say so explicitly.

## Worker Prompt Template

Adapt this template for each selected product:

```text
Use $price-prediction at PRICE_SKILL_PATH to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: PRODUCT_SYMBOL
- Label: PRODUCT_LABEL
- Asset class: PRODUCT_ASSET_CLASS
- Watchlist file: WATCHLIST_PATH

User request:
USER_REQUEST

Execution notes:
- Preserve any explicit date, horizon emphasis, and logging preference from the user.
- Return the finished product forecast summary, the saved log path if one was written, and any short caveat that materially affects confidence.
```

## Output Shape

Return a concise orchestration summary with these sections:

- `Watchlist`: file path and selection rule
- `Products Run`: the selected symbols and labels
- `Forecast Summary`: one short subsection per completed product
- `Failures Or Skips`: missing watchlist rows, worker failures, or logging failures
- `Generated Logs`: list the saved `price-prediction-*` logs when available
- `Batch Summary Log`: the saved combined watchlist summary log path, or a note that logging was suppressed

## Guardrails

- Do not bypass the worker fan-out and run `$price-prediction` locally.
- Do not set `model` or `reasoning_effort` on spawned workers.
- Do not silently include disabled products unless the user explicitly asks for them.
- Do not silently drop watchlist entries that failed; report them.
- Do not invent a saved log path if the worker did not write one.
- Do not silently skip the parent `$daily-report-logger` save step unless the user explicitly asked not to persist logs.
- Do not change the watchlist file as part of this workflow.
