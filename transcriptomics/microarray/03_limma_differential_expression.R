# ======================================================
# 03_limma_differential_expression.R
# Differential expression using limma
# ======================================================

source("01_project_setup.R")
source("02_load_and_preprocess.R")

meta_data <- tibble(
  sample = colnames(expression_matrix),
  condition = c(rep("Control", 3), rep("HTN_EX", 3), rep("HTN", 3))
)

design <- model.matrix(~0 + condition, meta_data)
colnames(design) <- levels(factor(meta_data$condition))

fit <- lmFit(expression_matrix, design)

contrast_matrix <- makeContrasts(
  HTN_vs_Control = HTN - Control,
  HTN_EX_vs_HTN  = HTN_EX - HTN,
  levels = design
)

fit2 <- contrasts.fit(fit, contrast_matrix)
fit2 <- eBayes(fit2)

res_htn_con <- topTable(fit2, coef = "HTN_vs_Control", number = Inf)
res_htn_ex  <- topTable(fit2, coef = "HTN_EX_vs_HTN", number = Inf)

write.csv(res_htn_con, file.path(RESULTS_DIR, "DEG_HTN_vs_Control.csv"))
write.csv(res_htn_ex,  file.path(RESULTS_DIR, "DEG_HTN_EX_vs_HTN.csv"))
