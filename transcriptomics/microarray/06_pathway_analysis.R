# ======================================================
# 06_pathway_analysis.R
# KEGG pathway visualization using pathview
# ======================================================

source("01_project_setup.R")

deg <- read.csv(file.path(RESULTS_DIR, "DEG_HTN_vs_Control.csv"))

deg$ENTREZ <- mapIds(
  org.Rn.eg.db,
  keys = deg$`Gene Symbol`,
  keytype = "SYMBOL",
  column = "ENTREZID"
)

gene_fc <- deg$logFC
names(gene_fc) <- deg$ENTREZ
gene_fc <- gene_fc[!is.na(names(gene_fc))]

# Example pathway
pathview(
  gene.data = gene_fc,
  pathway.id = "rno04070",
  species = "rno",
  out.suffix = "HTN_microarray"
)
