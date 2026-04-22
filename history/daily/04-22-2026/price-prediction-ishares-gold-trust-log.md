---
report: "price-prediction-ishares-gold-trust"
title: "Price Prediction: iShares Gold Trust"
log_date: "04-22-2026"
generated_at_utc: "2026-04-22T07:43:09Z"
source_skill: "price-prediction"
---

# Price Prediction: iShares Gold Trust Log

- Report: `price-prediction-ishares-gold-trust`
- Date: `04-22-2026`
- Generated At: `2026-04-22T07:43:09Z`
- Source Skill: `price-prediction`

## Summary
Base case is mildly bullish for IAU because the 2026-04-22 market and political forecasts both preserve a geopolitical and inflation-hedge premium for gold. The main uncertainty is that the verified anchor is the latest available 2026-04-21 close rather than a live 2026-04-22 U.S. ETF session print.

## Request
Use $price-prediction at /Users/jhpeng/projects/ai/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: IAU
- Label: iShares Gold Trust
- Asset class: etf
- Watchlist file: /Users/jhpeng/projects/ai/finance/watchlists/products.yaml

User request:
/daily-research-pipeline

Execution notes:
- Preserve the exact requested date 2026-04-22.
- Use today's available focus forecast logs under /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026.
- Verify a current reference price before forecasting.
- Save the finished product forecast log unless blocked.
- Return the finished product forecast summary, the saved log path, and any short caveat that materially affects confidence.

## Output
Resolved Product
iShares Gold Trust (`IAU`); asset class `etf`.

Current Price
`88.04 USD` as of the latest available `IAU` market close from Stooq, observed during this run on `2026-04-22` from the quote endpoint `https://stooq.com/q/l/?s=iau.us&i=d`, which returned timestamp `2026-04-21 22:00:21` with close `88.04`. Quote treatment: latest available close, not a live `2026-04-22` regular-session print. Supporting context only: the Stooq gold-futures quote endpoint `https://stooq.com/q/l/?s=gc.f&i=d` returned `4781.54` at `2026-04-22 09:41:22`, which supports a still-firm bullion backdrop but is not used as the primary ETF price anchor.

Forecast Inputs
High relevance: `market-focus-forecast-log.md` and `political-focus-forecast-log.md`, because `IAU` is a gold-backed ETF and the dominant drivers in the `2026-04-22` logs are Hormuz-related oil risk, inflation expectations, real yields, dollar direction, and safe-haven demand.
Low relevance: `tech-focus-forecast-log.md` and `science-focus-forecast-log.md`, which matter only indirectly through broad risk appetite, growth expectations, and second-order effects on real yields.

Price Targets

1 week
Dominant scenario: the market log's `Trump extension holds, but Hormuz is still not reopened into FOMC week` path combines with the political log's `ceasefire holds through the week and domestic power fights retake center stage` path.
Expected effect: mildly bullish for `IAU` because the oil-inflation channel and residual hedge demand remain intact, but the absence of a fresh shock caps the upside.
Target price: `89.9 USD`
Range: `86.8 to 92.9 USD`
Confidence: `medium`

1 month
Dominant scenario: the market log's `FOMC stays on hold, oil cools only modestly, and the S&P grinds sideways at a higher-rate valuation` base case blends with the political log's `managed ceasefire, but May is dominated by DHS and Fed institutional fights` path.
Expected effect: moderately positive for `IAU` because incomplete Gulf normalization and a still-sticky inflation backdrop keep strategic gold demand supported even if the dollar stays relatively firm.
Target price: `92.1 USD`
Range: `85.4 to 96.8 USD`
Confidence: `medium`

3 months
Dominant scenario: the market log's `managed-instability regime` remains the center of gravity, with the political log implying that Iran risk stays unresolved enough to preserve a modest security premium even while U.S. attention rotates back toward domestic institutional conflict.
Expected effect: constructive but volatile for `IAU`; gold keeps a macro hedge bid, but the path depends more on inference than on direct product-specific flow evidence.
Target price: `95.4 USD`
Range: `83.5 to 103.1 USD`
Confidence: `low`

1 year
Dominant scenario: the weighted one-year path leans between the market log's `chronic Hormuz insecurity locks in a higher-energy, higher-rate market regime` case and its `oil shock becomes part of a broader global slowdown` case, with the political log still pointing to recurring executive-power conflict rather than clean normalization.
Expected effect: upward long-run bias for `IAU`, but with a wide distribution because a durable Gulf settlement, stronger real yields, or a stronger U.S. dollar could strip out a large share of today's hedge premium.
Target price: `99.6 USD`
Range: `77.8 to 113.4 USD`
Confidence: `low`

Most Likely Path
The most likely path is supportive but choppy for `IAU`. The exact-date `market` forecast says gold is one of the assets reacting most directly to the Hormuz-driven oil and inflation channel, while the `political` forecast still leaves Iran risk unresolved even if Washington attention shifts back toward DHS, Fed, and Virginia fights. That combination argues for a retained hedge premium and a gradual recovery from the `2026-04-21` close rather than a straight-line melt-up.

What Would Change The Call
Higher than forecast: ceasefire failure, broader shipping disruption, Brent decisively back above `$100`, a growth scare that compresses real yields, or broader cross-asset risk-off.
Lower than forecast: formal Hormuz reopening, sustained oil normalization, cleaner disinflation, a stronger U.S. dollar, or rising real yields.
Invalidate the near-term bullish bias: verified durable Gulf normalization that removes the hedge bid while macro data keep real yields elevated.

Confidence
`medium` overall. The dated `market` and `political` forecast logs are directly relevant to a gold ETF and the current reference price is verified, but confidence is capped because the anchor is the latest available close rather than a live `2026-04-22` U.S. ETF session print, and the same-day forecast logs still predate the full U.S. cash session.

## Notes
Product type: gold-backed ETF.
Resolved from watchlist: /Users/jhpeng/projects/ai/finance/watchlists/products.yaml
Price source 1: Stooq IAU quote endpoint https://stooq.com/q/l/?s=iau.us&i=d ; observed during this run on 2026-04-22; returned row IAU.US,20260421,220021,89.85,90.2,87.85,88.04,8510292 .
Quote treatment: latest available close, not a live regular-session intraday print for 2026-04-22.
Supporting market context source: Stooq gold futures quote endpoint https://stooq.com/q/l/?s=gc.f&i=d ; observed during this run on 2026-04-22; returned row GC.F,20260422,094122,4746.56,4790.44,4733.1,4781.54,, .
Forecast log paths used:
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/market-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/political-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/science-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/tech-focus-forecast-log.md
Discovery method: /Users/jhpeng/projects/ai/finance/skills/price-prediction/scripts/find_forecast_logs.sh --date 2026-04-22
Domain relevance assumptions: market=high, political=high, tech=low, science=low.
Missing domains: none from the discovered 2026-04-22 forecast-log set.
Major assumptions: IAU continues to track spot-gold direction closely enough that geopolitical risk, inflation expectations, real yields, and dollar direction dominate the forecast horizons; no trust-specific structural event overrides the macro regime.
