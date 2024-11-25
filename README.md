# Knight Lab Multi-omics Resources

This repository provides resources for performing microbiome multi-omics analyses in the Knight Lab. 

The resources provided here focus on [mmvec](https://github.com/biocore/mmvec) and [joint-rpca](https://github.com/biocore/gemelli).

---

## What is Multi-omics Analysis?

Multi-omics integration involves combining data from different biological layers (i.e., 16S, metagenomics, metatranscriptomics, metabolomics, etc).

---

## Differences Between mmvec and joint-rpca

| **Feature**            | **mmvec**                                                                 | **joint-rpca**                                                        |
|-------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------|
| **Objective**          | Estimating microbe-metabolite interactions through their co-occurence probabilities using neural networks.                    | Identifying features across the multiple 0omics types which separate jointly across the samples using a dimensionality reduction method. |
| **Input Format**       | Microbial feature table, metabolite feature table, and metadata.                      | Paired feature tables in compositional format.                              |
| **Number of Omics Layers**     | Limited to two -omics layers. | Can have any number of -omics layers.                           |
| **Ouputs**          | Covariance matrix between -omics layer 1 and -omics layer 2, conditional biplot which can be input into [Emperor](https://github.com/biocore/emperor), evaluations of probability model performance.      | Distance matrix represents the pairwise distances between samples in the reduced compositional feature space derived from the joint factorization of multiple -omics datasets, biplot visualization, evaluations of dimensionality reduction model performance
| **Ordination/QIIME2 Biplot**          | Points are -omic layer 1 (i.e., microbes) and arrows are -omic layer 2 (i.e., metabolites).            | Points are all samples and arrows can be features from any -omic layer (i.e., 16S, metagenomic, metabolomic, etc.).   |

---

## Functional QIIME2 Environments for mmvec and joint-rpca (Barnacle2)

To use **mmvec** and **joint-rpca**, functional QIIME2 environments have been created and optimized for Barnacle2. To install these environments:

```
# Clone the repository
git clone https://github.com/yangchen2/multiomics.git
cd multiomics

# Install mmvec environment
mamba env create -f mmvec_qiime2-2020.6_barnacle2.yml
mmvec paired-omics --help

# Install joint-rpca environment
mamba env create -f joint-rpca_qiime2-2022.11_barnacle2.yml
qiime gemelli joint-rpca --help
```

---

## Coming soon

1. Additional tutorials and walkthroughs for setting up mmvec and joint-rpca analyses.
2. Example scripts and Jupyter notebooks for analyzing multi-omics datasets.
3. Strategies for interpreting outputs and integrating them into broader studies.
4. Visualization scripts for mmvec and joint-rpca outputs.

---

## Additional Resources

- This repository has been adapted from [https://github.com/ahdilmore/multiomics](https://github.com/ahdilmore/multiomics). 
- For Hazel Dilmore's previous code review presentation, refer to [this link](https://docs.google.com/presentation/d/1QW-IlSYI5mQXslE2Emx-IBHd0DkmjBRng3EuvR31Rkc/edit?usp=sharing).

---

## Contribute

If you are a Knight Lab member and have additional resources to contribute, please email [yac027@ucsd.edu](mailto:yac027@ucsd.edu). 