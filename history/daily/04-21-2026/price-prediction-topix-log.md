---
report: "price-prediction-topix"
title: "Price Prediction: TOPIX"
log_date: "04-21-2026"
generated_at_utc: "2026-04-20T19:44:57Z"
source_skill: "price-prediction"
---

# Price Prediction: TOPIX Log

- Report: `price-prediction-topix`
- Date: `04-21-2026`
- Generated At: `2026-04-20T19:44:57Z`
- Source Skill: `price-prediction`

## Summary
Base case is a capped but constructive TOPIX path: oil and geopolitical risk limit near-term upside, but semiconductor and exporter strength keep the medium-term bias positive. The main uncertainty is whether Hormuz and energy stress deepen enough to overpower that support.

## Request
/watchlist-price-predictions

Assigned product:
- Symbol: TOPIX
- Label: Tokyo Stock Price Index
- Asset class: index

## Output
Resolved Product: Tokyo Stock Price Index (`TOPIX`; JPX overview names the benchmark `TOPIX (TPX)`), Japanese broad equity index.

Current Price: 3,777.02 JPY from the official JPX current-data feed, using `https://www.jpx.co.jp/market/indices/e_indices_stock_price3.txt` for the price fields and `https://www.jpx.co.jp/market/indices/e_indices_stock_price3.time.txt` for the source timestamp. The source timestamp was 2026-04-20 16:59 JST, and I retrieved it at 2026-04-21 04:43:18 JST (2026-04-20T19:43:18Z). Because retrieval happened before the April 21, 2026 Tokyo cash session opened, I treat this as the latest official close entering April 21, 2026 rather than an April 21 intraday quote.

Forecast Inputs: Used every available April 21, 2026 focus forecast log. Relevance for `TOPIX`: `market` high, `political` medium-high, `tech` medium, `science` low. The dominant drivers are the market log's oil/Fed regime and the political log's Iran-Hormuz path; the tech log adds upside support through semiconductors, factory automation, and exporter demand, while the science log is mostly background risk-appetite context.

Price Targets

1 week
- Dominant scenario: the April 22, 2026 Iran deadline slips into contained standoff rather than a clean normalization or a fresh supply shock, so oil stays elevated but does not fully break risk appetite.
- Expected effect: TOPIX stays near current levels, with machinery, electronics, and autos offsetting pressure on oil-sensitive domestic names.
- Target price: 3,760
- Likely range: 3,690 to 3,860
- Confidence: medium

1 month
- Dominant scenario: oil remains somewhat elevated into May and the Fed stays patient to hawkish, but Google Cloud Next, Samsung, and follow-through AI-capex demand keep Japanese chip-linked exporters and automation names constructive.
- Expected effect: narrow leadership with modest upside rather than a broad rally.
- Target price: 3,860
- Likely range: 3,650 to 4,000
- Confidence: medium

3 months
- Dominant scenario: managed geopolitical instability persists, the oil premium fades only partly, and summer earnings validate continued semiconductor, capital-goods, and exporter strength.
- Expected effect: moderate grind higher, with leadership still concentrated in semis, electronics, capital goods, and selective financials.
- Target price: 4,000
- Likely range: 3,700 to 4,180
- Confidence: medium

1 year
- Dominant scenario: the global economy absorbs a higher energy floor without recession, while AI infrastructure demand, industrial automation, and exporter earnings remain durable enough to carry the index.
- Expected effect: constructive but uneven advance driven more by earnings than by broad multiple expansion.
- Target price: 4,320
- Likely range: 3,500 to 4,800
- Confidence: low

Most Likely Path: Base case is a capped but constructive TOPIX path. The market and political logs imply that oil and geopolitical risk keep short-horizon upside limited, but the tech log still supports a medium-term bid through semiconductors, automation, and exporters. That leaves the next few weeks choppy, the next few months mildly bullish, and the one-year path positive if the oil shock does not deepen into a global growth scare.

What Would Change The Call:
- Raise the forecast: a credible Strait of Hormuz normalization, Brent moving decisively below recent stress levels, softer U.S. yields, or stronger follow-through in AI and semiconductor demand from Google Cloud Next, Samsung, and hyperscalers.
- Lower the forecast: renewed shipping disruption, Brent sustaining another leg higher, a more hawkish April 28-29, 2026 FOMC response to energy-driven inflation, or evidence that higher import costs are hurting Japanese domestic demand faster than exporters benefit.
- Invalidate the forecast: a real global recession signal, a sharp break in AI capex and semiconductor demand, or a Japan-specific yen or Bank of Japan shock large enough to dominate the global scenarios in today's logs.

Confidence: Medium.

## Notes
Product type: Japanese broad equity index.
Price source 1: JPX Stock Price Index - Real Time Values page https://www.jpx.co.jp/english/markets/indices/realvalues/index.html
Price source 2: JPX current-data JSON feed https://www.jpx.co.jp/market/indices/e_indices_stock_price3.txt
Price source 3: JPX current-data timestamp feed https://www.jpx.co.jp/market/indices/e_indices_stock_price3.time.txt
Observed quote fields: marketName TOPIX, currentPrice 3,777.02, previousDayComparison 16.21, previousDayRatio 0.43, openingPrice 3,788.46, highPrice 3,794.39, lowPrice 3,772.96.
Source timestamp: 2026-04-20 16:59 JST.
Retrieved at: 2026-04-21 04:43:18 JST / 2026-04-20T19:43:18Z.
Quote status: latest official close before the April 21, 2026 Tokyo cash session, not a live April 21 intraday quote.
Supplementary same-source sector snapshot at that close: TOPIX-17 Machinery +2.04%, Automobiles & Transportation Equipment +1.46%, Electric Appliances & Precision Instruments +0.98%, IT & Services +0.82%, Banks -0.50%, Energy Resources -3.19%.
Forecast logs used:
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/market-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/political-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/science-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-21-2026/tech-focus-forecast-log.md
Missing domains: none.
Major assumptions: `market` and `political` dominate TOPIX through oil, global risk appetite, and rates; `tech` is materially supportive through semiconductors, factory automation, and exporters; `science` is low relevance; Japan-specific FX and Bank of Japan paths are inference rather than directly covered by today's focus logs.
