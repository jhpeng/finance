---
report: "price-prediction-usd-twd"
title: "Price Prediction: USD/TWD"
log_date: "04-21-2026"
generated_at_utc: "2026-04-20T19:44:44Z"
source_skill: "price-prediction"
---

# Price Prediction: USD/TWD Log

- Report: `price-prediction-usd-twd`
- Date: `04-21-2026`
- Generated At: `2026-04-20T19:44:44Z`
- Source Skill: `price-prediction`

## Summary
Base case is a mild near-term USD/TWD rise on Iran-oil-Fed stress, followed by partial retracement over 3-12 months as Taiwan tech/export strength reasserts itself. Main uncertainty is whether the April 22 Iran catalyst becomes a deeper energy shock or fades quickly.

## Request
/watchlist-price-predictions

Assigned product:
- Symbol: USDTWD
- Label: USD/TWD
- Asset class: currency
- Watchlist file: /Users/jhpeng/projects/ai/finance/watchlists/products.yaml

## Output
## Resolved Product
- Name: USD/TWD
- Symbol: USDTWD
- Asset class: currency

## Current Price
- 31.433 TWD per USD.
- Primary source: Investing.com USD/TWD historical-data page, which showed `31.433`, `Real-time Data 15:23:19`, day range `31.409-31.569`, and previous close `31.480` when retrieved at `2026-04-21T03:44:44+0800 CST` (`2026-04-20T19:44:44Z`).
- Quote type: intraday quote / real-time page print.
- Secondary check: TradingEconomics USDTWD page showed `31.4310` and stated USDTWD `traded at 31.4290` on `Apr 20, 2026`, consistent with the same spot area.

## Forecast Inputs
- High relevance: `market-focus-forecast` and `political-focus-forecast`. Oil-risk premium, Fed repricing, safe-haven dollar demand, and the April 22 Iran ceasefire deadline are the main near-term FX drivers.
- Medium relevance: `tech-focus-forecast`, mainly from 3 months onward. Persistent AI and semiconductor capex strength supports Taiwan exports and medium-term TWD resilience.
- Low relevance: `science-focus-forecast`. No direct USD/TWD transmission path beyond second-order growth sentiment.

## Price Targets

### 1 week
- Dominant scenario: the April 22 Iran deadline resolves into messy containment rather than a clean all-clear, so oil and U.S. yields stay firm enough to preserve a mild USD safety bid.
- Expected effect: modest upside in USD/TWD from the current print.
- Target price: `31.65`
- Likely range: `31.35-31.95`
- Confidence: `medium`
- Main driver: political plus market.

### 1 month
- Dominant scenario: oil remains elevated into late April and May, the April 28-29 FOMC stays cautious, and narrower risk leadership keeps the dollar supported even as Taiwan tech fundamentals remain decent.
- Expected effect: USD/TWD grinds a bit higher before medium-term Taiwan support matters more.
- Target price: `31.90`
- Likely range: `31.45-32.35`
- Confidence: `medium`
- Main driver: market.

### 3 months
- Dominant scenario: managed instability replaces acute panic; part of the near-term oil and USD premium fades while AI/semiconductor demand continues to support Taiwan's external picture.
- Expected effect: USD/TWD gives back part of the near-term rise and settles closer to the recent month range midpoint.
- Target price: `31.55`
- Likely range: `30.95-32.20`
- Confidence: `medium`
- Main driver: market, with tech as the main offset.

### 1 year
- Dominant scenario: no global recession, Taiwan remains levered to durable AI infrastructure demand, and the current geopolitical energy premium fades enough for gradual TWD recovery, though not enough for a deep USD breakdown.
- Expected effect: USD/TWD drifts back toward the low-31 area.
- Target price: `31.05`
- Likely range: `29.80-32.30`
- Confidence: `low`
- Main driver: tech-supported Taiwan growth versus a still-elevated global security and Fed backdrop.

## Most Likely Path
Near term, USD/TWD stays biased higher because the April 22 Iran deadline, elevated oil, and a still-restrictive Fed path favor the dollar against Asian FX. Over 3 to 12 months, the base case shifts toward modest TWD recovery if shipping risk stops worsening and Taiwan's AI-linked export cycle remains firm, which pulls the pair back toward the low-31s instead of sustaining a move back above the March high near 32.20.

## What Would Change The Call
- Raise USD/TWD: ceasefire failure, Brent sustaining above 100, a more hawkish Fed, weaker Taiwan semiconductor/export data, or a Taiwan-specific geopolitical shock.
- Lower USD/TWD: durable Hormuz normalization, softer U.S. data that pull yields down, broadening global risk appetite, stronger TSMC/supply-chain follow-through, or faster Taiwan inflows.
- Invalidate the forecast: an abrupt Taiwan policy intervention or a new cross-strait event not represented in today's focus logs.

## Confidence
Medium. Today's market and political logs map well onto a currency pair like USD/TWD, but confidence is capped by the binary April 22 Iran catalyst and the fact that the evidence set is macro-domain rather than currency-specific.

## Notes
Product type: currency.
Watchlist source: /Users/jhpeng/projects/ai/finance/watchlists/products.yaml (USDTWD / USD/TWD).
Price source details:
- Primary: https://www.investing.com/currencies/usd-twd-historical-data ; observed at 2026-04-21T03:44:44+0800 CST / 2026-04-20T19:44:44Z ; page fields used: 31.433 current rate, Real-time Data 15:23:19, day range 31.409-31.569, previous close 31.480, 52-week range 28.744-32.617.
- Secondary cross-check: https://tradingeconomics.com/usdtwd%3Acur ; observed same session ; page fields used: 31.4310 exchange rate, Apr/20 date, and narrative sentence that USDTWD traded at 31.4290 on Monday April 20th.
Forecast log paths used:
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/market-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/political-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/tech-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/science-focus-forecast-log.md
Relevance assumptions:
- market: high
- political: high
- tech: medium from 3 months onward
- science: low
Major assumptions:
- Iran/Hormuz risk does not turn into a sustained supply shock beyond the current market base case.
- Taiwan's semiconductor and AI export cycle remains constructive enough to support medium-term TWD resilience.
- No Taiwan-specific policy or geopolitical shock overrides the macro path from today's logs.
