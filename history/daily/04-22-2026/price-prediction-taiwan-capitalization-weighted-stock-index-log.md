---
report: "price-prediction-taiwan-capitalization-weighted-stock-index"
title: "Price Prediction: Taiwan Capitalization Weighted Stock Index"
log_date: "04-22-2026"
generated_at_utc: "2026-04-22T07:43:29Z"
source_skill: "price-prediction"
---

# Price Prediction: Taiwan Capitalization Weighted Stock Index Log

- Report: `price-prediction-taiwan-capitalization-weighted-stock-index`
- Date: `04-22-2026`
- Generated At: `2026-04-22T07:43:29Z`
- Source Skill: `price-prediction`

## Summary
Base case is modestly bullish from the 2026-04-22 close as AI infrastructure demand supports Taiwan tech leadership, but oil, rates, and missing Taiwan-specific risk coverage cap confidence.

## Request
/daily-research-pipeline

Assigned product:
- Symbol: TAIEX
- Label: Taiwan Capitalization Weighted Stock Index
- Asset class: index
- Watchlist file: /Users/jhpeng/projects/ai/finance/watchlists/products.yaml

Execution date: 2026-04-22

## Output
## Resolved Product
Taiwan Capitalization Weighted Stock Index (`TAIEX`), asset class `index`.

## Current Price
I am anchoring the forecast to an official TWSE same-day close reference of **37,878.47** on **2026-04-22** from the TWSE 5-second index feed (`MI_5MINS_INDEX`, 13:30:00 Asia/Taipei). The same-day official Taiwan Index Plus real-time quote board showed **37,935.77** immediately before the closing print; I treat `37,878.47` as the defensible latest-close anchor and `37,935.77` as the last repeated pre-close live quote.

## Forecast Inputs
- `market`: high relevance. Oil stress, Fed timing, yields, and global risk appetite are the main short-horizon drivers for a broad Taiwan equity index.
- `tech`: high relevance. TAIEX is heavily exposed to semiconductors, AI infrastructure, and hardware supply chains, so the Cloud Next and integrated compute-cycle scenarios matter directly.
- `political`: medium relevance. The Iran/Hormuz path and Fed-independence conflict matter through oil, rates, and risk sentiment; the U.S. domestic DHS and Virginia threads matter little directly.
- `science`: low relevance. The science log is informative for innovation backdrop, but it is not a first-order driver of TAIEX over these horizons.

Forecast logs used:
- `/Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/market-focus-forecast-log.md`
- `/Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/tech-focus-forecast-log.md`
- `/Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/political-focus-forecast-log.md`
- `/Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/science-focus-forecast-log.md`

## Price Targets
### 1 week
- Dominant scenario: managed oil stress into the 2026-04-28 to 2026-04-29 FOMC window while AI and cloud-spend enthusiasm continues to support semiconductor leadership.
- Expected effect: TAIEX stays bid through heavyweight tech names, but upside is capped by firmer global yields and energy-driven inflation risk.
- Target price: **38,200**
- Likely range: **37,100 to 39,100**
- Confidence: **medium**

### 1 month
- Dominant scenario: the Fed stays on hold, oil cools only modestly, and the agentic-cloud buildout keeps Taiwan semiconductor and hardware demand expectations firm.
- Expected effect: the index grinds higher, but leadership remains narrow rather than broad-based, so gains should be positive but not explosive.
- Target price: **39,200**
- Likely range: **36,800 to 40,800**
- Confidence: **medium**

### 3 months
- Dominant scenario: integrated cloud-model-chip stacks remain the default enterprise buying pattern and Gulf disruption stays in a managed-instability regime rather than turning into a fresh supply shock.
- Expected effect: TAIEX benefits from persistent AI infrastructure demand and relative semiconductor strength, though higher-for-longer rates still limit valuation expansion.
- Target price: **41,000**
- Likely range: **36,500 to 43,800**
- Confidence: **medium**

### 1 year
- Dominant scenario: the hyperscaler-linked AI capex cycle remains intact, energy shock pressure fades from acute to manageable, and Taiwan's export-heavy tech complex keeps capturing the compute and hardware upcycle.
- Expected effect: TAIEX pushes higher over a one-year horizon, but the path is wide because the index is concentrated and very sensitive to global demand, rates, and geopolitics.
- Target price: **45,000**
- Likely range: **34,500 to 50,500**
- Confidence: **low**

## Most Likely Path
The base case is modestly bullish from the 2026-04-22 close. Market and political logs argue for some rate and oil drag, but the tech log is highly relevant to TAIEX and still points to persistent AI infrastructure demand flowing through semiconductor and hardware supply chains. That combination supports a higher index path over the next month to year, though the advance is more likely to be leadership-driven and volatile than broad and smooth.

## What Would Change The Call
- Higher outcome: formal Hormuz reopening, Brent falling back into a clearly lower range, easier-rate expectations after the FOMC, or stronger-than-expected AI infrastructure orders and semiconductor guidance.
- Lower outcome: Brent moving back above $100 on renewed disruption, clear evidence that higher fuel and financing costs are becoming a demand scare, weaker-than-expected cloud and AI capex follow-through, or a new geopolitical shock affecting Taiwan or global semiconductor trade.
- Invalidation risk: a Taiwan-specific political or cross-strait shock would outrank most of today's imported domain signals and is not directly captured by the available focus logs.

## Confidence
**Medium.** The market and tech logs are directly relevant for a tech-heavy Taiwan index, but confidence is capped because today's forecast inputs are mostly global and U.S.-centric rather than Taiwan-specific, and the official TWSE feed showed a small discrepancy between the last repeated pre-close print and the final 13:30:00 close value.

## Notes
product_type: index
price_source_1: TWSE 5-second index feed endpoint for 2026-04-22 (`https://www.twse.com.tw/en/exchangeReport/MI_5MINS_INDEX?response=json&date=20260422`), showing TAIEX 37,878.47 at 13:30:00 Asia/Taipei
price_source_2: Taiwan Index Plus real-time quote board (`https://taiwanindex.com.tw/en/indexes/board/twse`), showing TAIEX 37,935.77 on same-day page fetch
price_status: latest close anchored to official same-day feed; pre-close live quote also noted
forecast_logs_used:
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/market-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/tech-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/political-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/science-focus-forecast-log.md
missing_domains: none
major_assumptions:
- TAIEX remains primarily driven by global semiconductor and AI-capex expectations over these horizons.
- The 13:30:00 TWSE value is the defensible official close anchor for 2026-04-22.
- No Taiwan-specific geopolitical shock overrides the imported market and tech scenarios.
material_caveat: today's focus forecasts are mostly global and U.S.-centric, so Taiwan-specific policy and cross-strait risk are underrepresented.
