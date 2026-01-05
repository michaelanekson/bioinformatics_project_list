# Bioinformatics Research Projects

## Overview

This repository contains bioinformatics research projects developed from doctoral-level training through current research work.  
The focus is on **transcriptomics**, **genomics**, and **meta-analysis**, with an emphasis on reproducible pipelines, clear analytical logic, and research-grade code organization.

The goals of this repository are to:
- Demonstrate end-to-end bioinformatics workflows
- Showcase cross-platform and cross-study data integration
- Provide reusable analysis templates for future research

---

## Repository Structure

```text
.
├── transcriptomics/
│   ├── RNA-seq/
│   │   ├── 01_project_setup.R
│   │   ├── 02_load_and_preprocess.R
│   │   ├── 03_metadata_and_qc.R
│   │   ├── 04_deseq2_analysis.R
│   │   ├── 05_pca_visualization.R
│   │   ├── 06_volcano_plot.R
│   │   ├── 07_gsea_analysis.R
│   │   └── README.md
│   └── microarray/
│       └── README.md
│
├── meta-analysis/
│   ├── Stouffer/
│   │   ├── 01_project_setup.R
│   │   ├── 02_load_pvalue_matrix.R
│   │   ├── 03_stouffer_meta_analysis.R
│   │   ├── 04_postprocessing_and_filtering.R
│   │   └── README.md
│   │
│   └── METAL/
│       ├── 01_input_and_liftover.R
│       ├── 02_harmonize_alleles.R
│       ├── 03_prepare_metal_inputs.R
│       ├── 04_run_metal.R
│       ├── 05_postprocess_fuma_prs.R
│       └── README.md
│
└── README.md

```
