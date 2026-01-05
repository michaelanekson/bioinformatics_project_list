# ======================================================
# 07_gsea_analysis.R
# Gene Set Enrichment Analysis (MSigDB)
# ======================================================

source("scripts/01_project_setup.R")

library(clusterProfiler)
library(msigdbr)
library(enrichplot)

res <- read.csv(
  file.path(RESULTS_DIR, "deseq2_AD_vs_AD_Exercise.csv"),
  row.names = 1
)

# ---- Prepare ranked gene list ----
gene_list <- res %>%
  drop_na(stat) %>%
  arrange(desc(stat)) %>%
  pull(stat, rownames(.))

# ---- MSigDB C5 Biological Process ----
msig_bp <- msigdbr(
  species = "Mus musculus",
  category = "C5",
  subcategory = "BP"
) %>% select(gs_name, gene_symbol)

gsea_res <- GSEA(
  geneList = gene_list,
  TERM2GENE = msig_bp,
  pvalueCutoff = 0.05
)

# ---- Save results ----
write.csv(
  as.data.frame(gsea_res),
  file.path(RESULTS_DIR, "GSEA_C5_BP_results.csv")
)

# ---- Example enrichment plot ----
p <- gseaplot2(
  gsea_res,
  geneSetID = 1,
  title = gsea_res@result$Description[1]
)

ggsave(
  filename = file.path(FIG_DIR, "GSEA_example.png"),
  plot = p,
  width = 7,
  height = 5
)
