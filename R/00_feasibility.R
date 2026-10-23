# 00_feasibility.R
# Phase 0: is SLE (M32) identifiable in MEPS Conditions files?
# Output: output/feasibility_counts.csv (unweighted persons by ICD-10 code x year)

library(MEPS)
library(dplyr)
library(purrr)
library(tidyr)

files <- c(`2018` = "h207", `2019` = "h214", `2020` = "h222",
           `2021` = "h231", `2022` = "h241", `2023` = "h249",
           `2024` = "h255")

counts <- imap_dfr(files, function(f, y) {
  read_MEPS(file = f) %>%
    filter(ICD10CDX %in% c("M32", "M05", "M06")) %>%
    group_by(ICD10CDX) %>%
    summarise(persons = n_distinct(DUPERSID), .groups = "drop") %>%
    mutate(year = as.integer(y))
})

counts_wide <- counts %>% pivot_wider(names_from = year, values_from = persons)
print(counts_wide)

write.csv(counts_wide, "output/feasibility_counts.csv", row.names = FALSE)
