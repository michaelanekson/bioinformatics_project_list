# ============================================================
# 03_prepare_metal_inputs.R
# Prepare METAL-compatible input files
# ============================================================

rm(list = ls())

library(data.table)
library(dplyr)

INPUT_DIR  <- "data/harmonized/"
OUTPUT_DIR <- "data/metal_inputs/"
dir.create(OUTPUT_DIR, recursive = TRUE, showWarnings = FALSE)

format_for_metal <- function(df) {
  df %>%
    select(
      MarkerName,
      A1, A2,
      A1FREQ,
      BETA,
      SE,
      P,
      N
    )
}

cohort_a <- fread(file.path(INPUT_DIR, "cohort_a_harmonized.tsv"))
cohort_b <- fread(file.path(INPUT_DIR, "cohort_b_harmonized.tsv"))

fwrite(format_for_metal(cohort_a),
       file.path(OUTPUT_DIR, "cohort_a_toMETAL.txt"),
       sep = "\t")

fwrite(format_for_metal(cohort_b),
       file.path(OUTPUT_DIR, "cohort_b_toMETAL.txt"),
       sep = "\t")
