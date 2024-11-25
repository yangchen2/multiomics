#!/bin/bash -l
#SBATCH --mail-user="adilmore@ucsd.edu"
#SBATCH --chdir=/home/adilmore/THDMI/jointrpca/
#SBATCH --output=/home/adilmore/THDMI/jointrpca/mmvec.out
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 48:00:00
#SBATCH --mem=64G

source ~/anaconda3/bin/activate qiime2-2020.6

# modeled 

qiime mmvec paired-omics \
    --i-microbes food_table.qza \
    --i-metabolites wol2_table.qza \
    --m-metadata-file mmvec_metadata.tsv \
    --p-training-column train_test \
    --p-epochs 1000 \
    --p-batch-size 100 \
    --p-input-prior 0.25 \
    --p-summary-interval 50 \
    --o-conditionals conditionals_inv.qza \
    --o-conditional-biplot conditional_biplot_inv.qza \
    --o-model-stats model_stats_inv.qza
    
# Null model with only biases
qiime mmvec paired-omics \
    --i-microbes food_table.qza \
    --i-metabolites wol2_table.qza \
    --p-latent-dim 0 \
    --p-epochs 1000 \
    --p-batch-size 100 \
    --p-input-prior 0.25 \
    --p-summary-interval 50 \
    --output-dir null_summary_inv

qiime mmvec summarize-paired \
    --i-model-stats model_stats_inv.qza \
    --i-baseline-stats null_summary/model_stats.qza \
    --o-visualization paired-summary_inv.qzv
