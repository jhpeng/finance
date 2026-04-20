---
report: "price-prediction-ishares-gold-trust"
title: "Price Prediction: iShares Gold Trust"
log_date: "04-20-2026"
generated_at_utc: "2026-04-20T20:47:09Z"
source_skill: "price-prediction"
---

# Price Prediction: iShares Gold Trust Log

- Report: `price-prediction-ishares-gold-trust`
- Date: `04-20-2026`
- Generated At: `2026-04-20T20:47:09Z`
- Source Skill: `price-prediction`

## Summary
Base case is a supported-but-not-explosive gold path: Hormuz and Iran risk keep a safe-haven and inflation-hedge bid under IAU, while the main uncertainty is how quickly the geopolitical premium fades over longer horizons.

## Request
Use $price-prediction at /workspaces/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: IAU
- Label: iShares Gold Trust
- Asset class: etf
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
Resolved Product: iShares Gold Trust (`IAU`), gold-backed ETF.

Current Price: 90.57 at 2026-04-20 4:00:00 PM EDT (20:00:00 UTC), from the Yahoo Finance `IAU` chart endpoint as the latest regular-session close. A current finance-tool snapshot also showed `IAU` at 90.57, which corroborated the reference level.

Forecast Inputs: The scenario inputs below are sourced from the 2026-04-20 `market`, `political`, `tech`, and `science` forecast logs; the price targets are my inference from those scenarios plus the verified current ETF level. Relevance ranking for `IAU`: `market` high, `political` high, `tech` low, `science` low.

Price Targets

1 week
- Dominant scenario: Strait of Hormuz traffic stays contested but not fully shut into the late-April FOMC, keeping crude elevated and preserving a safe-haven plus inflation-hedge bid for bullion.
- Expected effect: modest upside with headline-driven swings rather than a breakout melt-up.
- Target price: 91.8
- Likely range: 90.0 to 93.4
- Confidence: medium

1 month
- Dominant scenario: the Fed holds and treats the oil shock as a risk rather than a new inflation regime, while unresolved Iran-related political tension leaves some geopolitical premium in gold.
- Expected effect: gold stays firm even if panic hedging fades, because real-asset demand remains supported by sticky energy and policy caution.
- Target price: 92.9
- Likely range: 89.8 to 96.0
- Confidence: medium

3 months
- Dominant scenario: Gulf friction becomes a medium-term stagflation overhang, keeping the Fed sidelined and favoring real assets over a clean return to disinflation.
- Expected effect: IAU grinds higher as a macro hedge, with upside limited if shipping conditions normalize faster than expected.
- Target price: 95.0
- Likely range: 89.0 to 100.5
- Confidence: medium

1 year
- Dominant scenario: the immediate oil shock fades, but a residual geopolitical and inflation-risk premium remains because the political backdrop never fully resolves into a stable lower-risk regime.
- Expected effect: higher than today's level, but with a much wider distribution because long-horizon outcomes depend on whether Gulf insecurity becomes chronic or truly subsides.
- Target price: 96.5
- Likely range: 86.0 to 105.0
- Confidence: low

Most Likely Path: The base case is that `IAU` stays supported rather than explosive. The `market` forecast is the main driver because it points to a contested-but-not-closed Hormuz backdrop, elevated oil, and a Fed that stays cautious, which is a decent setup for gold. The `political` forecast adds a lingering Iran-risk premium, while the `tech` and `science` logs matter mostly through second-order effects on broad risk appetite rather than direct bullion demand. That combination argues for mild near-term appreciation, better support over one to three months than over one week, and only moderate one-year upside because a full de-escalation would remove some of the safe-haven bid.

What Would Change The Call:
- Raise the forecast: a fresh shipping disruption, Brent holding above $100, a more obvious stagflation repricing, or broader risk-off behavior that pushes investors toward gold.
- Lower the forecast: fast Hormuz normalization, crude retreating toward the mid-$80s, a stronger real-rate and dollar backdrop after firmer growth or a hawkish Fed, or evidence that geopolitical risk premium is unwinding quickly.
- Invalidate the forecast: a clear macro regime shift that decisively removes the current geopolitical and inflation-risk backdrop, or a sharp move in real yields that overwhelms safe-haven demand.

Confidence: Medium.

## Notes
Product type: ETF tracking physical gold.
Price source 1: Yahoo Finance chart endpoint for `IAU` at https://query1.finance.yahoo.com/v8/finance/chart/IAU?interval=1m&range=1d&includePrePost=false
Observed quote fields: regularMarketPrice 90.57, regularMarketTime 1776715200, previousClose 91.34, exchange NYSE Arca (PCX), instrumentType ETF.
Price source 2: finance tool snapshot for `IAU` (USA fund) also returned 90.57 during this run.
Quote treatment: because the run occurred after the 2026-04-20 regular session close, the reference price is the latest close rather than an in-session live tick.
Forecast logs used:
- /workspaces/finance/history/daily/04-20-2026/market-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/political-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/tech-focus-forecast-log.md
- /workspaces/finance/history/daily/04-20-2026/science-focus-forecast-log.md
Missing domains: none.
Major assumptions: gold remains most sensitive to macro, inflation, and geopolitical channels in these logs; no direct bullion-flow, jewelry-demand, or central-bank-buying log was available for 2026-04-20, so longer-horizon targets rely more on macro inference than on gold-specific flow evidence.
