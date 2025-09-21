#!/bin/bash -l
#SBATCH --job-name=joint-rpca_env
#SBATCH --time=1:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --mail-user=yac027@ucsd.edu #change to your email
#SBATCH --mail-type=END,FAIL

echo "Starting job: create joint-rpca_qiime2-2022.11_env"

echo "Downloading QIIME2 2022.11 environment YAML"
wget https://data.qiime2.org/distro/core/qiime2-2022.11-py38-linux-conda.yml -O qiime2-2022.11-py38-linux-conda.yml

echo "Creating environment from qiime2-2022.11-py38-linux-conda.yml"
mamba env create -n joint-rpca_qiime2-2022.11_env --file qiime2-2022.11-py38-linux-conda.yml

echo "Activating environment"
source activate joint-rpca_qiime2-2022.11_env

echo "Checking gemelli joint-rpca plugin"
qiime gemelli joint-rpca --help

echo "Job complete"


