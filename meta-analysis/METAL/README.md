# GWAS Meta-analysis using METAL

This module implements a **multi-cohort GWAS meta-analysis pipeline** using
the **METAL** software with inverse-variance weighted fixed-effects models.

The workflow integrates GWAS summary statistics from multiple
**independent population-based studies**, demonstrating a
scalable and reproducible meta-analysis framework.

---

## Overview

Genome-wide association summary statistics often differ in:

- Genome build (GRCh37 vs GRCh38)
- Allele coding conventions
- Effect direction definitions
- Sample size and population ancestry

This pipeline standardizes and harmonizes these inputs before performing
formal meta-analysis using METAL.

---

## Data Sources (Anonymized)

To ensure reproducibility while protecting sensitive cohort information,
all datasets are referenced using **generic source identifiers**:

- **Cohort_A** – large-scale population-based GWAS (EUR ancestry)
- **Cohort_B** – biobank-scale GWAS (EAS ancestry)
- **Cohort_C** – published meta-analysis summary statistics
- **Cohort_D** – independent replication GWAS

Each dataset is independently formatted and harmonized prior to meta-analysis.

> ⚠️ This repository operates exclusively on **summary statistics**.
> No individual-level genotype or phenotype data is included.

---

## Pipeline Structure

```text
metal/
├── 01_input_and_liftover.R
├── 02_harmonize_alleles.R
├── 03_prepare_metal_inputs.R
├── 04_run_metal.R
├── 05_postprocess_fuma_prs.R
└── plots/
