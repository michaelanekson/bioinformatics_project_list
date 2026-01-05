# ======================================================
# Post-processing and gene filtering
# ======================================================

source("01_project_setup.R")

meta_results <- read.csv(
  file.path(RESULTS_DIR, "meta_analysis_stouffer_results.csv")
)

# Count number of datasets contributing per gene
dataset_coverage <- rowSums(!is.na(read.csv(
  file.path(DATA_DIR, "combination_data_pvalue.csv")
)[, -1]))

meta_results$dataset_count <- dataset_coverage[
  match(meta_results$SYMBOL,
        read.csv(file.path(DATA_DIR, "combination_data_pvalue.csv"))$SYMBOL)
]

# Significant meta-analysis genes
significant_meta_genes <- meta_results %>%
  filter(
    adjusted_p_value < 0.05,
    dataset_count >= 3
  ) %>%
  arrange(adjusted_p_value)

write.csv(
  significant_meta_genes,
  file.path(RESULTS_DIR, "significant_meta_genes_stouffer.csv"),
  row.names = FALSE
)
