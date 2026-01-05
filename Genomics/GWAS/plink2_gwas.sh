#!/bin/bash
# ============================================================
# PLINK2 GWAS PIPELINE
# Author: <your name>
# Purpose: End-to-end GWAS analysis using PLINK 2
# ============================================================

# ----------------------------
# 0. Environment setup
# ----------------------------
PLINK2=plink2
THREADS=8
MEMORY=16000

# Input prefix (BED/BIM/FAM or PGEN)
INPUT_PREFIX=data/genotype_input

# Output directory
OUTDIR=results/gwas
mkdir -p ${OUTDIR}

# ----------------------------
# 1. Basic sample and variant QC
# ----------------------------

${PLINK2} \
  --bfile ${INPUT_PREFIX} \
  --geno 0.02 \
  --mind 0.02 \
  --maf 0.01 \
  --hwe 1e-6 \
  --autosome \
  --make-pgen \
  --out ${OUTDIR}/01_qc_basic \
  --threads ${THREADS} \
  --memory ${MEMORY}

# ----------------------------
# 2. Sex check (optional)
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/01_qc_basic \
  --check-sex \
  --out ${OUTDIR}/02_sexcheck \
  --threads ${THREADS}

# ----------------------------
# 3. LD pruning for PCA
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/01_qc_basic \
  --indep-pairwise 200 50 0.2 \
  --out ${OUTDIR}/03_ld_prune \
  --threads ${THREADS}

# ----------------------------
# 4. Principal component analysis
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/01_qc_basic \
  --extract ${OUTDIR}/03_ld_prune.prune.in \
  --pca approx 20 \
  --out ${OUTDIR}/04_pca \
  --threads ${THREADS}

# ----------------------------
# 5. Relatedness / kinship check
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/01_qc_basic \
  --king-cutoff 0.0884 \
  --out ${OUTDIR}/05_relatedness \
  --threads ${THREADS}

# ----------------------------
# 6. Remove related individuals
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/01_qc_basic \
  --remove ${OUTDIR}/05_relatedness.king.cutoff.out.id \
  --make-pgen \
  --out ${OUTDIR}/06_unrelated \
  --threads ${THREADS}

# ----------------------------
# 7. GWAS (logistic regression)
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/06_unrelated \
  --pheno data/phenotype.txt \
  --pheno-name PHENO \
  --covar data/covariates.txt \
  --covar-name AGE,SEX,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
  --glm hide-covar firth-fallback \
  --out ${OUTDIR}/07_gwas_logistic \
  --threads ${THREADS}

# ----------------------------
# 8. GWAS (linear regression)
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/06_unrelated \
  --pheno data/phenotype.txt \
  --pheno-name PHENO \
  --covar data/covariates.txt \
  --covar-name AGE,SEX,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
  --glm hide-covar \
  --out ${OUTDIR}/08_gwas_linear \
  --threads ${THREADS}

# ----------------------------
# 9. Export summary statistics
# ----------------------------

${PLINK2} \
  --pfile ${OUTDIR}/06_unrelated \
  --export A \
  --out ${OUTDIR}/09_exported_genotypes \
  --threads ${THREADS}

# ----------------------------
# 10. Prepare GWAS output for downstream tools
# (e.g., FUMA / PRS / METAL)
# ----------------------------

awk 'BEGIN{OFS="\t"} NR==1 || $7!="NA"' \
  ${OUTDIR}/07_gwas_logistic.PHENO.glm.logistic \
  > ${OUTDIR}/10_gwas_filtered.txt

# ============================================================
# End of PLINK2 GWAS pipeline
# ============================================================
