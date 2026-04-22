---
report: "price-prediction-usd-twd"
title: "Price Prediction: USD/TWD"
log_date: "04-22-2026"
generated_at_utc: "2026-04-22T07:44:25Z"
source_skill: "price-prediction"
---

# Price Prediction: USD/TWD Log

- Report: `price-prediction-usd-twd`
- Date: `04-22-2026`
- Generated At: `2026-04-22T07:44:25Z`
- Source Skill: `price-prediction`

## Summary
Base case is mildly firmer USD/TWD over 1 week to 3 months as the 2026-04-22 market and political forecasts still imply elevated oil, patient-Fed pricing, and residual dollar support, but the 1-year bias turns modestly lower as Taiwan's AI-export backdrop and any fade in Gulf stress help TWD recover. Main uncertainty is that today's logs are global/U.S.-centric rather than Taiwan-FX-specific.

## Request
Use $price-prediction at /Users/jhpeng/projects/ai/finance/skills/price-prediction to forecast only this product. Do not spawn more agents.

Assigned product:
- Symbol: USDTWD
- Label: USD/TWD
- Asset class: currency
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
USD/TWD (`USDTWD`), a U.S. dollar versus New Taiwan dollar currency pair.

Current Price
31.4933 TWD per USD, retrieved at 2026-04-22T07:44:25Z from Stooq's `usdtwd` quote endpoint as a timestamped intraday FX snapshot (`USDTWD,20260422,094304,31.5051,31.5106,31.4631,31.4933,,`). Cross-check: Investing.com's USD/TWD page embedded FAQ data stating a current exchange rate of 31.495, previous close 31.497, opening price 31.497, and day's range 31.451 to 31.502 when fetched in the same session. Official latest published closing rate from Taiwan's central bank was 31.489 on 2026/04/21. Because the spot market was open and both live-style pages aligned tightly, I am using 31.4933 as the reference anchor. Quote-delay and feed timezone were not stated explicitly by the public endpoints.

Forecast Inputs
High relevance: `market` and `political` forecast logs, because USD/TWD is most exposed in the short run to oil-sensitive inflation expectations, U.S. yield and Fed-path pricing, and Iran/Hormuz headline risk.
Medium relevance: `tech`, because Taiwan's AI and semiconductor export backdrop can support TWD through trade and equity-flow sentiment, especially beyond one month.
Low relevance: `science`, mostly background and not a direct FX driver.

Price Targets

1 week
Dominant scenario: the 2026-04-22 market base case of elevated but managed oil stress persists into the 2026-04-28 to 2026-04-29 FOMC window, while the political base case remains ceasefire containment rather than a fresh Iran break. `Market` is the primary driver and `political` is the main near-term amplifier.
Expected effect: modest USD/TWD upside as firmer oil and a patient-Fed backdrop support the dollar more than Taiwan's export support can offset in one week.
Target price: 31.58
Likely range: 31.36 to 31.72
Confidence: medium

1 month
Dominant scenario: the Fed stays on hold, oil cools only partially, and U.S. domestic institutional fights matter less for TWD than the associated higher-for-longer dollar backdrop. Taiwan's tech/export resilience offsets, but does not fully erase, that macro pressure.
Expected effect: drift modestly above spot toward the upper half of the recent range rather than a disorderly breakout.
Target price: 31.70
Likely range: 31.25 to 32.00
Confidence: medium

3 months
Dominant scenario: a managed-instability summer regime keeps some residual energy-risk premium in USD/TWD, but the tech forecast's integrated-cloud and AI-capex strength continues to support Taiwan-linked demand and sentiment. This horizon relies more on inference than on direct Taiwan-specific scenario support from today's logs.
Expected effect: mildly firmer than current spot, but capped because stronger semiconductor and AI export conditions should stop a sustained TWD selloff.
Target price: 31.78
Likely range: 30.95 to 32.35
Confidence: low

1 year
Dominant scenario: the acute Gulf premium fades, while Taiwan's AI and semiconductor cycle remains a medium-term support for exports and equity inflows. `Market` still anchors the macro regime, but `tech` becomes the most important secondary driver at this horizon.
Expected effect: USD/TWD edges lower from current stress-affected levels as TWD regains some strength once the near-term energy and dollar shock eases.
Target price: 30.95
Likely range: 29.70 to 32.20
Confidence: low

Most Likely Path
Base case is a mildly firmer USD/TWD over the next week to quarter because today's market and political forecasts still imply elevated oil, a patient Fed, and residual dollar support. That upside should stay capped, though, because the same-day tech forecast still supports Taiwan's AI and semiconductor backdrop. Over one year, the more likely path is modest TWD recovery if the Gulf risk premium fades rather than becoming a structural permanent shock.

What Would Change The Call
Raise the call: renewed Hormuz disruption, Brent moving and staying above $100, firmer U.S. inflation or yields, softer Taiwan export and semiconductor data, or Taiwan-specific outflows that amplify dollar demand.
Lower the call: durable shipping normalization, Brent falling back toward the mid-$80s to low-$90s, softer U.S. growth and yields, stronger Taiwan AI-export or equity inflow data, or evidence that Taiwan's central bank is comfortable with renewed TWD strength.
Invalidate the call: Taiwan-specific geopolitical or policy shocks, aggressive FX management that overwhelms macro drivers, or a global downturn that breaks the usual oil/rates/export relationship.

Confidence
Low.

## Notes
Product type: currency pair.
Primary price verification: https://stooq.com/q/l/?s=usdtwd&i=1
Observed Stooq snapshot retrieved at 2026-04-22T07:44:25Z: USDTWD,20260422,094304,31.5051,31.5106,31.4631,31.4933,,
Interpretation note: the endpoint provides a dated and time-stamped intraday quote row, but does not state the feed timezone or delay policy explicitly.
Secondary price verification: https://www.investing.com/currencies/usd-twd
Observed Investing page FAQ payload at retrieval: current exchange rate 31.495; previous close 31.497; open 31.497; day's range 31.451 to 31.502; bid 31.492; ask 31.498.
Official recent close: https://www.cbc.gov.tw/en/lp-700-2-1-60.html
Observed Taiwan CBC NT$/US$ Closing Rate: 31.489 for 2026/04/21.
Forecast logs used:
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/market-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/political-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/tech-focus-forecast-log.md
- /Users/jhpeng/projects/ai/finance/history/daily/04-22-2026/science-focus-forecast-log.md
Missing domains: none.
Domain relevance used: market high, political high near term and medium thereafter, tech medium, science low.
Major assumptions: Taiwan remains more sensitive near term to oil, U.S. yields, and dollar liquidity than to the domestic U.S. political fights except where those alter Fed credibility or Iran risk; Taiwan's AI and semiconductor cycle remains supportive enough to cap medium-term USD/TWD upside.
Material confidence caveat: today's focus forecasts are global and U.S.-centric rather than Taiwan-FX-specific, and they do not directly model Taiwan central-bank management, local insurer hedging flows, or same-day late-session U.S. geopolitical headlines.
