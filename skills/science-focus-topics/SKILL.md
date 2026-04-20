---
name: science-focus-topics
description: Analyze recent science attention and identify the papers, missions, experiments, clinical results, agency releases, and research narratives currently driving discussion or downstream impact. Use when Codex needs to answer what the science world is focused on today or this week, which themes dominate current science news flow, why they matter, or how to summarize live scientific narratives with up-to-date evidence and source links.
---

# Science Focus Topics

## Overview

Identify the few science themes that are genuinely commanding attention right now. Ground every claim in current evidence, separate broad scientific attention from one-off hype or institutional promotion, explain why each theme matters for research, public understanding, policy, or commercialization, and then save the finished brief through `$daily-report-logger`.

## Workflow

1. Define the scope before collecting evidence.
Use the user's discipline, geography, institutions, and timeframe when provided. Otherwise default to a global science view covering biomedical and health research, climate and earth science, space and astronomy, energy and materials research, and major physics or biology developments across the last 7 days plus the current day. State every assumption with exact dates.

2. Gather fresh evidence.
Browse the web because science focus is temporally unstable. Pull a mix of journal publications, preprints, conference releases, clinical-trial updates, agency statements, mission updates, lab or university releases, and reputable reporting. Prefer primary sources for facts and high-quality reporting for narrative confirmation.

3. Build an evidence set.
Track the theme, source, timestamp, affected fields or institutions, observed signal, and whether the source is primary or secondary. Open [references/science-evidence-framework.md](references/science-evidence-framework.md) when you need source priorities, scoring rules, or a reusable capture template.

4. Cluster repeated signals.
Treat a topic as real science focus only when it appears across multiple independent sources, is tied to a clear publication, mission event, experimental result, clinical readout, or agency release, and is visibly shaping scientific discussion, funding attention, public interest, or downstream policy or industry decisions.

5. Rank themes by attention.
Prioritize recurrence across sources, scientific significance, breadth of affected fields or institutions, and how near the next confirming catalyst is.

6. Synthesize the answer.
Explain what the science world seems to care about, why now, who is affected, how the focus is showing up through publications, missions, experiments, clinical results, or agency actions, what could confirm or weaken the narrative, and where uncertainty remains.

7. Persist the brief with `$daily-report-logger`.
After the final brief is ready, save it unless the user explicitly says not to persist the result. Use these defaults:

- `report`: `science-focus`
- `title`: `Science Focus`
- `source_skill`: `science-focus-topics`
- `summary`: 1 to 2 sentences capturing the main science takeaway
- `request`: the user's original request
- `output`: the final science-focus brief
- `notes`: scope assumptions, date coverage, or `(none)`

Write to `history/daily/mm-dd-yyyy/science-focus-log.md`. If a log already exists for the same date, overwrite it by calling `$daily-report-logger` again with the updated brief.

When you need a deterministic file write, use:

```bash
tmp_request="$(mktemp)"
tmp_output="$(mktemp)"
tmp_notes="$(mktemp)"

printf '%s' "$USER_REQUEST" > "$tmp_request"
printf '%s' "$FINAL_BRIEF" > "$tmp_output"
printf '%s' "$NOTES" > "$tmp_notes"

"/workspaces/finance/skills/daily-report-logger/scripts/write_daily_log.sh" \
  --report "science-focus" \
  --title "Science Focus" \
  --source-skill "science-focus-topics" \
  --summary "$SUMMARY" \
  --request-file "$tmp_request" \
  --output-file "$tmp_output" \
  --notes-file "$tmp_notes"
```

## Source Mix

- Prefer journals, preprint servers, trial registries, mission teams, agency releases, observatory updates, and institutional repositories for factual claims.
- Use lab, university, or company press releases for framing only after checking the underlying paper, dataset, registry entry, or official mission material when possible.
- Use reputable reporting to confirm which themes dominate scientific discussion and where the broader significance is being debated.
- Distinguish peer-reviewed papers, preprints, conference abstracts, and press releases instead of treating them as equivalent evidence.
- Include direct links whenever you cite recent information.
- Use exact publication dates and event dates instead of relative phrases when timing matters.
- If evidence conflicts or replication is uncertain, say so plainly instead of forcing a single story.

## Output Shape

Return a compact science-focus brief with these sections:

- `Focus Now`: 3 to 5 ranked themes.
- `Why It Matters`: one short paragraph per theme covering catalyst, affected fields or institutions, and scientific, policy, or commercial implications.
- `Evidence`: recent sources and observed signal.
- `What Could Change Next`: upcoming journal releases, conferences, trial readouts, mission milestones, agency decisions, or replication efforts that could rotate attention.
- `Confidence`: high, medium, or low based on breadth and recency of evidence.

After returning the brief, save the same final content with `$daily-report-logger` using the default `science-focus` report key unless the user asks you not to create a log.

## Guardrails

- Do not present a preprint, conference abstract, or institutional press release as settled consensus without saying what stage the evidence is at.
- Do not treat early experimental or clinical findings as broad real-world applicability without confirmation.
- Distinguish publication, peer review, replication, interpretation, and downstream application.
- Do not present stale narratives as current without verifying them first.
- Separate confirmed evidence from inference, especially around causality, health claims, and commercialization timelines.
