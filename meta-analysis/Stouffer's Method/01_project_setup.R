# ======================================================
# Project setup: Transcriptomics Meta-analysis
# ======================================================

PROJECT_ROOT <- "path/to/project_root"

DATA_DIR    <- file.path(PROJECT_ROOT, "data")
RESULTS_DIR <- file.path(PROJECT_ROOT, "results")

suppressPackageStartupMessages({
  library(tidyverse)
  library(metap)     # Stouffer / Z-score meta-analysis
})
