# ======================================================
# 01_project_setup.R
# Project configuration and library loading
# ======================================================

# ---- Paths (FAKE / GENERIC) ----
PROJECT_ROOT <- "path/to/project_root"

DATA_DIR    <- file.path(PROJECT_ROOT, "data")
RESULTS_DIR <- file.path(PROJECT_ROOT, "results")
FIG_DIR     <- file.path(PROJECT_ROOT, "figures")

# ---- Libraries ----
suppressPackageStartupMessages({
  library(tidyverse)
  library(readxl)
  library(DESeq2)
  library(edgeR)
  library(WGCNA)
  library(pheatmap)
  library(ggplot2)
  library(ggrepel)
})
