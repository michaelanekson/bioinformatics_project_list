# ======================================================
# 04_deseq2_analysis.R
# Differential expression analysis using DESeq2
# ======================================================

source("scripts/01_project_setup.R")
source("scripts/02_load_and_preprocess.R")
source("scripts/03_metadata_and_qc.R")

# ---- Construct DESeq2 object ----
dds <- DESeqDataSetFromMatrix(
  countData = round(count_matrix),
  colData   = meta_data,
  design    = ~ condition
)

# ---- Run DESeq2 ----
dds <- DESeq(dds)

res <- results(
  dds,
  contrast = c("condition", "AD_Exercise", "AD")
)

res <- res[order(res$padj), ]

# ---- Save results ----
write.csv(
  as.data.frame(res),
  file.path(RESULTS_DIR, "deseq2_AD_vs_AD_Exercise.csv")
)
