# Transcriptomics Meta-analysis

This module demonstrates **cross-platform transcriptomics meta-analysis** by integrating results from **RNA-seq and microarray studies**.  
Gene-level statistical evidence is combined using **Stouffer’s Z-score method**, enabling the identification of transcriptomic signals that are consistently significant across multiple datasets.

---

## Overview

Transcriptomic studies often vary in platform, cohort, and experimental design.  
This module focuses on **statistical integration**, rather than raw data preprocessing, to identify genes showing **robust cross-study significance**.

The workflow harmonizes gene-level results, accounts for missing data across datasets, and performs formal meta-analysis based on *p*-value integration.

---

## Key Features

- Integration of **RNA-seq and microarray transcriptomics**
- Gene-level harmonization using shared gene symbols
- Missing-data–aware construction of a meta-analysis matrix
- Statistical meta-analysis using **Stouffer’s Z-score method**
- Multiple-testing correction using **Benjamini–Hochberg FDR**
- Coverage-based filtering to ensure cross-study robustness
- Heatmap-based visualization using **ComplexHeatmap**

---

## Purpose

This code is designed to demonstrate **transcriptomics meta-analysis methodology**, with emphasis on:

- Cross-platform integration  
- Statistical evidence aggregation  
- Signal consistency across studies  

Dataset-specific preprocessing, normalization, and differential expression analyses are intentionally excluded and handled in separate modules.

---

## Methods

- **Data integration**  
  RNA-seq and microarray results are merged using a full join on gene symbols.

- **Meta-analysis**  
  Gene-level *p*-values across studies are combined using **Stouffer’s Z-score method**  
  (`metap::combine.test`, `method = "z.transform"`).

- **Missing data handling**  
  Meta-analysis allows missing *p*-values (`na.rm = TRUE`).

- **Multiple testing correction**  
  Benjamini–Hochberg false discovery rate (FDR).

- **Gene filtering**
  - Adjusted *p* < 0.05  
  - Minimum dataset coverage threshold (configurable)

- **Visualization**  
  Cross-study logFC and *p*-value patterns are visualized using **ComplexHeatmap**.

---

## Folder Structure

```text
Meta-analysis/
├── README.md
├── 01_project_setup.R
├── 02_load_pvalue_matrix.R
├── 03_stouffer_meta_analysis.R
└── 04_postprocessing_and_filtering.R
