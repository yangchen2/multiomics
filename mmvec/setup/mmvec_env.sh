#!/bin/bash -l
#SBATCH --job-name=mmvec_env
#SBATCH --time=1:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --mail-user=yac027@ucsd.edu #change to your email
#SBATCH --mail-type=END,FAIL

echo "Starting job: create mmvec_qiime2020.6_env"

echo "Creating environment from qiime2-2020.6-py36-linux-conda.yml"
mamba env create -n mmvec_qiime2020.6_env -f qiime2-2020.6-py36-linux-conda.yml

echo "Activating environment"
source activate mmvec_qiime2020.6_env

echo "Installing mmvec from conda-forge"
mamba install mmvec -c conda-forge

echo "Checking mmvec installation"
qiime mmvec --help

echo "Job complete"



