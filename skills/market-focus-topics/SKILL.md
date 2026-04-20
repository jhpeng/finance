---
name: market-focus-topics
description: Analyze recent market attention and identify the topics, narratives, catalysts, and cross-asset themes currently driving trading discussion or price reaction. Use when Codex needs to answer what the market is focused on today or this week, which themes dominate current news flow, why a sector or asset is moving, what catalysts investors care about, or how to summarize live market narratives with up-to-date evidence and source links.
---

# Market Focus Topics

## Overview

Identify the few themes that are genuinely commanding market attention right now. Ground every claim in current evidence, separate broad consensus from speculation, and explain why each theme matters for assets, sectors, or macro expectations.

## Workflow

1. Define the scope before collecting evidence.
Use the user's market, asset class, geography, and timeframe when provided. Otherwise default to a US multi-asset view covering major equity indexes, Treasury yields, the US dollar, crude oil, and gold across the last 5 trading days plus the current session. State every assumption with exact dates.

2. Gather fresh evidence.
Browse the web because market focus is temporally unstable. Pull a mix of current news, primary releases, official statements, filings, earnings materials, and market data. Prefer primary sources for facts and reputable financial reporting for narrative confirmation.

3. Build an evidence set.
Track the theme, source, timestamp, affected assets, observed reaction, and whether the source is primary or secondary. Open [references/market-evidence-framework.md](references/market-evidence-framework.md) when you need source priorities, scoring rules, or a reusable capture template.

4. Cluster repeated signals.
Treat a topic as real market focus only when it appears across multiple independent sources, aligns with visible price reaction, or is tied to an imminent catalyst that markets are clearly discussing.

5. Rank themes by attention.
Prioritize recurrence across sources, magnitude of affected assets, spillover across asset classes, and how near the next confirming catalyst is.

6. Synthesize the answer.
Explain what the market seems to care about, why now, how that focus is showing up in prices or positioning, what could confirm or weaken the narrative, and where uncertainty remains.

## Source Mix

- Prefer official releases and filings for macro data, central bank communication, Treasury issuance, regulation, earnings details, and guidance.
- Use reputable financial reporting to confirm which themes dominate coverage and trader commentary.
- Use market data tools for price moves, rates, and cross-asset confirmation.
- Include direct links whenever you cite recent information.
- Use exact publication dates and event dates instead of relative phrases when timing matters.
- If evidence conflicts, say so plainly instead of forcing a single story.

## Output Shape

Return a compact market-focus brief with these sections:

- `Focus Now`: 3 to 5 ranked themes.
- `Why It Matters`: one short paragraph per theme covering catalyst, affected assets, and transmission mechanism.
- `Evidence`: recent sources and observed market reaction.
- `What Could Change Next`: upcoming releases, earnings, or policy events that could rotate attention.
- `Confidence`: high, medium, or low based on breadth and recency of evidence.

## Guardrails

- Do not imply certainty from a single headline.
- Do not present stale themes as current without confirming them first.
- Do not collapse price action, narrative, and causality into one claim unless the evidence supports it.
- Distinguish descriptive market analysis from personalized financial advice.
- Extend the brief with bull, base, and bear interpretations only when the user asks for scenario work.
