---
name: price-prediction
description: Forecast the future price of a user-specified product such as a stock, bond, fund, ETF, commodity, currency, crypto asset, or other traded instrument by reading today's `*-focus-forecast-log.md` files, translating the most relevant domain scenarios into product-specific price behavior, producing 1-week, 1-month, 3-month, and 1-year price targets, and saving the result through `$daily-report-logger`. Use when Codex gets requests like `/price-prediction GLD`, "predict NVDA next month", or "what is the 1-year price outlook for TLT?".
---

# Price Prediction

## Overview

Turn today's forecast logs into a product-specific price outlook. Resolve the instrument, verify a live reference price, read every available `*-focus-forecast-log.md` for the requested date, decide which domain scenarios matter most for the product, convert the dominant path into four horizon price targets, and save the finished report through `$daily-report-logger`.

## Workflow

1. Resolve the product.
Use the exact product name, ticker, or identifier the user supplied. Infer the asset class and venue when it is obvious from context. If the symbol is genuinely ambiguous or maps to multiple instruments with different prices, stop and ask for clarification before forecasting.

2. Verify the live reference price.
Price data is time-sensitive, so confirm the current reference price before making any forecast.

- Prefer the `finance` tool for equities, ETFs, funds, indexes, and crypto when it supports the instrument.
- Use current web sources for bonds, commodities, currencies, thinly covered funds, or unsupported products.
- Record the exact observed price, the source, and whether it was a live quote, intraday delayed quote, or latest close.

3. Discover today's forecast logs.
Run [scripts/find_forecast_logs.sh](scripts/find_forecast_logs.sh). By default it uses the current UTC date and returns tab-separated `report-key<TAB>absolute-path` rows for every `*-focus-forecast-log.md` file under `history/daily/mm-dd-yyyy/`.

If the user asks for a specific date, pass `--date MM-DD-YYYY` or `--date YYYY-MM-DD`. If no forecast logs exist for that date, say so plainly and suggest generating them first with `$focus-events-forecast`.

4. Read every available forecast log and rank its relevance.
Use every discovered domain forecast as an input, but do not force equal weight across domains. For each log, assign a relevance level such as `high`, `medium`, or `low` based on how directly that domain should affect the product.

Typical relevance patterns:

- Gold or oil funds: usually `market` and `political` are highest.
- Broad equity ETFs: usually `market` is highest, with `tech`, `political`, or `science` as secondary depending on concentration.
- Semiconductors or software stocks: usually `tech` and `market` are highest.
- Treasury or bond funds: usually `market` and `political` are highest because rates, inflation, and policy dominate.
- Biotech or healthcare names: usually `science`, `market`, and `political` all matter.

Open [references/price-impact-framework.md](references/price-impact-framework.md) when you need a compact weighting rubric or help converting cross-domain scenarios into price targets.

5. Extract the lead scenario from each relevant log for each horizon.
For `1 week`, `1 month`, `3 months`, and `1 year`, identify the highest-probability scenario from each domain log and the causal chain that matters for the product. Keep sourced statements separate from inference.

6. Build one dominant product path per horizon.
Combine the lead scenarios into a single product-centric outlook for each horizon.

- Start with the highest-relevance domains.
- Reconcile conflicting domain signals instead of averaging them blindly.
- Do not multiply scenario probabilities across logs as if the domains were independent.
- State which domain most strongly drives the final call for that horizon.

7. Translate the dominant path into price targets.
Produce numeric targets for `1 week`, `1 month`, `3 months`, and `1 year`.

Best practices:

- Anchor every target to the verified current price.
- Include a likely range around the target when it helps show uncertainty.
- Keep precision sensible for the instrument.
- Explain the expected direction and the main causal drivers.
- Downgrade confidence when the product is unusually idiosyncratic relative to the available domain logs.

If you cannot verify a defensible current price, do not invent one. Say what is missing and give only a directional scenario analysis if that is still useful.

8. Save the result with `$daily-report-logger`.
After returning the analysis, save the same final content unless the user explicitly asks you not to create a log.

Use these defaults:

- `report`: `price-prediction-{product-slug}`
- `title`: `Price Prediction: {product}`
- `source_skill`: `price-prediction`
- `summary`: 1 to 2 sentences naming the dominant path and the most important uncertainty
- `request`: the original user request
- `output`: the final forecast
- `notes`: product type, price source and timestamp, forecast log paths used, missing domains, and major assumptions

When a deterministic write is helpful, call the logger helper directly:

```bash
product_slug="$(printf '%s' "$PRODUCT_LABEL" \
  | tr '[:upper:]' '[:lower:]' \
  | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-{2,}/-/g')"

tmp_request="$(mktemp)"
tmp_output="$(mktemp)"
tmp_notes="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_FORECAST" > "$tmp_output"
printf '%s' "$NOTES" > "$tmp_notes"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "price-prediction-${product_slug}" \
  --title "Price Prediction: ${PRODUCT_LABEL}" \
  --source-skill "price-prediction" \
  --summary "$SUMMARY" \
  --request-file "$tmp_request" \
  --output-file "$tmp_output" \
  --notes-file "$tmp_notes"
```

This writes to `history/daily/mm-dd-yyyy/price-prediction-{product-slug}-log.md`.

## Output Shape

Return the forecast in this shape:

- `Resolved Product`: name, symbol if available, and asset class
- `Current Price`: observed price, timestamp, and source
- `Forecast Inputs`: short note on which domain forecast logs were most relevant
- `Price Targets`: one subsection each for `1 week`, `1 month`, `3 months`, and `1 year`, with dominant scenario, expected effect, target price, range, and confidence
- `Most Likely Path`: one short paragraph summarizing the base case across horizons
- `What Would Change The Call`: catalysts that would raise, lower, or invalidate the forecast
- `Confidence`: `high`, `medium`, or `low`

## Guardrails

- Do not skip live price verification for modern tradable products.
- Do not treat all domain forecast logs as equally important by default.
- Do not pretend the forecast logs are independent probability trees that can be multiplied mechanically.
- Do not claim more precision than the evidence supports.
- Do not hide when a horizon relies more on inference than on direct scenario support from today's logs.
- Do not silently skip the logging step. If the save fails, say so explicitly.
