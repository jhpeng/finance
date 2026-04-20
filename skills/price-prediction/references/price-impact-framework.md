# Price Impact Framework

Use this reference when you need a compact rubric for mapping today's domain forecast logs into product-specific price targets.

## Core Method

1. Start with the verified current price.
Treat the live or latest-close price as the base level that every horizon target must explain.

2. Read all available domain forecast logs.
Use every discovered `*-focus-forecast-log.md` as an input, even when some domains end up low relevance.

3. Weight domains by product sensitivity.
Ask which domains can realistically move this product over the requested horizon. Use `high`, `medium`, or `low` relevance instead of forcing numeric weights.

4. Build one dominant path per horizon.
Use the lead scenario from the most relevant logs, reconcile conflicts, and describe one product-centric base case for `1 week`, `1 month`, `3 months`, and `1 year`.

5. Convert the path into a price level, not only a direction.
State the expected effect on the product, the implied target, and a plausible range around it.

## Product Sensitivity Shortcuts

### Broad equity ETFs and major index funds

- Usually treat `market` as `high`.
- Treat `tech` as `high` only when the fund is tech-heavy or the top holdings are AI or semiconductor names.
- Treat `political` as `medium` to `high` when policy, war, tariffs, taxes, or rates matter to the benchmark.
- Treat `science` as `low` unless healthcare, biotech, or industrial innovation concentration is material.

### Single-name technology stocks

- Usually treat `tech` and `market` as `high`.
- Raise `political` if export controls, antitrust, procurement, or geopolitical supply chains matter.
- Raise `science` when the name depends on drug discovery, diagnostics, space, energy, or research tools.

### Gold, commodity, and hard-asset funds

- Usually treat `market` and `political` as `high`.
- Treat `tech` as `low` unless the commodity has a direct technology-demand driver.
- Treat `science` as `low` unless research or regulation changes the supply-demand picture.

### Bond funds and rate-sensitive products

- Usually treat `market` and `political` as `high`.
- Focus on inflation, growth, Fed path, fiscal risk, and risk-off behavior.
- Treat `tech` and `science` as secondary unless they clearly change macro expectations.

### Healthcare, biotech, and life-science names

- Usually treat `science` and `market` as `high`.
- Raise `political` when reimbursement, regulation, or public funding matter.
- Treat `tech` as supporting context unless product-specific compute or platform dependence is central.

## Price Target Calibration

### 1 week

Use short-horizon catalysts, positioning, sentiment, and immediate spillovers. Favor smaller moves unless the forecast logs imply a clearly binary setup.

### 1 month

Use first-round follow-through such as earnings revisions, policy messaging, supply response, demand confirmation, or narrative rotation.

### 3 months

Use established trends, implementation effects, or durable leadership changes. Let second-order impacts matter more here than at `1 week`.

### 1 year

Use structural outcomes, regime shifts, adoption curves, fiscal or policy changes, or longer-lived supply-demand adjustments.

## Precision Rules

- Prefer approximate but defensible targets over false exactness.
- Round targets in a way that matches the product's trading convention and price level.
- Widen ranges when today's forecast logs do not directly address the instrument.
- Lower confidence when the product is highly idiosyncratic or depends on company-specific events not covered by the focus forecasts.

## Quality Checks

Before finalizing, check:

- Did you verify a current price from a live or recent source?
- Did you use all available forecast logs, even if some were low relevance?
- Did you explain why some domains mattered more than others?
- Does each target clearly connect back to the dominant horizon scenario?
- Does the uncertainty range widen as the horizon extends unless there is a good reason not to?
