#!/bin/bash -l
#SBATCH --job-name=mmvec_run
#SBATCH --output=mmvec_run_%j.out
#SBATCH --error=mmvec_run_%j.err
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --mail-user=yac027@ucsd.edu
#SBATCH --mail-type=END,FAIL

echo "Activating environment..."
source activate mmvec_qiime2020.6_env

echo "Step 1: Import BIOM tables..."
qiime tools import \
  --input-path otus_nt.biom \
  --output-path otus_nt.qza \
  --type FeatureTable[Frequency]

qiime tools import \
  --input-path lcms_nt.biom \
  --output-path lcms_nt.qza \
  --type FeatureTable[Frequency]

echo "Step 2: Running MMvec paired-omics..."
qiime mmvec paired-omics \
  --i-microbes otus_nt.qza \
  --i-metabolites lcms_nt.qza \
  --p-summary-interval 1 \
  --output-dir output

echo "Step 3: Generating Emperor biplot..."
qiime emperor biplot \
  --i-biplot biplot.qza \
  --m-sample-metadata-file metabolite-metadata.txt \
  --m-feature-metadata-file microbe-metadata.txt \
  --p-number-of-features 50 \
  --o-visualization emperor.qzv \
  --p-ignore-missing-samples

echo "Step 4: Generating MMvec heatmap..."
qiime mmvec heatmap \
  --i-ranks ranks.qza \
  --o-visualization heatmap.qzv

echo "MMvec workflow finished!"



