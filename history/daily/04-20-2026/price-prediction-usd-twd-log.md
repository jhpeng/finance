---
report: "price-prediction-usd-twd"
title: "Price Prediction: USD/TWD"
log_date: "04-20-2026"
generated_at_utc: "2026-04-20T20:50:46Z"
source_skill: "price-prediction"
---

# Price Prediction: USD/TWD Log

- Report: `price-prediction-usd-twd`
- Date: `04-20-2026`
- Generated At: `2026-04-20T20:50:46Z`
- Source Skill: `price-prediction`

## Summary
Base case is a modest near-term rebound higher in USD/TWD from the April 20 low as oil, Fed-hold risk, and geopolitical stress outweigh tech support, followed by a lower one-year pair if the oil shock fades and Taiwan's AI-export leverage reasserts itself. The main uncertainty is whether Gulf friction becomes a durable higher-energy regime or whether AI-chip demand and Taiwan inflows overpower the dollar support sooner.

## Request
Run the daily research pipeline for the exact UTC date 2026-04-20. This is the watchlist-price-predictions step only.

Assigned product:
- Symbol: USDTWD
- Label: USD/TWD
- Asset class: currency
- Watchlist file: /workspaces/finance/watchlists/products.yaml

## Output
Resolved Product
USD/TWD (`USDTWD`), a U.S. dollar versus New Taiwan dollar currency pair.

Current Price
31.437 TWD per USD, retrieved at 2026-04-20 20:48:58 UTC from the Investing.com `USD/TWD` page. The source labeled the quote `Real-time Data·16:19:19` but did not specify a timezone, so I am treating 2026-04-20 20:48:58 UTC as the confirmed retrieval time. Cross-check: Wise's `USD to TWD` converter page retrieved in the same session showed a mid-market rate of 31.48.

Forecast Inputs
High relevance: [market-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/market-focus-forecast-log.md), because oil, Fed repricing, global risk appetite, and shipping stress are the most direct cross-asset drivers for Taiwan-sensitive FX.
Medium relevance: [tech-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/tech-focus-forecast-log.md), because Taiwan's currency is materially influenced by semiconductor exports, AI capex, and related equity-flow sentiment.
Medium relevance: [political-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/political-focus-forecast-log.md), mainly as a secondary geopolitical amplifier through Iran and Hormuz risk; most U.S. domestic items are indirect for TWD.
Low relevance: [science-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/science-focus-forecast-log.md), mostly background and not a direct FX driver.

Price Targets

1 week
Dominant scenario: the Strait of Hormuz stays contested but not closed into the late-April Fed window, keeping oil elevated and leaving the dollar and risk hedges supported, while Google Cloud Next and ongoing AI-capex optimism stop Taiwan from underperforming sharply. `Market` is the primary driver and `tech` is the main offset.
Expected effect: mild upside in USD/TWD from the current low end of the recent range as energy-import pressure and macro caution slightly outweigh semiconductor support.
Target price: 31.70
Likely range: 31.30 to 31.95
Confidence: medium

1 month
Dominant scenario: the Fed holds and persistent oil premium keeps the longer-hold narrative in place, but the inference-buildout and custom-silicon story remains constructive enough for Taiwan to avoid a larger FX drawdown. `Market` remains primary, with `tech` secondary and `political` mostly tail-risk amplification.
Expected effect: modestly higher than the current level, with USD/TWD drifting back toward its recent monthly average rather than breaking out.
Target price: 31.85
Likely range: 31.20 to 32.40
Confidence: medium

3 months
Dominant scenario: Gulf friction becomes a medium-term stagflation overhang while custom inference silicon becomes a durable second leg of AI spending. This leaves USD/TWD caught between macro dollar support and stronger Taiwan semiconductor fundamentals. This horizon relies more on inference than on direct Taiwan-specific scenario support from the logs.
Expected effect: moderately above the current price, but not a disorderly TWD selloff unless the energy shock worsens materially.
Target price: 32.05
Likely range: 31.10 to 33.00
Confidence: low

1 year
Dominant scenario: the 2026 oil shock fades enough for global growth and disinflation to normalize, while AI and chip demand remain structurally supportive for Taiwan exports and equity inflows. `Market` is still the anchor, but `tech` becomes the most important secondary driver at this horizon.
Expected effect: USD/TWD moves lower from current macro-stress levels as Taiwan's external-tech leverage reasserts itself once short-run energy and Fed pressure ease.
Target price: 30.90
Likely range: 29.60 to 32.30
Confidence: low

Most Likely Path
Base case is a mild near-term rebound higher in USD/TWD from the April 20 trough area as oil, shipping risk, and a Fed-on-hold backdrop keep the dollar better supported than Taiwan's energy-import-sensitive currency. That upside is capped, though, because the same-day tech forecast still points to durable AI and semiconductor demand, which should help Taiwan relative performance. Over a one-year horizon, the more likely path is renewed TWD strength if the oil shock proves temporary rather than structural.

What Would Change The Call
Raise the call: a fresh Hormuz disruption, Brent holding above roughly $100, stronger U.S. inflation or yield repricing, broader Asia risk-off trading, or weaker Taiwan export and chip-demand follow-through.
Lower the call: verified shipping normalization, oil retreating back toward the mid-$80s, softer U.S. growth or yields, stronger-than-expected AI and semiconductor demand, or sustained foreign inflows into Taiwan equities.
Invalidate the call: a Taiwan-specific geopolitical shock, heavy currency management that overwhelms market pricing, or a global downturn that breaks the usual relationship between U.S. rates, chip demand, and TWD.

Confidence
Medium.

## Notes
Product type: currency pair.
Primary price source: Investing.com `USD/TWD` page at https://www.investing.com/currencies/usd-twd-historical-data
Observed quote details: 31.437, change -0.044 (-0.14%), labeled `Real-time Data·16:19:19`, daily range 31.409 to 31.569, previous close 31.480, retrieved at 2026-04-20 20:48:58 UTC. The page did not specify a timezone for `16:19:19`.
Secondary price source: Wise `USD to TWD` converter at https://wise.com/us/currency-converter/usd-to-twd-rate
Observed cross-check: mid-market exchange rate 31.48 on retrieval during the same session; 30-day high 32.0540, 30-day low 31.4800, 90-day high 32.1340, 90-day low 31.1125.
Forecast logs used:
- /workspaces/finance/history/daily/04-20-2026/market-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/political-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/tech-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/science-focus-forecast-log.md
Missing domains: none.
Major assumptions: market is high relevance; tech and political are medium relevance; science is low relevance; Taiwan's semiconductor and AI-export exposure can support TWD even when oil and U.S. rates are dollar-positive; confidence beyond one month is capped because the April 20 forecast logs are global and U.S.-centric rather than Taiwan-specific macro forecasts.
