# ======================================================
# 02_load_and_preprocess.R
# Load and preprocess microarray data
# ======================================================

source("01_project_setup.R")

DATA_FILE <- file.path(DATA_DIR, "data_microarray.xlsx")

raw_data <- read_excel(DATA_FILE) %>% as.data.frame()

rownames(raw_data) <- raw_data$`Probe Set ID`

expression_matrix <- raw_data[, 2:10]

# Remove non-numeric values
expression_matrix[expression_matrix == "---"] <- NA
expression_matrix <- as.matrix(expression_matrix)
