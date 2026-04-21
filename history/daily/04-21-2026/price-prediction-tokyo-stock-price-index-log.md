---
report: "price-prediction-tokyo-stock-price-index"
title: "Price Prediction: Tokyo Stock Price Index"
log_date: "04-21-2026"
generated_at_utc: "2026-04-21T04:49:01Z"
source_skill: "price-prediction"
---

# Price Prediction: Tokyo Stock Price Index Log

- Report: `price-prediction-tokyo-stock-price-index`
- Date: `04-21-2026`
- Generated At: `2026-04-21T04:49:01Z`
- Source Skill: `price-prediction`

## Summary
Base case is capped but constructive TOPIX price action from the live April 21 JPX level of 3,779.68: oil and geopolitical risk limit near-term upside, but AI and exporter leadership keep the medium-term bias mildly positive. Confidence is capped because the same-day forecast logs predate key Iran-resolution outcomes and do not directly model BOJ or USD/JPY shocks.

## Request
Use the price-prediction skill at /workspaces/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: TOPIX
- Label: Tokyo Stock Price Index
- Asset class: index
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
## Resolved Product
Tokyo Stock Price Index (`TOPIX`) - asset class: `index`

## Current Price
`3,779.68` points at `2026-04-21 13:48 JST` (`2026-04-21 04:48 UTC`), from the official Japan Exchange Group stock-price-index feed and timestamp file. Source type: near-live official exchange data update. Feed fields at capture: open `3,780.06`, high `3,789.13`, low `3,768.31`, day change `+2.66` (`+0.07%`).

## Forecast Inputs
Used every forecast log discovered by `find_forecast_logs.sh --date 2026-04-21`: `/workspaces/finance/history/daily/04-21-2026/market-focus-forecast-log.md`, `/workspaces/finance/history/daily/04-21-2026/political-focus-forecast-log.md`, `/workspaces/finance/history/daily/04-21-2026/tech-focus-forecast-log.md`, and `/workspaces/finance/history/daily/04-21-2026/science-focus-forecast-log.md`.

Relevance for `TOPIX`: `market` `high`, `political` `medium`, `tech` `medium`, `science` `low`. The main base-case driver is the market log's managed-instability path: oil and rates stay restrictive enough to cap multiple expansion, but not enough to force a recession. The political log matters mainly through Iran and Hormuz risk feeding Japan's imported-energy bill. The tech log adds support through semiconductor equipment, factory automation, electronics, and exporter-heavy leadership. The science log is mostly background sentiment and longer-run governance context.

## Price Targets
### 1 week
- Dominant scenario: Iran talks hold just enough to avoid a fresh energy shock, but the oil premium stays elevated and breadth remains narrow.
- Expected effect: modest upside, led more by exporters and AI-linked leaders than by a broad domestic cyclical rally.
- Target price: `3,830`
- Likely range: `3,730` to `3,890`
- Confidence: `medium`
- Main driver: the market log's messy-containment base case, with the tech log supporting Japanese semiconductor and automation names.

### 1 month
- Dominant scenario: crude stays high enough to keep rates restrictive and valuation expansion limited, but earnings resilience and AI-capex demand keep TOPIX from breaking down.
- Expected effect: mostly sideways-to-up with uneven sector participation.
- Target price: `3,860`
- Likely range: `3,650` to `3,960`
- Confidence: `medium`
- Main driver: persistent oil-plus-rates pressure from the market log, partly offset by the tech log's continued infrastructure and enterprise-AI spending tailwind.

### 3 months
- Dominant scenario: managed instability becomes the summer regime; recurring Gulf headlines create drawdown risk, but the no-recession base case leaves AI, automation, and industrial winners broadly supported.
- Expected effect: choppy trading with only modest net upside from current levels.
- Target price: `3,900`
- Likely range: `3,550` to `4,050`
- Confidence: `medium-low`
- Main driver: the market log's summer managed-instability path, with downside branches tied to any deeper oil shock or supply-chain stress.

### 1 year
- Dominant scenario: higher energy costs remain a drag, but global AI and cloud-investment leadership continues to benefit Japanese semiconductor, automation, and electronics exposure enough for TOPIX to make new highs.
- Expected effect: gradual grind higher above the current range, with upside capped relative to a clean disinflation path because Japan remains sensitive to imported energy.
- Target price: `4,180`
- Likely range: `3,650` to `4,500`
- Confidence: `medium-low`
- Main driver: the combination of the market log's no-recession base case and the tech log's integrated agentic-enterprise-stack thesis.

## Most Likely Path
The base case for exact-date `2026-04-21` inputs is cautious upside rather than breakout. Middle East risk and firm oil keep near-term upside capped, but AI, semiconductor, automation, and exporter leadership are still strong enough to leave the medium-term TOPIX bias positive if Gulf stress does not turn into a larger global growth shock.

## What Would Change The Call
- Raise the forecast: a durable Gulf de-escalation, Brent moving back into the low-90s or lower, softer U.S. yields, or stronger AI-capex follow-through that broadens leadership across Japanese electronics and machinery.
- Lower the forecast: renewed Strait of Hormuz disruption, Brent pushing decisively above 100, a more hawkish late-April FOMC response to energy-driven inflation, or a sharper hit to Japanese domestic demand from imported-cost pressure.
- Invalidate the forecast: a real global recession signal, a sharp break in AI and semiconductor demand, or a Japan-specific BOJ or yen shock large enough to dominate the global scenarios in today's logs.

## Confidence
`medium`

The broad-index fit is reasonably good because the market and tech forecast logs map cleanly into TOPIX leadership, but confidence is capped by two things: the `2026-04-21` forecast logs were captured while same-day geopolitics were still moving, and they do not directly model Japan-specific BOJ or USD/JPY path surprises.

## Notes
Product type: index
Watchlist entry: /workspaces/finance/watchlists/products.yaml -> symbol TOPIX, label Tokyo Stock Price Index, asset_class index
Requested date preserved when reading forecast logs: 2026-04-21
Verified price source: https://www.jpx.co.jp/market/indices/e_indices_stock_price3.txt
Timestamp source: https://www.jpx.co.jp/market/indices/e_indices_stock_price3.time.txt
Observed TOPIX price: 3,779.68
Observed feed timestamp: 2026-04-21 13:48 JST / 2026-04-21 04:48 UTC
Observed quote fields: open 3,780.06, high 3,789.13, low 3,768.31, previous-day comparison +2.66, previous-day ratio +0.07%
Feed HTTP Last-Modified header: Tue, 21 Apr 2026 04:48:30 GMT
Realtime graph URL from JPX feed: https://quote.jpx.co.jp/jpxhp/main/index.aspx?F=e_real_index&qcode=151
Forecast logs discovered with /workspaces/finance/skills/price-prediction/scripts/find_forecast_logs.sh --date 2026-04-21:
- /workspaces/finance/history/daily/04-21-2026/market-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/political-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/tech-focus-forecast-log.md
- /workspaces/finance/history/daily/04-21-2026/science-focus-forecast-log.md
Missing domains: none among the discovered 2026-04-21 forecast logs.
Relevance ranking: market high; political medium; tech medium; science low.
Major assumptions: no fresh Gulf supply shock beyond the forecast baseline; AI-capex leadership continues to support Japanese semiconductor and automation names; the downside summer-correction path remains a branch case, not the base case; BOJ and USD/JPY are important but only indirectly represented in the available forecast logs.
