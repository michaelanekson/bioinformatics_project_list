# ============================================================
# 05_postprocess_fuma_prs.R
# Prepare METAL output for FUMA and PRS
# ============================================================

rm(list = ls())

library(data.table)
library(dplyr)
library(stringr)

metal <- fread("results/metal/metal_results1.tbl")

metal_fuma <- metal %>%
  mutate(
    CHR = as.integer(str_extract(MarkerName, "^[0-9]+")),
    BP  = as.integer(str_extract(MarkerName, "(?<=:)[0-9]+"))
  ) %>%
  select(
    SNP = MarkerName,
    CHR,
    BP,
    Allele1,
    Allele2,
    Effect,
    StdErr,
    `P-value`,
    N
  )

fwrite(
  metal_fuma,
  "results/metal/metal_for_fuma.tsv",
  sep = "\t",
  quote = FALSE
)

# PRS subset
prs <- metal_fuma %>%
  select(SNP, Allele1, Allele2, Effect, `P-value`)

fwrite(prs, "results/metal/metal_for_prs.txt", sep = "\t", quote = FALSE)
