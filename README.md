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

---

## Transcriptomics
## RNA-seq

This module implements a standard RNA-seq differential expression workflow, including:

Data loading and preprocessing

Quality control and metadata handling

Differential expression analysis using DESeq2

Principal component analysis (PCA)

Volcano plot visualization

Gene set enrichment analysis (GSEA)

The pipeline is designed to be adaptable across different RNA-seq datasets with minimal modification.

Microarray

The microarray module focuses on:

Normalization and fold-change extraction

Harmonization across multiple studies

Preparation of results for downstream meta-analysis

Meta-analysis
Stouffer’s Method

This module demonstrates cross-platform transcriptomic meta-analysis using Stouffer’s Z-score method, including:

Integration of RNA-seq and microarray p-values

Gene-level harmonization by symbol

Missing-data–aware meta-matrix construction

Coverage-based gene filtering

Heatmap-based visualization using ComplexHeatmap

The emphasis is on methodological clarity rather than dataset-specific preprocessing.

METAL (GWAS Meta-analysis)

This module provides a full GWAS meta-analysis pipeline using METAL, including:

Genome build harmonization and liftover

Allele alignment and effect-size correction

Fixed-effect inverse-variance meta-analysis

Heterogeneity assessment

Post-processing for FUMA and PRS applications

All cohort identifiers and data sources are anonymized or generalized.

Design Philosophy

Modular scripts: each analytical step is isolated and reusable

Reproducibility-first: explicit inputs and deterministic outputs

Research-oriented: reflects real analytical decisions

Scalable structure: easy to extend with new datasets or methods

Notes

Raw data files are not included due to size and privacy constraints

Scripts are written primarily in R

This repository will continue to expand with additional bioinformatics and statistical genomics workflows

Author

Michael Anekson Widjaya
Ph.D. in Biomedical Science
Focus areas: Bioinformatics, Transcriptomics, GWAS, Meta-analysis
