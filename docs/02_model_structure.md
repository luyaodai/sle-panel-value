# Phase 2 Model Structure

## Decision tree

### Panel arm
```
Multiplexed autoantibodies panel
├─ Has SLE (pre-test probability)
│  ├─ Test + (sensitivity)      → referred now → early diagnosis
│  └─ Test − (1 − sensitivity) 
│       ├─ symptoms persist (p_persist_SLE) → current pathway → delayed diagnosis
│       └─ symptoms resolved (1 - p_persist_SLE) → undiagnosed for now → re-presents later → longer delay, higher risk of organ damage
└─ No SLE (1 − pre-test probability)
   ├─ Test + (1 − specificity)  → referred → unnecessary specialist visit
   └─ Test − (specificity)    
        ├─ symptoms persist (p_persist_noSLE) → current pathway → SLE ruled out later
    	└─ symptoms resolved (1 - p_persist_noSLE) → not referred → referral saved      
```

### Comparator arm: current pathway
```
Current pathway: everyone → full workup (anti-dsDNA, anti-Sm, ENA, C3/C4, CBC, UA, creatinine) → usual wait → clinician judgment
├─ Has SLE (pre-test probability)
│  ├─ Referred (sens_current) → diagnosis after usual wait
│  └─ Not referred (1 − sens_current)
│     ├─ symptoms persist (p_persist_SLE) → repeat workup → delayed diagnosis
│     └─ symptoms resolve (1 − p_persist_SLE) → undiagnosed for now → re-presents later → longer delay, higher risk of organ damage
└─ No SLE (1 − pre-test probability)
   ├─ Referred (1 − spec_current) → rheumatology visit → SLE ruled out
   └─ Not referred (spec_current)
      ├─ symptoms persist (p_persist_noSLE) → repeat workup → SLE ruled out later
      └─ symptoms resolve (1 − p_persist_noSLE) → no further care
```

### Assumption
- The rheumatologist's diagnosis is correct (reference standard).
- Both arms start from the same patients (same pre-test probability).

## End outcomes

| End outcome                | Arm     | Paths that end here                    | Time to diagnosis |
| -------------------------- | ------- | -------------------------------------- | ----------------- |
| Early SLE diagnosis        | Panel   | SLE, referred                          | short             |
| Standard SLE diagnosis     | Current | SLE, referred after full workup        | standard          |
| Delayed SLE diagnosis      | Both    | SLE, not referred, symptoms persist    | medium            |
| Very delayed SLE diagnosis | Both    | SLE, not referred, symptoms resolve    | long              |
| False alarm, ruled out     | Both    | no SLE, referred                       | -                 |
| No SLE, but extra care     | Both    | no SLE, not referred, symptoms persist | -                 |
| No SLE, no further care    | Both    | no SLE, ruled out after repeat workup  | -                 |

## Markov health states


```
SLE, no major organ damage → Lupus nephritis → End-stage renal disease (ESRD)
                │                          │             	   │
                └─────────────────────── Death ────────────────────┘

```

## How the tree links to the Markov model
- Patients diagnosed with SLE (any timing) enter the Markov model in the state: SLE, no major organ damage
  - Scenario: some very-delayed patients already have nephritis at diagnosis, so a share of them enters directly in Lupus nephritis.
- Diagnostic delay changes: the yearly probability of moving from SLE, no major organ damage to Lupus nephritis
  (longer delay → higher risk)
- Patients without SLE: do not enter the Markov model; they only carry the
  decision-tree costs. Their survival is the same in both arms, so it cancels out.
- Cycle length: 1 year; horizon: lifetime; discount: 3%
