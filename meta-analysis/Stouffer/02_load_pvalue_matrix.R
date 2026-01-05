# ======================================================
# Load gene × dataset p-value matrix
# ======================================================

source("01_project_setup.R")

# Expected format:
# SYMBOL | dataset_1 | dataset_2 | ... | dataset_n

pval_matrix <- read.csv(
  file.path(DATA_DIR, "combination_data_pvalue.csv")
)

rownames(pval_matrix) <- pval_matrix$SYMBOL
pval_matrix <- pval_matrix[, -1]

# Ensure numeric
pval_matrix <- pval_matrix %>%
  mutate(across(everything(), as.numeric))

# Remove genes with all missing values
pval_matrix <- pval_matrix[rowSums(is.na(pval_matrix)) < ncol(pval_matrix), ]
