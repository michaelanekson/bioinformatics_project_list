# Gene-Level Mendelian Randomization Pipeline (GWAS × molQTL)

## Overview

This script implements a **gene-centric Mendelian Randomization (MR) analysis pipeline** that integrates **GWAS summary statistics** with **molecular QTL (molQTL) data** (eQTL / sQTL).  
It performs SNP harmonization, LD clumping, multiple MR methods, and sensitivity analyses to evaluate putative causal effects of gene expression (or splicing) on complex traits.

⚠️ **Important attribution notice**  
This code was **originally written by other authors** and is included here **for research reproducibility and educational purposes only**.

> **Original authors**:  
> **Skanda Rajasundaram**, **Puja Mehta**  
> Segre Lab, Massachusetts Eye and Ear  
> Harvard Medical School, Boston, MA, USA  
> **Date**: November 16, 2023  

No claim of original authorship is made for this script.

---

## What This Script Does

At a high level, the pipeline:

1. Loads GWAS summary statistics (build GRCh38)
2. Extracts gene-specific molQTLs (eQTL / sQTL)
3. Matches SNPs between GWAS and QTL by chromosome–position
4. Filters QTLs by significance threshold
5. Performs LD clumping (EUR reference)
6. Harmonizes exposure (QTL) and outcome (GWAS)
7. Runs multiple MR methods
8. Conducts sensitivity analyses
9. Outputs a structured results table for downstream interpretation
