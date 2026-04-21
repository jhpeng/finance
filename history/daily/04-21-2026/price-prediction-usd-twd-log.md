---
report: "price-prediction-usd-twd"
title: "Price Prediction: USD/TWD"
log_date: "04-21-2026"
generated_at_utc: "2026-04-21T04:46:58Z"
source_skill: "price-prediction"
---

# Price Prediction: USD/TWD Log

- Report: `price-prediction-usd-twd`
- Date: `04-21-2026`
- Generated At: `2026-04-21T04:46:58Z`
- Source Skill: `price-prediction`

## Summary
Base case is a mild near-term USD/TWD rise toward the mid-31s as elevated oil and dollar support outweigh Taiwan's tech resilience, then a flatter-to-slightly-lower pair on a one-year view as the geopolitical premium fades. Confidence is capped by limited Taiwan-specific FX and central-bank inputs in today's forecast logs.

## Request
Use $price-prediction at /workspaces/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: USDTWD
- Label: USD/TWD
- Asset class: currency
- Watchlist file: /workspaces/finance/watchlists/products.yaml

User request:
/daily-research-pipeline

Execution notes:
- Use the 2026-04-21 forecast logs already generated under /workspaces/finance/history/daily/04-21-2026.
- Preserve the exact date 2026-04-21.
- Verify the current reference price with live tools or authoritative current web sources.
- Save the final result for 2026-04-21 using the repo's daily logger conventions.
- Return the finished product forecast summary, the saved log path, and any short caveat that materially affects confidence.

## Output
Resolved Product
USD/TWD (`USDTWD`), a U.S. dollar versus New Taiwan dollar currency pair.

Current Price
31.4505 TWD per USD, observed on Google Finance at 2026-04-21 04:44:00 UTC as an intraday quote snapshot for `USD/TWD`. Cross-check: Investing.com's `USD/TWD` page showed 31.457, +0.023 (+0.07%), labeled `Real-time Data` when retrieved during the same UTC session. Official latest published interbank closing rate from Taiwan's central bank was 31.531 on 2026-04-20.

Forecast Inputs
High relevance: market and political forecast logs from 04-21-2026, because oil, U.S. yield expectations, and Iran/Hormuz headline risk are the most direct short-horizon drivers for an Asian importer currency pair.
Medium relevance: tech forecast, because Taiwan's AI and semiconductor export backdrop can support TWD through trade and equity-flow sentiment, especially beyond one month.
Low relevance: science forecast, mostly background and not a direct FX driver.

Price Targets

1 week
Dominant scenario: managed instability persists, with oil risk elevated enough to keep the dollar firm while the lead political path remains fragile containment rather than a fresh war expansion. `Market` is the primary driver and `political` is the main short-horizon amplifier.
Expected effect: modest rebound higher in USD/TWD from the current intraday spot, but upside remains capped without a renewed Gulf supply shock.
Target price: 31.60
Likely range: 31.32 to 31.85
Confidence: medium

1 month
Dominant scenario: persistent elevated oil and slower Fed-cut pricing keep Asian FX somewhat heavy, while Taiwan's export-tech resilience limits TWD downside. `Market` remains primary, with `tech` as the main offset.
Expected effect: drift modestly above spot and closer to recent official closes rather than a disorderly breakout.
Target price: 31.75
Likely range: 31.25 to 32.20
Confidence: medium

3 months
Dominant scenario: a residual energy-risk premium and firm dollar conditions persist into summer, but AI-capex and chip-export support keep TWD from a disorderly selloff. This horizon relies more on inference than on direct Taiwan-specific scenario support from today's logs.
Expected effect: moderately above the current price, but not a breakout unless Gulf shipping or oil stress worsens materially.
Target price: 31.90
Likely range: 31.05 to 32.80
Confidence: low

1 year
Dominant scenario: the acute oil-risk premium fades while Taiwan's AI and semiconductor cycle continues to support exports and equity inflows, partially offset by a somewhat higher structural energy floor. `Market` still anchors the regime, but `tech` becomes the most important secondary driver at this horizon.
Expected effect: USD/TWD edges lower from current stress-affected levels, though not into a deep TWD appreciation regime.
Target price: 31.10
Likely range: 29.90 to 32.50
Confidence: low

Most Likely Path
Base case is a mild near-term USD/TWD grind higher from the current intraday quote as managed Gulf instability keeps oil and the dollar supported, but not a sustained one-way breakout because the political base case is fragile containment rather than renewed war expansion and Taiwan's tech/export backdrop remains supportive. Over longer horizons, the most likely outcome is a flatter-to-slightly-lower pair once the acute geopolitical premium fades.

What Would Change The Call
Raise the call: ceasefire failure, visible Hormuz disruption, Brent decisively above $100, firmer U.S. inflation or yields, or weaker Taiwan export and equity-flow data.
Lower the call: durable shipping normalization, Brent retreat toward the mid-$80s, softer U.S. growth or yields, stronger AI-capex spillover into Taiwan exports, or sustained foreign inflows into Taiwan equities.
Invalidate the call: Taiwan-specific policy or geopolitical shocks, aggressive central-bank management that overwhelms market pricing, or a global downturn that breaks the usual oil/rates/export relationship.

Confidence
Low.

## Notes
Product type: currency pair.
Primary price source: Google Finance `USD/TWD` page at https://www.google.com/finance/quote/USD-TWD
Observed quote details: 31.4505 at Apr 21, 2026 04:44:00 UTC. I am treating this as a current intraday quote snapshot; the extracted page does not explicitly state a delay.
Secondary price source: Investing.com `USD/TWD` page at https://www.investing.com/currencies/usd-twd
Observed cross-check: 31.457, +0.023 (+0.07%), labeled `Real-time Data·00:23:19`, retrieved during the same 2026-04-21 UTC session; the page does not specify a timezone for `00:23:19` in the extracted lines.
Official recent close: Central Bank of the Republic of China (Taiwan) `NT$/US$ Closing Rate` page at https://www.cbc.gov.tw/en/lp-700-2-1-60.html showed 31.531 for 2026/04/20 and was updated on 2026-04-20.
Forecast logs used:
- /workspaces/finance/history/daily/04-21-2026/market-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/political-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/tech-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/science-focus-forecast-log.md
Missing domains: none.
Major assumptions: market is high relevance; political is high relevance for the short horizon and medium thereafter because Iran/Hormuz risk matters more than the domestic U.S. political threads for FX; tech is medium relevance because Taiwan's semiconductor and AI-export sensitivity can materially support TWD; science is low relevance. Confidence beyond one month is capped because the available 2026-04-21 forecasts are global and U.S.-centric rather than Taiwan-central-bank, insurer-flow, or local macro forecasts.
