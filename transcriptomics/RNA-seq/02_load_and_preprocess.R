# ======================================================
# 02_load_and_preprocess.R
# Load raw expression data and preprocess count matrix
# ======================================================

source("scripts/01_project_setup.R")

# ---- Input files (fake paths) ----
COUNT_FILE <- file.path(DATA_DIR, "SET5.genMat.csv")
FPKM_FILE  <- file.path(DATA_DIR, "SET5.genMat.xlsx")

# ---- Load data ----
count_data <- read.csv(COUNT_FILE, check.names = FALSE)
fpkm_data  <- read_excel(FPKM_FILE)

# ---- Prepare count matrix ----
rownames(count_data) <- count_data[, 1]
count_data <- count_data[, -1]

# Reorder columns to match experimental design
count_data <- count_data[, c(5:8, 1:4)]

count_matrix <- as.matrix(count_data)
