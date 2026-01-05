# ======================================================
# Stouffer's Z-score meta-analysis
# ======================================================

source("01_project_setup.R")
source("02_load_pvalue_matrix.R")

# Transpose: datasets × genes (required by metap)
pval_t <- t(pval_matrix)
pval_t <- as.data.frame(pval_t)

# Stouffer (Z-score) meta-analysis per gene
meta_results <- sapply(
  X   = pval_t,
  FUN = function(pvals) {
    combine.test(pvals, method = "z.transform", na.rm = TRUE)
  }
)

# Convert to tidy table
meta_results <- t(meta_results) %>%
  as.data.frame() %>%
  tibble::rownames_to_column("SYMBOL") %>%
  rename(
    meta_p_value = p
  )

# Multiple testing correction
meta_results$adjusted_p_value <- p.adjust(
  meta_results$meta_p_value,
  method = "BH"
)

write.csv(
  meta_results,
  file.path(RESULTS_DIR, "meta_analysis_stouffer_results.csv"),
  row.names = FALSE
)
