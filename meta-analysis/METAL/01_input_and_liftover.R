# ============================================================
# 01_input_and_liftover.R
# Load GWAS summary statistics and harmonize genome build
# ============================================================

rm(list = ls())

library(data.table)
library(dplyr)
library(MungeSumstats)

# ---------- CONFIG ----------
INPUT_DIR  <- "data/raw_gwas/"
OUTPUT_DIR <- "data/processed/"
dir.create(OUTPUT_DIR, recursive = TRUE, showWarnings = FALSE)

# ---------- LOAD DATA ----------
cohort_a <- fread(file.path(INPUT_DIR, "cohort_a_gwas.txt.gz"))
cohort_b <- fread(file.path(INPUT_DIR, "cohort_b_gwas.txt.gz"))
cohort_c <- fread(file.path(INPUT_DIR, "cohort_c_gwas.txt.gz"))

# ---------- LIFTOVER (example: GRCh38 → GRCh37) ----------
liftover_to_37 <- function(df, chr_col, pos_col, snp_col) {
  liftover_gwas(
    df,
    build = 38,
    to = 37,
    chr_col = chr_col,
    pos_col = pos_col,
    snp_col = snp_col,
    build_fallback = "biomart"
  ) %>% 
    mutate(CHROM = as.numeric(CHROM)) %>% 
    filter(!is.na(CHROM))
}

cohort_a <- liftover_to_37(cohort_a, "CHR", "BP", "SNP")
cohort_b <- liftover_to_37(cohort_b, "CHR", "BP", "SNP")

# ---------- SAVE ----------
fwrite(cohort_a, file.path(OUTPUT_DIR, "cohort_a_lifted.tsv"))
fwrite(cohort_b, file.path(OUTPUT_DIR, "cohort_b_lifted.tsv"))
fwrite(cohort_c, file.path(OUTPUT_DIR, "cohort_c_lifted.tsv"))
