# ======================================================
# 05_pca_visualization.R
# PCA visualization of normalized expression data
# ======================================================

source("scripts/01_project_setup.R")
source("scripts/02_load_and_preprocess.R")
source("scripts/03_metadata_and_qc.R")

# ---- Variance stabilizing transformation ----
vsd <- vst(dds, blind = TRUE)

pca_res <- prcomp(t(assay(vsd)))

pca_df <- bind_cols(
  meta_data,
  as.data.frame(pca_res$x)
)

# ---- PCA plot ----
p <- ggplot(pca_df, aes(PC1, PC2, color = condition, label = sample_id)) +
  geom_point(size = 4) +
  geom_text_repel() +
  theme_light(base_size = 16) +
  labs(title = "PCA of RNA-seq samples")

ggsave(
  filename = file.path(FIG_DIR, "PCA_plot.png"),
  plot = p,
  width = 7,
  height = 5
)
