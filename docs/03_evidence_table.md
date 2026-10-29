# Phase 3 · Model inputs and evidence

## 1. Probabilities

| Parameter            | Meaning                                                                                            |
| -------------------- | -------------------------------------------------------------------------------------------------- |
| pre_test_probability | Share of ANA+ primary care patients with SLE symptoms who actually have SLE                        |
| sens_panel           | Panel: share of patients with SLE who test positive (solved for; base case from an analog test)    |
| spec_panel           | Panel: share of patients without SLE who test negative (solved for; base case from an analog test) |
| sens_current         | Current pathway: share of patients with SLE who are referred after the full workup                 |
| spec_current         | Current pathway: share of patients without SLE who are not referred                                |
| p_persist_SLE        | Share of not-referred SLE patients whose symptoms persist                                          |
| p_persist_noSLE      | Share of not-referred non-SLE patients whose symptoms persist                                      |

## 2. Times

| Parameter  | Meaning                                                                  |
| ---------- | ------------------------------------------------------------------------ |
| t_standard | Months from ANA+ result to diagnosis on the current pathway              |
| t_delay    | Extra months when symptoms persist and the patient is referred later     |
| t_long     | Extra months when symptoms resolved and the patient is re-presents later |
| t_panel    | Months from ANA+ result to diagnosis with the panel test                 |

## 3. Markov transitions

| Parameter        | Meaning                                                                   |
| ---------------- | ------------------------------------------------------------------------- |
| p_SLE_nephritis  | Yearly probability: SLE, no major organ damage → lupus nephritis          |
| p_nephritis_ESRD | Yearly probability: lupus nephritis → ESRD                                |
| p_death_bg       | Background death rate by age (from US life tables)                        |
| p_ESRD_death     | Yearly probability: ESRD → Death                                          |
| rr_late_diag     | Relative risk of major organ damage → lupus nephritis when diagnosed late |
| smr_SLE          | Death-rate multiplier, no major organ damage                              |
| smr_nephritis    | Death-rate multiplier, lupus nephritis                                    |

## 4. Costs

| Parameter  | Meaning                                            |
| ---------- | -------------------------------------------------- |
| c_panel    | Multiplexed autoantibodies panel test, per patient |
| c_pc_visit | Primary care visit                                 |
| c_rh_visit | Rheumatology visit                                 |
| c_workup   | The full workup tests, per patient                 |

## 5. Utilities

| Parameter     | Meaning                                                  |
| ------------- | -------------------------------------------------------- |
| c_SLE         | Yearly medical cost, SLE, no major organ damage          |
| c_LN          | Yearly medical cost, lupus nephritis                     |
| c_ESRD        | Yearly medical cost, ESRD                                |
| c_undiagnosed | Yearly medical cost before diagnosis                     |
| u_SLE         | Quality-of-life weight (0–1), SLE, no major organ damage |
| u_LN          | Quality-of-life weight (0–1), lupus nephritis            |
| u_ESRD        | Quality-of-life weight (0–1), ESRD                       |
| u_undiagnosed | Quality-of-life weight (0–1), before diagnosis           |
