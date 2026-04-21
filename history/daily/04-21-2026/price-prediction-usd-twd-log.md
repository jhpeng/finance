---
report: "price-prediction-usd-twd"
title: "Price Prediction: USD/TWD"
log_date: "04-21-2026"
generated_at_utc: "2026-04-21T04:07:31Z"
source_skill: "price-prediction"
---

# Price Prediction: USD/TWD Log

- Report: `price-prediction-usd-twd`
- Date: `04-21-2026`
- Generated At: `2026-04-21T04:07:31Z`
- Source Skill: `price-prediction`

## Summary
Base case is a modest near-term rebound higher in USD/TWD toward the upper 31s as persistent oil and rate pressure outweigh fragile Iran de-escalation, then a flatter to slightly lower one-year pair if Taiwan's AI-export leverage reasserts itself. The main uncertainty is that the 2026-04-21 forecast logs are strong on global macro and geopolitics but thin on Taiwan-specific FX flow and central-bank drivers.

## Request
Use $price-prediction at /workspaces/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: USDTWD
- Label: USD/TWD
- Asset class: currency
- Watchlist file: /workspaces/finance/watchlists/products.yaml
- Requested date: 2026-04-21

User request:
Run the repo's daily research pipeline for the exact UTC date 2026-04-21. This watchlist step should generate the normal saved price prediction for this product.

Execution notes:
- Preserve the exact date 2026-04-21 when reading forecast logs.
- Verify a live/current reference price before forecasting.
- Save the result to the normal daily log location.
- Return the finished product forecast summary, the saved log path if one was written, and any short caveat that materially affects confidence.

## Output
Resolved Product
USD/TWD (`USDTWD`), a U.S. dollar versus New Taiwan dollar currency pair.

Current Price
31.4598 TWD per USD, observed on Google Finance at 2026-04-21 03:51:00 UTC as an intraday quote snapshot for `USD/TWD`. Cross-check: Investing.com's `USD/TWD` page showed 31.467 and labeled it `Real-time Data` when retrieved on 2026-04-21 UTC.

Forecast Inputs
High relevance: market and political forecast logs from 04-21-2026, because oil, U.S. yields, and Iran/Hormuz de-escalation or re-escalation are the most direct drivers for an energy-importing Asian currency pair.
Medium relevance: tech forecast, because Taiwan's semiconductor and AI-capex exposure can support TWD through export and equity-flow sentiment, especially beyond one month.
Low relevance: science forecast, mostly background and not a direct FX driver.

Price Targets

1 week
Dominant scenario: narrow Iran de-escalation holds just long enough to avoid a fresh oil spike, but the oil premium stays high enough to keep U.S. yields and the dollar firm while AI and semiconductor demand limits TWD underperformance. `Market` is the primary driver and `political` is the main short-horizon amplifier.
Expected effect: modest upside in USD/TWD from the current level, but less than a full crisis retrace because the lead political path is fragile containment rather than renewed escalation.
Target price: 31.60
Likely range: 31.30 to 31.85
Confidence: medium

1 month
Dominant scenario: persistent $90-plus oil and restrictive-rate pricing keep Asian FX somewhat heavy, while Google Cloud Next follow-through and continued AI infrastructure demand keep Taiwan's external-tech story intact. `Market` remains primary, with `tech` as the main offset.
Expected effect: drift back toward the recent monthly average rather than a breakout, with USD/TWD modestly higher than spot.
Target price: 31.78
Likely range: 31.25 to 32.25
Confidence: medium

3 months
Dominant scenario: managed summer instability in Gulf shipping keeps a residual dollar and oil premium in place, but Taiwan still benefits from a capex-led AI cycle and semiconductor export resilience. This horizon relies more on inference than on direct Taiwan-specific scenario support from the logs.
Expected effect: moderately above the current price, but not a disorderly TWD selloff unless oil or shipping disruption worsens materially.
Target price: 31.95
Likely range: 31.10 to 32.90
Confidence: low

1 year
Dominant scenario: the energy shock leaves a somewhat higher floor than markets wanted, yet Taiwan's AI and chip exposure continues to attract export and equity support once the acute geopolitical premium fades. `Market` still anchors the regime, but `tech` becomes the most important secondary driver at this horizon.
Expected effect: USD/TWD edges lower from current stress-inflated levels, though less sharply than a pure disinflation scenario would imply because today's market forecast still points to a higher energy floor.
Target price: 31.15
Likely range: 29.90 to 32.60
Confidence: low

Most Likely Path
Base case is a modest near-term rebound higher in USD/TWD as oil stays expensive enough to keep the dollar firm against Asian FX, but the upside is capped because the lead political scenario is de-escalation rather than fresh war expansion and the tech forecast still supports Taiwan via AI and semiconductor demand. Over longer horizons, the most likely outcome is a flatter-to-slightly-lower pair once acute Gulf stress fades, not a sustained one-way USD breakout.

What Would Change The Call
Raise the call: ceasefire failure, renewed Hormuz disruption, Brent breaking decisively above $100, firmer U.S. inflation or yields, or weaker Taiwan export and equity-flow data.
Lower the call: durable shipping normalization, Brent retreat toward the mid-$80s, softer U.S. growth or yields, stronger AI and semiconductor demand, or sustained foreign inflows into Taiwan equities.
Invalidate the call: Taiwan-specific policy or geopolitical shocks, aggressive central-bank management that overwhelms market pricing, or a global downturn that breaks the usual oil/rates/tech relationship for TWD.

Confidence
Low.

## Notes
Product type: currency pair.
Primary price source: Google Finance `USD/TWD` page at https://www.google.com/finance/quote/USD-TWD
Observed quote details: 31.4598 at Apr 21, 2026 03:51:00 UTC. I am treating this as a current intraday quote snapshot; the extracted page lines did not explicitly state a delay status.
Secondary price source: Investing.com `USD/TWD` page at https://www.investing.com/currencies/usd-twd
Observed cross-check: 31.467, +0.033 (+0.10%), labeled `Real-time Data·23:45:19`, retrieved during the same 2026-04-21 UTC session; the page did not specify a timezone for `23:45:19` in the extracted lines.
Forecast logs used:
- /workspaces/finance/history/daily/04-21-2026/market-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/political-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/tech-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/science-focus-forecast-log.md
Missing domains: none.
Major assumptions: market is high relevance; political is high relevance for the short horizon and medium thereafter because Iran/Hormuz risk matters more than the domestic U.S. constitutional items; tech is medium relevance because Taiwan's semiconductor and AI-export sensitivity can materially support TWD; science is low relevance. Confidence beyond one month is capped because the available 2026-04-21 forecasts are global and U.S.-centric rather than Taiwan-central-bank, insurer-flow, or local macro forecasts.
