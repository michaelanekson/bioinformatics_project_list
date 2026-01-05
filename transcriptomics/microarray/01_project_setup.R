# ======================================================
# 01_project_setup.R
# Microarray project configuration
# ======================================================

PROJECT_ROOT <- "path/to/project_root"

DATA_DIR    <- file.path(PROJECT_ROOT, "data")
RESULTS_DIR <- file.path(PROJECT_ROOT, "results")
FIG_DIR     <- file.path(PROJECT_ROOT, "figures")

suppressPackageStartupMessages({
  library(limma)
  library(tidyverse)
  library(readxl)
  library(pheatmap)
  library(ggrepel)
  library(ggpubr)
  library(clusterProfiler)
  library(enrichplot)
  library(msigdbr)
  library(org.Rn.eg.db)
  library(pathview)
})
