---
name: investigate-topics
description: Orchestrate one or more installed `*-focus-topics` skills by discovering matching skills, spawning a parallel sub-agent for each requested domain, and synthesizing the results into a cross-domain brief. Use when Codex needs to investigate what multiple domains are focused on today or this week, compare market, political, tech, or science attention side by side, or fan out a broad current-events request into domain-specific focus-topic analyses with up-to-date evidence and source links.
---

# Investigate Topics

## Overview

Coordinate multiple installed `*-focus-topics` skills. Translate the user's requested domains into domain-specific worker tasks, let each sub-agent run the matching focus skill, and then merge those results into one cross-domain answer.

## Delegation Contract

Treat an explicit `/investigate-topics` invocation, or an explicit request to use `$investigate-topics`, as the user's consent to delegated parallel agent work for this workflow.

- Always use sub-agents for this skill when at least one matching `*-focus-topics` skill is available.
- Spawn exactly one fresh worker per selected domain skill for the first pass, even if only one domain is selected.
- Do not silently fall back to running the domain analysis locally. If sub-agents are unavailable, stop and say that `investigate-topics` requires sub-agents for execution.
- Keep synthesis in the parent agent. Only domain investigation is delegated.

## Workflow

1. Define the investigation scope.
Extract the requested domains, timeframe, geography, comparison angle, desired output depth, and whether the user wants logs suppressed. If the user asks to "investigate topics" broadly without naming domains, default to every installed `*-focus-topics` skill you can discover and state that assumption with exact dates. Treat the skill invocation itself as the user's explicit request for delegated execution.

2. Discover the available focus skills.
Run `scripts/find_focus_skills.sh` from this skill directory. It prints tab-separated `skill-name<TAB>absolute-path` rows for every discovered `*-focus-topics` skill.

3. Map the user request to specific skills.
Match explicit skill names first. Otherwise map domain words to the corresponding skill prefix:

- `market` -> `market-focus-topics`
- `politics`, `political`, `government`, `elections` -> `political-focus-topics`
- `tech`, `technology`, `ai`, `software`, `semiconductors` -> `tech-focus-topics`
- `science`, `research`, `space`, `biomedical`, `climate` -> `science-focus-topics`

If the user names a domain that has no installed `*-focus-topics` skill, say so plainly and continue with the domains you can cover.

4. Prepare one worker prompt per selected skill.
Use a fresh `default` sub-agent for each domain. Do not collapse single-domain requests into a local execution path. Keep the worker prompt specific and task-local. Include:

- the skill invocation: `Use $skill-name at /absolute/path/to/skill`
- the original user request
- any investigation constraints or output preferences
- whether the worker should avoid persisting logs
- a reminder to return the domain brief with exact dates and direct source links

5. Spawn workers in parallel.
Call `spawn_agent` once per selected focus skill. This is mandatory for this skill whenever matching domain skills exist. Do not set `model` or `reasoning_effort` unless you are intentionally mirroring explicit parent settings. Omitting both fields preserves the parent agent's current model and reasoning effort, which is the default behavior to use here.

Prefer `fork_context: false` and pass only the context the worker needs. Switch to `fork_context: true` only when the thread contains essential scope details that would be risky or cumbersome to restate.

6. Wait efficiently and recover if needed.
Use a single `wait_agent` call across all active worker IDs with a long enough timeout to avoid busy polling. If a worker fails or times out, retry once only when a clearer prompt or narrower scope is likely to help. Otherwise continue with the completed domains and note the gap.

7. Synthesize the final answer yourself.
The parent agent owns synthesis. Do not delegate the cross-domain merge. Pull out:

- the top topic inside each domain
- themes that recur across multiple domains
- where narratives diverge by domain
- the next catalysts that could rotate attention
- confidence and missing coverage

## Output Shape

Return a concise cross-domain brief with these sections:

- `Domains Covered`: which `*-focus-topics` skills ran and the date range used
- `Domain Takeaways`: one short subsection per domain
- `Cross-Domain Themes`: overlapping narratives, catalysts, or second-order effects
- `What To Watch Next`: upcoming events that could change attention
- `Gaps`: failed domains, missing skills, or low-confidence areas

Keep direct links to recent sources in the domain summaries or in a compact source list.

## Worker Prompt Template

Adapt this template for each selected skill:

```text
Use $SKILL_NAME at SKILL_PATH to answer the user's request for only the DOMAIN domain.

User request:
USER_REQUEST

Scope notes:
- Preserve the user's timeframe, geography, and output preferences.
- Use exact dates instead of relative dates.
- Include direct source links.
- DO_NOT_LOG if the user asked not to persist logs.

Return only the finished DOMAIN brief plus any short caveats that materially affect confidence.
```

## Guardrails

- Do not spawn duplicate workers for the same skill unless a retry is justified.
- Do not fan out to unrelated skills that are not part of the `*-focus-topics` family unless the user explicitly asks.
- Do not let workers synthesize each other; synthesis stays with the parent agent.
- Do not claim that a domain is covered when no matching focus skill was found or completed.
- Keep assumptions explicit when the user did not name domains or a timeframe.
- Do not replace the worker fan-out with local execution just because the scope is small; this skill is defined as a delegated workflow.
