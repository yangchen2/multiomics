# Knight Lab Multi-omics Resources

This repository has been created to provide resources on performing microbiome multi-omics analyses for the Knight Lab.

## 1) Functional QIIME2 environments for [mmvec](https://github.com/biocore/mmvec) and [joint-rpca](https://github.com/biocore/gemelli) and how to install them on Barnacle2.

To install these environments:

    ```
    git clone https://github.com/yangchen2/multiomics.git
    cd multiomics

    mamba env create -f mmvec_qiime2-2020.6_barnacle2.yml
    mmvec --help

    mamba env create -f joint-rpca_qiime2-2022.11_barnacle2.yml
    qiime gemelli joint-rpca --help

    ```


2) Coming soon: Additional tutorials, example scripts/notebooks, and resources for mmvec and joint-rpca analyses.


This repository has been adapted from [https://github.com/ahdilmore/multiomics](https://github.com/ahdilmore/multiomics).
You may also view Hazel Dilmore's previous code review [presentation](https://docs.google.com/presentation/d/1QW-IlSYI5mQXslE2Emx-IBHd0DkmjBRng3EuvR31Rkc/edit?usp=sharing).

Any KL members who have resources willing to contribute, please email yac027@ucsd.edu.