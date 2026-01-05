# Transcriptomics Meta-analysis

This module demonstrates cross-platform transcriptomics meta-analysis by
integrating RNA-seq and microarray fold-change results.

## Key Features
- RNA-seq + microarray integration
- Gene-level harmonization
- Missing-data–aware meta-matrix construction
- Cross-study signal consistency filtering
- Heatmap-based visualization using ComplexHeatmap

## Purpose
This code is intended to showcase meta-analysis logic rather than dataset-specific preprocessing.

## Methods
- Data integration: full join by gene symbol
- Signal filtering: |logFC| thresholding
- Coverage-based gene selection
- Visualization: ComplexHeatmap

