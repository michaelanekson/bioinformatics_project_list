# ======================================================
# 05_enrichment_analysis.R
# GSEA using MSigDB
# ======================================================

source("01_project_setup.R")

deg <- read.csv(file.path(RESULTS_DIR, "DEG_HTN_vs_Control.csv"))

deg <- deg %>%
  filter(!is.na(t)) %>%
  arrange(desc(t))

gene_list <- deg$t
names(gene_list) <- deg$`Gene Symbol`

gene_list <- gene_list[is.finite(gene_list)]

msig_bp <- msigdbr(
  species = "Rattus norvegicus",
  category = "C5",
  subcategory = "BP"
) %>% select(gs_name, gene_symbol)

gsea_res <- GSEA(
  geneList = gene_list,
  TERM2GENE = msig_bp,
  pvalueCutoff = 0.05
)

write.csv(
  as.data.frame(gsea_res),
  file.path(RESULTS_DIR, "GSEA_C5_BP.csv")
)
