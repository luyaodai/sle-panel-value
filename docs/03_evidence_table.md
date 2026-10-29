# Phase 3 · Model inputs and evidence

## 1. Probabilities

| Parameter            | Meaning                                                                                            | Source type                       | Base | Low   | High | Source                   | Notes                                                      |
| -------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------- | ---- | ----- | ---- | ------------------------ | ---------------------------------------------------------- |
| pre_test_probability | Share of ANA+ primary care patients with SLE symptoms who actually have SLE                        | Literature                        | 0.05 | 0.024 | 0.08 | Kang 2022; O'Malley 2022 | Low = SLE among all ANA+ (derived); high = US rheumatology |
| sens_panel           | Panel: share of patients with SLE who test positive (solved for; base case from an analog test)    | Solved for (base case: benchmark) |      |       |      |                          |                                                            |
| spec_panel           | Panel: share of patients without SLE who test negative (solved for; base case from an analog test) | Solved for (base case: benchmark) |      |       |      |                          |                                                            |
| sens_current         | Current pathway: share of patients with SLE who are referred after the full workup                 | Literature                        |      |       |      |                          |                                                            |
| spec_current         | Current pathway: share of patients without SLE who are not referred                                | Literature                        |      |       |      |                          |                                                            |
| p_persist_SLE        | Share of not-referred SLE patients whose symptoms persist                                          | Literature                        |      |       |      |                          |                                                            |
| p_persist_noSLE      | Share of not-referred non-SLE patients whose symptoms persist                                      | Literature                        |      |       |      |                          |                                                            |

## 2. Times

| Parameter  | Meaning                                                                  | Source type | Where                                                                                                                        |
| ---------- | ------------------------------------------------------------------------ | ----------- | ---------------------------------------------------------------------------------------------------------------------------- |
| t_standard | Months from ANA+ result to diagnosis on the current pathway              | Literature  | Rees 2016 (UK primary care, first recorded visit → dx): base 19 mo; range 6 (Oglesby early cut-off) – 47 (Kernder 2021 mean) |
| t_delay    | Extra months when symptoms persist and the patient is referred later     | Literature  | Search; if not found → Assumption                                                                                            |
| t_long     | Extra months when symptoms resolved and the patient is re-presents later | Literature  | Search; if not found → Assumption                                                                                            |
| t_panel    | Months from ANA+ result to diagnosis with the panel test                 | Assumption  | method TBD                                                                                                                   |

## 3. Markov transitions

| Parameter        | Meaning                                                                   | Source type | Where                    |
| ---------------- | ------------------------------------------------------------------------- | ----------- | ------------------------ |
| p_SLE_nephritis  | Yearly probability: SLE, no major organ damage → lupus nephritis          | Literature  | Search                   |
| p_nephritis_ESRD | Yearly probability: lupus nephritis → ESRD                                | Literature  | Search                   |
| p_death_bg       | Background death rate by age (from US life tables)                        | Life table  | CDC US life tables       |
| p_ESRD_death     | Yearly probability: ESRD → Death                                          | Registry    | USRDS Annual Data Report |
| rr_late_diag     | Relative risk of major organ damage → lupus nephritis when diagnosed late | Literature  | Search                   |
| smr_SLE          | Death-rate multiplier, no major organ damage                              | Literature  | Search                   |
| smr_nephritis    | Death-rate multiplier, lupus nephritis                                    | Literature  | Search                   |

## 4. Costs

| Parameter  | Meaning                                            | Source type                       | Where                                                  |
| ---------- | -------------------------------------------------- | --------------------------------- | ------------------------------------------------------ |
| c_panel    | Multiplexed autoantibodies panel test, per patient | Solved for (base case: benchmark) | Analog test price: AVISE CTD (Exagen), Medicare rate   |
| c_pc_visit | Primary care visit                                 | Fee schedule                      | CMS Physician Fee Schedule, office visit code          |
| c_rh_visit | Rheumatology visit                                 | Fee schedule                      | CMS Physician Fee Schedule, new-patient visit code     |
| c_workup   | The full workup tests, per patient                 | Fee schedule                      | CMS Clinical Laboratory Fee Schedule, sum of each test |

## 5. Utilities

| Parameter     | Meaning                                                  | Source type | Where                               |
| ------------- | -------------------------------------------------------- | ----------- | ----------------------------------- |
| c_SLE         | Yearly medical cost, SLE, no major organ damage          | MEPS        | Own analysis, MEPS 2018–2022 + 2024 |
| c_LN          | Yearly medical cost, lupus nephritis                     | Literature  | Search                              |
| c_ESRD        | Yearly medical cost, ESRD                                | Registry    | USRDS Annual Data Report            |
| c_undiagnosed | Yearly medical cost before diagnosis                     | Assumption  | method TBD                          |
| u_SLE         | Quality-of-life weight (0–1), SLE, no major organ damage | Literature  | Search; if not found → Assumption   |
| u_LN          | Quality-of-life weight (0–1), lupus nephritis            | Literature  | Search; if not found → Assumption   |
| u_ESRD        | Quality-of-life weight (0–1), ESRD                       | Literature  | Search; if not found → Assumption   |
| u_undiagnosed | Quality-of-life weight (0–1), before diagnosis           | Assumption  | method TBD                          |
