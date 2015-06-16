### "Perturbations of PIP3 signalling trigger a global remodelling of mRNA landscape and reveal a transcriptional feedback loop"
####Supplementary R package

Allows one to fully reproduce results presented in the paper. Contains all data used in the paper with their description.

To install this package in your R and get all the data used in the paper:

```{R}
install.packages("devtools")
devtools::install_github("wikiselev/rnaseq.mcf10a")
```

Raw data (starting with htseq count files) with processing scripts is in `data-raw` folder.

To reproduce the results:

```{R}
source("data-raw/main.R")
```

### Requirements for data reproduction

1. The data was well reproduced on the following system:

```{r}
R version 3.1.3 (2015-03-09)
Platform: x86_64-apple-darwin10.8.0 (64-bit)
Running under: OS X 10.10.3 (Yosemite)
```

2. Also the following versions (different from the latest release) of some of the packages are required to fully reproduce the results (binary files can be downloaded at the bottom of the page):

[DESeq2 (== 1.4.5)](http://www.bioconductor.org/packages/2.14/bioc/html/DESeq2.html)

[topGO (== 2.16.0)](http://www.bioconductor.org/packages/2.14/bioc/html/topGO.html)

[GO.db (== 2.14.0)](http://www.bioconductor.org/packages/2.14/data/annotation/html/GO.db.html)

[org.Hs.eg.db (== 2.14.0)](http://bioconductor.org/packages/2.14/data/annotation/html/org.Hs.eg.db.html)

### External sources

1. [Submitted manuscript](https://drive.google.com/folderview?id=0B9AEJU3ZybXIYkJ1T3JubFlOSWc&usp=sharing) (accessible only by collaborators).

2. [Interactive gene expression profiles](http://www.bioinformatics.babraham.ac.uk/shiny/kiselev-pip3-rna-seq-gene-profiles/)
(source files of this [Shiny app](http://shiny.rstudio.com/) can be viewed in `data-raw/kiselev-pip3-rna-seq-gene-profiles` folder).

3. [ISMARA](http://ismara.unibas.ch/fcgi/mara) report can be viewed [here](http://lenoverelab.org/data/2015/kiselev/ismara_report_hg19/).
