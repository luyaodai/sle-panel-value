# SLE Multiplex Autoantibody Panel: Early Value Assessment

**Status: Phase 1 complete (scope).** Model build in progress; see [Roadmap](#roadmap).

Mock client question: a diagnostics company asks what accuracy and price its multiplex autoantibody panel for systemic lupus erythematosus (SLE) would need for US payers to see value. The panel is hypothetical. This project uses public data and published literature only.

## Decision question
For a US commercial health plan, what sensitivity, specificity, and price would a multiplexed autoantibody panel, used after a positive ANA result to triage rheumatology referral need, in 18-64 year old patients in primary care with symptoms suggestive of SLE without a prior SLE diagnosis, to be cost-effective （lifetime horizon) and affordable over 3 years at $100,000/QALY compared with the current pathway?

## PICO
| | |
|---|---|
| Population | Adults aged 18-64 in a US commercial health plan in primary care with symptoms suggestive of SLE with a positive ANA, but without a prior SLE diagnosis |
| Intervention | After a positive ANA result, do a multiplexed autoantibody panel. Positive -> refer to rheumatology. Negative -> no referrals and no further workup now; if symptoms persist -> current pathway |
| Comparator | the current pathway of all the different workups (specific autoantibodies like anti-dsDNA, anti-Sm and ENA panel; supporting labs like complement C3/C4, complete blood count, urinalysis, creatinine, and sometimes antiphospholipid antibodies),then referral based on clinician judgment |
| Outcomes | **Test:** sensitivity, specificity for SLE. **Clinical:** rheumatology referrals avoided, comparator tests avoided (anti-dsDNA, anti-Sm, ENA, C3/C4), SLE cases missed at first visit, time to SLE diagnosis, lupus nephritis / organ damage from delayed diagnosis. **Economic:** costs (test, primary care visits, specialist visits, lupus nephritis treatment, SLE treatment), QALYs, cost per QALY, max cost-effective price (headroom), minimum sensitivity needed, 3-year budget impact per member per month. |

## Analysis settings
- Perspective: US commercial payer (base case), direct medical costs only; scenario: societal (adds productivity losses)
- Time horizon: lifetime (cost-effectiveness) because harm from late diagnosis (e.g., lupus nephritis) builds up over years; 3 years (budget impact)
- Discount rate: 3%/year for costs and QALYs; budget impact undiscounted
- Willingness to pay: $100,000/QALY base case; $50,000 - $200,000 in sensitivity analysis
- Cost year: 2025 USD, inflated with the PCE health index

## Out of scope
- Children (<18): separate pathway via pediatric rheumatology
- Patients with known SLE: already under specialist care
- Choice of SLE treatment after diagnosis: a separate decision
- Medicare and Medicaid: different prices and populations
- Unpublished lab data: public data and published literature only; the panel is hypothetical

## Data decisions
- MEPS 2018–2022 + 2024 (6 years). 2023 excluded: SLE (M32) masked that year.
- SLE = ICD10CDX "M32" (351 unweighted person-years).
- M05 masked in all years; RA fallback would use M06 only.
- Raw MEPS files are not committed (`data/` is in `.gitignore`).

## Roadmap

| Phase | What | Outputs | Status |
|---|---|---|---|
| 1. Scope | Decision question, PICO, analysis settings | This README | ✅ Complete |
| 2. Model structure | Decision tree for the triage pathway (panel vs. current pathway); Markov model for outcomes after early vs. late diagnosis | Model diagram, health states | Next |
| 3. Parameters & literature | Targeted literature review (pre-test probability, test accuracy, diagnostic delay, organ damage, utilities, costs); MEPS two-part model for the incremental annual cost of SLE | Evidence table, parameter file | Planned |
| 4. Analysis | Base-case cost per QALY; one-way (tornado) and probabilistic sensitivity analysis; headroom price; minimum sensitivity; 3-year budget impact | R scripts, results tables | Planned |
| 5. Results | Case-study page with interactive price/accuracy calculator; 10-slide client readout | Figures, web page, slides | Planned |

## Repository layout

| Path | Contents |
|---|---|
| `docs/01_scope.md` | Scope: decision question, PICO, analysis settings |
| `R/00_feasibility.R` | Checks the SLE sample size in MEPS Conditions files |
| `output/` | Aggregate results only (no person-level data) |
| `data/` | Raw and derived MEPS files (local only, not committed) |
