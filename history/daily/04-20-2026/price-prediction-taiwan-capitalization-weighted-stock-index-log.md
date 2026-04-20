---
report: "price-prediction-taiwan-capitalization-weighted-stock-index"
title: "Price Prediction: Taiwan Capitalization Weighted Stock Index"
log_date: "04-20-2026"
generated_at_utc: "2026-04-20T20:49:25Z"
source_skill: "price-prediction"
---

# Price Prediction: Taiwan Capitalization Weighted Stock Index Log

- Report: `price-prediction-taiwan-capitalization-weighted-stock-index`
- Date: `04-20-2026`
- Generated At: `2026-04-20T20:49:25Z`
- Source Skill: `price-prediction`

## Summary
Base case is a constructive but concentrated TAIEX path: oil and Fed pressure cap near-term upside, while AI infrastructure and semiconductor leadership keep the medium-term bias positive. The main uncertainty is whether Taiwan-specific or broader shipping and oil shocks overwhelm that support.

## Request
Use $price-prediction at /workspaces/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: TAIEX
- Label: Taiwan Capitalization Weighted Stock Index
- Asset class: index
- Watchlist file: /workspaces/finance/watchlists/products.yaml

User request:
Run the daily research pipeline for the exact UTC date 2026-04-20. This is the watchlist-price-predictions step only.

Execution notes:
- Use the exact date 2026-04-20.
- Read the available 2026-04-20 focus forecast logs as inputs.
- Verify a current reference price before forecasting.
- Persist the standard price-prediction log for this product.
- Return the finished product forecast summary, the saved log path if one was written, and any short caveat that materially affects confidence.

## Output
Resolved Product
Taiwan Capitalization Weighted Stock Index (`TAIEX`), Taiwan broad equity index.

Current Price
36,958.80 observed at 2026-04-20T20:45:37Z from the official Taiwan Index board and corroborated by the Taiwan Index Plus detail page and TWSE market API. The detail page says it updates every minute; because this check was after the Taiwan cash session close, I treat the level as the latest available official session quote rather than a live intraday print. Sources: https://taiwanindex.com.tw/en/indexes/board/twse , https://taiwanindex.com.tw/en/indexes/t00 , https://backend.taiwanindex.com.tw/api/indexes?lang=en&market=twse

Forecast Inputs
High relevance: [market-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/market-focus-forecast-log.md) and [tech-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/tech-focus-forecast-log.md), because TAIEX is highly sensitive to semiconductors, AI hardware demand, global growth, and rate conditions.
Medium relevance: [political-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/political-focus-forecast-log.md), mainly through Iran/Hormuz, oil, shipping, and Fed-risk-asset spillovers rather than U.S. domestic fights themselves.
Low relevance: [science-focus-forecast-log.md](/workspaces/finance/history/daily/04-20-2026/science-focus-forecast-log.md), mostly as background innovation and funding context.

Price Targets

1 week
- Dominant scenario: Hormuz remains contested but not closed, while Google Cloud Next and broader AI infrastructure commentary keep semiconductor demand expectations firm.
- Expected effect: oil and Fed caution cap broad upside, but large semiconductor leaders keep TAIEX near highs.
- Target price: 37,200
- Likely range: 36,200 to 38,100
- Confidence: medium

1 month
- Dominant scenario: oil stays somewhat elevated into May and the Fed stays patient, but inference and AI-capex confirmation keep Taiwan hardware names in leadership.
- Expected effect: TAIEX retests and modestly clears recent highs, with gains still concentrated in TSMC-linked and AI hardware names.
- Target price: 38,400
- Likely range: 35,800 to 39,600
- Confidence: medium

3 months
- Dominant scenario: managed geopolitical instability persists, but AI infrastructure and custom inference-silicon demand remain strong enough to support semiconductors, servers, packaging, and electronics exporters.
- Expected effect: earnings and capex support a continued grind higher rather than a broad speculative melt-up.
- Target price: 40,800
- Likely range: 37,000 to 42,800
- Confidence: medium

1 year
- Dominant scenario: the 2026 oil shock fades without breaking global growth, and Taiwan AI supply-chain leaders keep capturing earnings growth, though from an already elevated base.
- Expected effect: constructive structural uptrend, but more earnings-led and more volatile than the last leg higher.
- Target price: 43,500
- Likely range: 34,000 to 48,500
- Confidence: low

Most Likely Path
Base case is a constructive but concentrated TAIEX path. The 2026-04-20 market and political forecasts keep near-term oil and rate pressure high enough to limit broad participation, while the tech forecast remains supportive for the semiconductor and AI hardware complex that dominates the index. That points to choppy upside over the next month, a firmer three-month bid if AI capex keeps confirming, and a positive but less explosive one-year path.

What Would Change The Call
- Raise the forecast: a credible Strait of Hormuz normalization, Brent moving decisively lower, softer U.S. yields, or stronger evidence after Google Cloud Next that AI infrastructure demand is broadening.
- Lower the forecast: Brent sustaining another leg higher, renewed shipping disruption, a more hawkish April 28-29, 2026 FOMC response to energy-driven inflation, or signs that tighter global financial conditions are compressing semiconductor multiples.
- Invalidate the forecast: a material break in AI capex or major Taiwan foundry-order strength, a Taiwan-specific policy or regulatory shock, or cross-Strait escalation large enough to dominate the global scenarios in today's logs.

Confidence
Medium. Directional support is decent because the 2026-04-20 market and tech logs map well to TAIEX's composition, but confidence is capped because the index is highly concentrated and today's logs do not directly cover Taiwan-specific FX, policy, or cross-Strait risk.

## Notes
Product type: Taiwan equity index.
Price source 1: official Taiwan Index board at https://taiwanindex.com.tw/en/indexes/board/twse
Price source 2: official Taiwan Index Plus detail page at https://taiwanindex.com.tw/en/indexes/t00
Price source 3: official Taiwan Index API at https://backend.taiwanindex.com.tw/api/indexes?lang=en&market=twse
Observed price: 36,958.80
Observed change: +154.46 (+0.42%)
Retrieved at: 2026-04-20T20:45:37Z
Reference-price classification: official real-time quote source observed after local market close, so used as the latest available session level.
Additional source detail: the detail page says it updates automatically every minute, and the page source currently embeds `2026/04/20 13:33:00` alongside the TAIEX quote data.
Forecast logs used:
- /workspaces/finance/history/daily/04-20-2026/market-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/political-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/tech-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/science-focus-forecast-log.md
Missing domains: none.
Major assumptions: `market` and `tech` are primary for TAIEX because of semiconductor concentration; `political` is secondary through oil, shipping, and rate transmission; `science` is low relevance; Taiwan-specific FX, regulatory, and cross-Strait risks are inference rather than directly sourced from the 2026-04-20 focus forecasts.
