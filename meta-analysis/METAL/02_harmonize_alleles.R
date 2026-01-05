# ============================================================
# 02_harmonize_alleles.R
# Harmonize alleles and effect directions across cohorts
# ============================================================

rm(list = ls())

library(data.table)
library(dplyr)

INPUT_DIR  <- "data/processed/"
OUTPUT_DIR <- "data/harmonized/"
dir.create(OUTPUT_DIR, recursive = TRUE, showWarnings = FALSE)

cohort_a <- fread(file.path(INPUT_DIR, "cohort_a_lifted.tsv"))
cohort_b <- fread(file.path(INPUT_DIR, "cohort_b_lifted.tsv"))

# ---------- CREATE MARKER ----------
make_marker <- function(df) {
  df %>% 
    mutate(
      MarkerName = paste0(CHROM, ":", BP, "_", A2, "/", A1)
    )
}

cohort_a <- make_marker(cohort_a)
cohort_b <- make_marker(cohort_b)

# ---------- ALLELE FLIP LOGIC ----------
flip_effects <- function(df, flip_ids) {
  df %>%
    mutate(
      BETA = ifelse(SNP %in% flip_ids, -BETA, BETA),
      A1FREQ = ifelse(SNP %in% flip_ids, 1 - A1FREQ, A1FREQ)
    )
}

shared <- inner_join(
  cohort_a[, .(CHROM, BP, A1, A2, SNP)],
  cohort_b[, .(CHROM, BP, A1, A2, SNP)],
  by = c("CHROM", "BP")
)

flip_ids <- shared$SNP[shared$A1.x == shared$A2.y]

cohort_b <- flip_effects(cohort_b, flip_ids)

# ---------- SAVE ----------
fwrite(cohort_a, file.path(OUTPUT_DIR, "cohort_a_harmonized.tsv"))
fwrite(cohort_b, file.path(OUTPUT_DIR, "cohort_b_harmonized.tsv"))
