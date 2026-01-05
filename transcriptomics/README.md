# Bioinformatics RNA-seq Analysis Pipeline

This repository contains bioinformatics analysis workflows developed from my doctoral research and continued through my current work.  
The focus is on transcriptomics data analysis, differential expression, and functional interpretation using R. I used this pipeline for my published research 
(https://pubmed.ncbi.nlm.nih.gov/36970901/)

---

## 📌 Project Overview

The pipeline demonstrates a complete RNA-seq analysis workflow:

1. Raw count data preprocessing
2. Differential expression analysis (DESeq2)
3. Exploratory data analysis (PCA)
4. Visualization (volcano plots)
5. Functional enrichment analysis (GSEA)

The code is modular, reproducible, and designed to be easily extended.

---

## 📂 Repository Structure

```text
project_root/
├── data/            # Input data (toy or real)
├── results/         # Differential expression & enrichment results
├── figures/         # PCA, volcano, and GSEA plots
├── scripts/         # Analysis scripts
└── README.md
