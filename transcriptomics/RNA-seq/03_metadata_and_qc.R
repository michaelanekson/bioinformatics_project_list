# ======================================================
# 03_metadata_and_qc.R
# Sample metadata and quality control
# ======================================================

source("scripts/01_project_setup.R")
source("scripts/02_load_and_preprocess.R")

# ---- Sample metadata ----
meta_data <- tibble(
  sample_id = c("AD1", "AD2", "AD3", "AD4",
                "AD1_EX", "AD2_EX", "AD3_EX", "AD4_EX"),
  condition = c(rep("AD", 4), rep("AD_Exercise", 4))
)

# ---- QC checks ----
stopifnot(
  ncol(count_matrix) == nrow(meta_data),
  all(colnames(count_matrix) == meta_data$sample_id)
)
