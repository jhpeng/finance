---
name: political-focus-topics
description: Analyze recent political attention and identify the topics, elections, legislative fights, executive actions, court rulings, geopolitical developments, and governing narratives currently driving discussion or policy impact. Use when Codex needs to answer what politics is focused on today or this week, which themes dominate current political news flow, why they matter, or how to summarize live political narratives with up-to-date evidence and source links.
---

# Political Focus Topics

## Overview

Identify the few political themes that are genuinely commanding attention right now. Ground every claim in current evidence, separate broad political salience from partisan spin or one-off noise, explain why each theme matters for policy, elections, institutions, or geopolitics, and then save the finished brief through `$daily-report-logger`.

## Workflow

1. Define the scope before collecting evidence.
Use the user's geography, institutions, parties, races, policy area, and timeframe when provided. Otherwise default to a US national political view covering the White House, Congress, federal courts, major campaigns or elections, and important foreign-policy flashpoints across the last 7 days plus the current day. State every assumption with exact dates.

2. Gather fresh evidence.
Browse the web because political focus is temporally unstable. Pull a mix of official statements, bill text, vote tallies, court orders, agency releases, campaign filings, election-authority updates, summit communiques, sanctions notices, and reputable reporting. Prefer primary sources for facts and high-quality reporting for narrative confirmation.

3. Build an evidence set.
Track the theme, source, timestamp, affected actors or institutions, observed signal, and whether the source is primary or secondary. Open [references/political-evidence-framework.md](references/political-evidence-framework.md) when you need source priorities, scoring rules, or a reusable capture template.

4. Cluster repeated signals.
Treat a topic as real political focus only when it appears across multiple independent sources, is tied to a clear institutional action or campaign development, or is visibly shaping media attention, coalition behavior, or policy expectations.

5. Rank themes by attention.
Prioritize recurrence across sources, institutional significance, breadth of affected actors or geographies, and how near the next confirming catalyst is.

6. Synthesize the answer.
Explain what politics seems to care about, why now, who is affected, how the focus is showing up through votes, rulings, campaigns, diplomacy, or implementation, what could confirm or weaken the narrative, and where uncertainty remains.

7. Persist the brief with `$daily-report-logger`.
After the final brief is ready, save it unless the user explicitly says not to persist the result. Use these defaults:

- `report`: `political-focus`
- `title`: `Political Focus`
- `source_skill`: `political-focus-topics`
- `summary`: 1 to 2 sentences capturing the main political takeaway
- `request`: the user's original request
- `output`: the final political-focus brief
- `notes`: scope assumptions, date coverage, or `(none)`

Write to `history/daily/mm-dd-yyyy/political-focus-log.md`. If a log already exists for the same date, overwrite it by calling `$daily-report-logger` again with the updated brief.

When you need a deterministic file write, use:

```bash
tmp_request="$(mktemp)"
tmp_output="$(mktemp)"
tmp_notes="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_BRIEF" > "$tmp_output"
printf '%s' "$NOTES" > "$tmp_notes"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "political-focus" \
  --title "Political Focus" \
  --source-skill "political-focus-topics" \
  --summary "$SUMMARY" \
  --request-file "$tmp_request" \
  --output-file "$tmp_output" \
  --notes-file "$tmp_notes"
```

## Source Mix

- Prefer official government, legislative, judicial, election-authority, treaty-organization, and sanctions-list sources for factual claims.
- Use campaign or party statements for what a candidate or organization actually said, but corroborate disputed factual claims independently.
- Use reputable reporting to confirm which themes dominate political discussion and how institutions, coalitions, or diplomatic actors are responding.
- Use polling only from sources with transparent methodology, and do not overstate a single poll as broad political reality.
- Include direct links whenever you cite recent information.
- Use exact publication dates and event dates instead of relative phrases when timing matters.
- If evidence conflicts or a claim is disputed, say so plainly instead of forcing a single story.

## Output Shape

Return a compact political-focus brief with these sections:

- `Focus Now`: 3 to 5 ranked themes.
- `Why It Matters`: one short paragraph per theme covering catalyst, affected actors or institutions, and policy, electoral, or geopolitical implications.
- `Evidence`: recent sources and observed signal.
- `What Could Change Next`: upcoming votes, hearings, rulings, debates, filing deadlines, summits, speeches, or implementation milestones that could rotate attention.
- `Confidence`: high, medium, or low based on breadth and recency of evidence.

After returning the brief, save the same final content with `$daily-report-logger` using the default `political-focus` report key unless the user asks you not to create a log.

## Guardrails

- Do not present partisan claims as confirmed facts without corroboration.
- Do not treat proposed bills, campaign promises, or executive announcements as enacted policy without confirmation.
- Distinguish announcement, passage, implementation, litigation, and enforcement.
- Do not overread a single poll, rally, or viral clip as broad political focus unless stronger evidence backs it.
- Do not present stale narratives as current without verifying them first.
- Separate confirmed evidence from inference, especially around legislative math, electoral odds, and diplomatic intent.
