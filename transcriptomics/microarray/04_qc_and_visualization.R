# ======================================================
# 04_qc_and_visualization.R
# QC and exploratory visualization
# ======================================================

source("01_project_setup.R")
source("02_load_and_preprocess.R")

# ---- Boxplot ----
p <- boxplot(
  expression_matrix,
  las = 2,
  col = "lightblue",
  main = "Expression distribution across samples"
)

png(file.path(FIG_DIR, "boxplot_expression.png"), 800, 600)
boxplot(expression_matrix, las = 2, col = "lightblue")
dev.off()

# ---- PCA ----
pca <- prcomp(t(expression_matrix), scale. = TRUE)

pca_df <- as.data.frame(pca$x)

pca_df$sample <- rownames(pca_df)
pca_df$group <- c(rep("Control", 3), rep("HTN_EX", 3), rep("HTN", 3))

ggplot(pca_df, aes(PC1, PC2, color = group, label = sample)) +
  geom_point(size = 4) +
  geom_text_repel() +
  theme_light(base_size = 16)

ggsave(file.path(FIG_DIR, "PCA_microarray.png"), width = 7, height = 5)
