# ======================================================
# 06_volcano_plot.R
# Volcano plot for DESeq2 results
# ======================================================

source("scripts/01_project_setup.R")

res <- read.csv(
  file.path(RESULTS_DIR, "deseq2_AD_vs_AD_Exercise.csv"),
  row.names = 1
)

res_df <- res %>%
  rownames_to_column("gene") %>%
  mutate(
    significant = padj < 0.05,
    neg_log10_padj = -log10(padj)
  )

p <- ggplot(res_df, aes(log2FoldChange, neg_log10_padj)) +
  geom_point(aes(color = significant), alpha = 0.7) +
  scale_color_manual(values = c("grey70", "firebrick")) +
  theme_light(base_size = 16) +
  labs(
    title = "Volcano plot: AD Exercise vs AD",
    x = "Log2 Fold Change",
    y = "-log10 adjusted p-value"
  )

ggsave(
  filename = file.path(FIG_DIR, "Volcano_plot.png"),
  plot = p,
  width = 7,
  height = 5
)
