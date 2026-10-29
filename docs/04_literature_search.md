# Phase 3 · Literature search log

**Method:** targeted literature review (not systematic). Goal: one defensible source per model input.
**Database:** PubMed · **Searched:** Oct 2026 · **Screening:** first ~25 results per search (Best match), title/abstract, plus reference-chasing from key reports.

## 1. Searches

| #  | Topic                                                  | Search string                                                                                                                                                                                                                                                                                                                                                               | Hits | Kept                         |
| -- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- | ---------------------------- |
| 1  | ANA-positive referrals / SLE diagnosis in primary care | ("Lupus Erythematosus, Systemic"[Mesh] OR "systemic lupus erythematosus" OR SLE OR "disseminated lupus erythematosus")<br>AND ("Antibodies, Antinuclear"[Mesh] OR "antinuclear antibody" OR "antinuclear antibodies" OR ANA OR "ANA-positive" OR "positive ANA")<br>AND ("primary care" OR "general practice" OR "general practitioner*" OR "family practice" OR referral*) | 134  | 1                            |
| 1b | Outcome of ANA-positive referrals to rheumatology      | ("antinuclear antibod*"[tiab] OR "positive ANA"[tiab] OR "ANA-positive"[tiab] OR "ANA positivity"[tiab])<br>AND (referral*[tiab] OR referred[tiab])<br>AND rheumatolog*[tiab]                                                                                                                                                                                               | 150  | 2                            |
| 2  | SLE diagnostic delay                                   | ("Lupus Erythematosus, Systemic"[Mesh] OR "systemic lupus erythematosus" OR SLE OR "disseminated lupus erythematosus")<br>AND ("diagnostic delay" OR "delayed diagnosis" OR "time to diagnosis" OR "time-to-diagnosis" OR "diagnostic interval")                                                                                                                            | 273  | 2                            |
| 3  | Lupus nephritis natural history                        | ("Lupus Nephritis"[Mesh] OR "lupus nephritis")<br>AND (incidence OR "end-stage renal disease" OR "end-stage kidney disease" OR ESRD OR ESKD OR "kidney failure")<br>AND ("meta-analysis" OR "systematic review" OR "population-based")                                                                                                                                      | 224  | 0 (leads only)               |
| 4  | SLE mortality                                          | ("Lupus Erythematosus, Systemic"[Mesh] OR "systemic lupus erythematosus" OR SLE OR "lupus nephritis")<br>AND ("standardized mortality ratio*" OR "standardised mortality ratio*" OR SMR OR "excess mortality")                                                                                                                                                              | 105  | 2                            |
| 5a | Lupus nephritis costs (US)                             | ("Lupus Nephritis"[Mesh] OR "lupus nephritis")<br>AND ("Health Care Costs"[Mesh] OR "cost of illness" OR costs OR "economic burden" OR "health care utilization" OR expenditure*)<br>AND ("United States"[Mesh] OR "United States" OR Medicare OR Medicaid OR "commercial insurance" OR claims)                                                                             | 34   | 0 (covered by ICER + Carls)  |
| 5b | SLE utilities                                          | ("Lupus Erythematosus, Systemic"[Mesh] OR "systemic lupus erythematosus" OR SLE OR "lupus nephritis")<br>AND ("EQ-5D" OR "SF-6D" OR "health utility" OR "health state utilit*" OR "utility value*" OR "utility score*" OR QALY OR "quality-adjusted life" OR "time trade-off")                                                                                              | 103  | 4                            |
| 6  | Benchmark test (AVISE CTD)                             | (AVISE OR Exagen OR "cell-bound complement activation products" OR "CB-CAPs")<br>AND (lupus OR SLE)                                                                                                                                                                                                                                                                         | 143  | 1                            |
| 7  | Existing SLE economic models                           | ("Lupus Erythematosus, Systemic"[Mesh] OR "systemic lupus erythematosus" OR SLE OR "lupus nephritis")<br>AND ("cost-effectiveness" OR "cost-utility" OR "economic evaluation" OR Markov)                                                                                                                                                                                    | 121  | 0 (therapy models; see ICER) |

**Lessons from tuning:** short abbreviations (`US`) and short wildcards (`cost*`, `utilit*`) caused most of the noise; searches must be run in PubMed, not PMC full text.

## 2. Kept papers, by search

### Search 1 / 1b · ANA referrals
- **Piga 2023**, Best Pract Res Clin Rheumatol 37(4):101938 (review). **Feeds:** sens_current, spec_current (per-test sens/spec, Table 2; primary refs [22], [23]). **Note:** combination rule assumed; likely optimistic.
- **Kang 2022**, J Korean Med Sci 37:e159 (Korea, n=94,153 tested). **Feeds:** pre_test_probability: SLE ≈2.4% of all ANA+ (derived), 7.8% at ANA ≥1:320. Base 5%, range 2.4–8% (8% = US rheumatology, O'Malley 2022). **Validation:** model PPV 33% vs observed 31%.
- **Olsen & Karp 2020**, Lupus Sci Med 7:e000384 (review). **Feeds:** see Search 6. **Gap quote:** no CEA of CBCAPS vs. standard testing; untested in primary care.

### Search 2 · Diagnostic delay
- **Oglesby 2014**, Appl Health Econ Health Policy 12(2):179–90 (US commercial claims, 18–64, n=4,166/group). **Feeds:** rr_late_diag = 1.15 (1.08–1.22), severe-flare RR 0.87 inverted; upper 1.25 (hospitalization). Late = ≥6 mo from ANA/onset. **Note:** proxy (flares, not nephritis). **Bonus:** +$80 PPPM inpatient cost if late (2010 USD).
- **Kernder 2021**, Lupus (LuLa, Germany, n=585). **Feeds:** t_standard upper check = 47 mo mean (SD 73), symptom onset → dx. Delay associated with damage (β 0.137), activity, QoL; not a ratio → supports rr_late_diag qualitatively.

### Search 4 · Mortality
- **Lee 2024**, Lupus (meta-analysis, 29 studies). **Feeds:** smr_SLE = 2.87 (95% CI 2.49–3.24); female 3.26. **Note:** includes organ-damage patients → overstates no-damage state.
- **Reppe Moe 2021**, J Clin Med 10:4306 (systematic review, population-based). **Feeds:** smr_SLE US check 2.6–3.1 (Lim 2019 GA 3.1, 2.8–3.4). LN prevalence in cohorts 30–42%.

### Search 5b · Utilities
- **Parodis 2025**, RMD Open 11(4):e006061 (post hoc, 4 belimumab RCTs, n≈2,400 SLE). **Feeds:** u_SLE = 0.75 base (trial baseline), range 0.74–0.85 (week 52, LLDAS/remission). EQ-5D-3L; severe LN excluded.
- **Touma 2024**, (journal), PMID 38840229 (US + EU real-world, n=730/377). **Feeds:** u_SLE range: EQ-5D-3L 0.88 low / 0.79 higher activity. Also WPAI work impairment → societal scenario.
- **Hartz 2014**, Value Health (TTO vignette, 6 countries). **Feeds:** u_SLE scenario = anchor "minimal disease activity" 0.66–0.82 (US: __). **Note:** vignette TTO, not EQ-5D.
- **Tang 2022**, Front Med 9:876835 (Columbia, n=71). **Feeds:** u_SLE check = 0.74 (EQ-5D-3L, US scoring). **Caveat:** mixed clinic (60–70% SLE; ~24% of SLE with LN history).

### Search 6 · Benchmark (AVISE)
- **Olsen & Karp 2020**, Lupus Sci Med 7:e000384 (review). **Feeds:** sens_panel 0.80 (Putterman 2014), low 0.565 in early disease (Liang 2020); spec_panel ≈0.86 (from LR+ 5.6), range 0.70–0.92.
- **O'Malley 2022**, J Manag Care Spec Pharm (US EHR + claims, n≈44,600 test episodes). **Feeds:** PPV validation (AVISE+ 31% SLE dx vs 8% after standard ANA+), positivity 11.2% vs 23.6%, lab cost drop after negative −$985 vs −$356/yr. **Caveat:** Exagen-funded; rheumatology setting; observational.

## 3. Grey literature and reference-chasing

- **ICER 2022**, Lupus Nephritis Final Evidence Report (US). **Feeds:** c_LN ($42,510 AD / $7,871 CR / $8,185 PR, 2019 USD → weighted), c_ESRD check ($120,920), u_LN (0.624 AD – 0.80 CR), u_ESRD (0.549), p_nephritis_ESRD: 10–30% ESRD within 15 yr (refs Appel 1987, Ortega 2010, Chen 2008) → yearly 0.7% / 1.5% / 2.4%.
- **Rees 2016**, Arthritis Care Res, doi:10.1002/acr.23021 (UK CPRD, primary care). **Feeds:** t_standard base ≈19 mo (first recorded primary care visit → dx).
- **Carls 2009**, J Occup Environ Med (from ICER refs). **Feeds:** c_LN check (US, SLE with vs. without nephritis).
- **Feldman 2018**, Arthritis Rheumatol (from ICER refs). **Feeds:** p_nephritis_ESRD, smr_nephritis (US Medicaid).

## 4. Leads to confirm (open in block 5)

| Input            | Paper                                               | What to take                                  |
| ---------------- | --------------------------------------------------- | --------------------------------------------- |
| p_SLE_nephritis  | Hanly 2016, Rheumatology (SLICC inception cohort)   | % developing LN by year X                     |
| p_nephritis_ESRD | Tektonidou 2016 (meta-analysis, 1971–2015)          | Pooled ESRD risk at 5/10/15 yr, recent period |
| smr_nephritis    | Reppe Moe 2019, Lupus 28:818 (backup: Feldman 2018) | SMR or HR with vs. without LN                 |

## 5. Open items

- [ ] Lee 2024: North America SMR value
- [ ] Hartz 2014: US anchor value
- [ ] Touma 2024: journal name; confirm 0.88 = low activity in results table
- [ ] Piga 2023: citations for refs [22], [23]
- [ ] p_persist_SLE, p_persist_noSLE: no source → assumption (set in block 5)
