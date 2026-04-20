---
name: tech-focus-topics
description: Analyze recent technology attention and identify the topics, launches, outages, platform shifts, policy moves, and ecosystem narratives currently driving discussion or business impact. Use when Codex needs to answer what the tech world is focused on today or this week, which AI, semiconductor, cloud, software, device, security, or regulatory themes dominate current news flow, why they matter, or how to summarize live tech narratives with up-to-date evidence and source links.
---

# Tech Focus Topics

## Overview

Identify the few technology themes that are genuinely commanding attention right now. Ground every claim in current evidence, separate broad industry attention from one-off hype, explain why each theme matters for companies, developers, users, or enterprise buyers, and then save the finished brief through `$daily-report-logger`.

## Workflow

1. Define the scope before collecting evidence.
Use the user's subsector, companies, geography, and timeframe when provided. Otherwise default to a US-led global technology view covering AI platforms, semiconductors, cloud software, cybersecurity, and major consumer-device or platform stories across the last 7 days plus the current day. State every assumption with exact dates.

2. Gather fresh evidence.
Browse the web because technology focus is temporally unstable. Pull a mix of official product blogs, docs, release notes, status pages, security advisories, earnings materials, filings, conference announcements, regulatory releases, and reputable reporting. Prefer primary sources for facts and high-quality reporting for narrative confirmation.

3. Build an evidence set.
Track the theme, source, timestamp, affected companies or platforms, observed signal, and whether the source is primary or secondary. Open [references/tech-evidence-framework.md](references/tech-evidence-framework.md) when you need source priorities, scoring rules, or a reusable capture template.

4. Cluster repeated signals.
Treat a topic as real technology focus only when it appears across multiple independent sources, shows up through a clear launch, outage, regulatory move, funding event, usage signal, or pricing shift, and is visibly affecting discussion or decisions.

5. Rank themes by attention.
Prioritize recurrence across sources, reach across companies or developers, business impact, and how near the next confirming catalyst is.

6. Synthesize the answer.
Explain what the tech world seems to care about, why now, who is affected, how the focus is showing up in launches, spending, competition, outages, or policy, what could confirm or weaken the narrative, and where uncertainty remains.

7. Persist the brief with `$daily-report-logger`.
After the final brief is ready, save it unless the user explicitly says not to persist the result. Use these defaults:

- `report`: `tech-focus`
- `title`: `Tech Focus`
- `source_skill`: `tech-focus-topics`
- `summary`: 1 to 2 sentences capturing the main technology takeaway
- `request`: the user's original request
- `output`: the final tech-focus brief
- `notes`: scope assumptions, date coverage, or `(none)`

Write to `history/daily/mm-dd-yyyy/tech-focus-log.md`. If a log already exists for the same date, overwrite it by calling `$daily-report-logger` again with the updated brief.

When you need a deterministic file write, use:

```bash
tmp_request="$(mktemp)"
tmp_output="$(mktemp)"
tmp_notes="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_BRIEF" > "$tmp_output"
printf '%s' "$NOTES" > "$tmp_notes"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "tech-focus" \
  --title "Tech Focus" \
  --source-skill "tech-focus-topics" \
  --summary "$SUMMARY" \
  --request-file "$tmp_request" \
  --output-file "$tmp_output" \
  --notes-file "$tmp_notes"
```

## Source Mix

- Prefer official company blogs, docs, release notes, status pages, investor-relations pages, security advisories, and regulator announcements for factual claims.
- Use reputable reporting to confirm which themes dominate industry discussion and competitive framing.
- Use primary materials from conferences, keynote transcripts, or product documentation to separate demos from shipping reality.
- Include direct links whenever you cite recent information.
- Use exact publication dates and event dates instead of relative phrases when timing matters.
- If evidence conflicts, say so plainly instead of forcing a single story.

## Output Shape

Return a compact tech-focus brief with these sections:

- `Focus Now`: 3 to 5 ranked themes.
- `Why It Matters`: one short paragraph per theme covering catalyst, affected companies or platforms, and business or ecosystem implications.
- `Evidence`: recent sources and observed signal.
- `What Could Change Next`: upcoming launches, earnings, conferences, policy actions, or security disclosures that could rotate attention.
- `Confidence`: high, medium, or low based on breadth and recency of evidence.

After returning the brief, save the same final content with `$daily-report-logger` using the default `tech-focus` report key unless the user asks you not to create a log.

## Guardrails

- Do not equate social-media chatter with durable industry focus unless stronger evidence backs it.
- Do not treat a product announcement as adoption, revenue, or technical superiority without confirmation.
- Distinguish shipping availability, user uptake, and business impact from demo or roadmap language.
- Do not present stale narratives as current without verifying them first.
- Separate confirmed evidence from inference, especially around competitive positioning and policy outcomes.
