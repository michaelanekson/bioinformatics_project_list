# ============================================================
# 04_run_metal.R
# Generate and execute METAL meta-analysis
# ============================================================

rm(list = ls())

METAL_EXEC <- "/usr/local/bin/metal"
INPUT_DIR  <- "data/metal_inputs/"
OUTPUT_DIR <- "results/metal/"
dir.create(OUTPUT_DIR, recursive = TRUE, showWarnings = FALSE)

metal_script <- "
SCHEME STDERR
GENOMICCONTROL OFF

MARKER   MarkerName
ALLELE   A1 A2
FREQ     A1FREQ
EFFECT   BETA
STDERR   SE
PVAL     P
WEIGHT   N

PROCESS data/metal_inputs/cohort_a_toMETAL.txt
PROCESS data/metal_inputs/cohort_b_toMETAL.txt

OUTFILE results/metal/metal_results .
ANALYZE HETEROGENEITY
QUIT
"

writeLines(metal_script, "run_metal.txt")

system(paste(METAL_EXEC, "run_metal.txt"))
