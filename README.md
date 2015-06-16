### "Perturbations of PIP3 signalling trigger a global remodelling of mRNA landscape and reveal a transcriptional feedback loop"
##### Supplementary R package

Allows one to use and fully reproduce data presented in the paper.

### Installation

To install this package in your R and get all the data used in the paper:

```{R}
install.packages("devtools")
devtools::install_github("wikiselev/rnaseq.mcf10a")
```

Please allow some time for installation since the package size is over 200 MB (because of the data included).

Once the package is installed add it to your R environment:
```{R}
library(rnaseq.mcf10a)
```

### Included data objects

To list all data objects used in the paper execute:
```{R}
lazyLoad(paste0(system.file(package = "rnaseq.mcf10a"), "/data/Rdata"))
objects()
```

There are 119 objects in the package. Summary of the objects:

* __gene.annotations__ - information on gene Ensembl IDs, corresponding HGNC symbols and total exon length
* __count.matrix__* - objects containing data matrices of read counts per gene per sample (genes in rows, samples in columns) obtained from htseq output files:
* __diff.expr__* - objects containing DESeq2 results for differential expression
* __plot.data__* - objects containing data frames used for plotting gene profiles
* __set__[1-6] - WT gene sets from Fig. 3
* __set__[A-H] - mutant gene sets from Figs. 6 and 7
* __set__*.__clusts__ - data frames with all cluster partitions used on Figs. 3, 6 and 7
* __set__*.__GO__ - data frames with GO terms and their p-values that were used to plot GO bar charts on Figs. 3, 6 and 7
* __ismara.targets__ - information on TFBMs targets obtained from ISMARA output
* __prdm1.targets__ - targets of PRDM1 TFBM used in Table 2

One can view, export or manipulate with any object for further investigation.

### Reproduce the paper results

##### Scripts

Create a local folder `reproduce`. In this folder create a subfolder `reproduce/data-raw` and download all processing scripts into it from [here](https://github.com/wikiselev/rnaseq.mcf10a/tree/master/data-raw).

##### Data

In `reproduce` folder create a new subfolder `reproduce/inst`. Then copy the folder `paste0(system.file(package = "rnaseq.mcf10a"), "/extdata")` to `reproduce/inst/`. Now `reproduce/inst/` contains all raw data sets required for reproduction (there are also some more supplementary data sets).

##### Run

Once the scripts and the data are organised, from the root of `reproduce` folder run:

```{R}
source("data-raw/main.R")
```

It will take a lot of time to finish. To run step by step follow lines in `data-raw/main.R`

### Requirements for data reproduction

1. The data has been successfully reproduced on the following system:
```{r}
R version 3.1.3 (2015-03-09)
Platform: x86_64-apple-darwin10.8.0 (64-bit)
Running under: OS X 10.10.3 (Yosemite)
```
2. Also the following versions (different from the latest release) of some of the packages are required to fully reproduce the results (binary files can be downloaded at the bottom of each page):
    * [DESeq2 (== 1.4.5)](http://www.bioconductor.org/packages/2.14/bioc/html/DESeq2.html)
    * [topGO (== 2.16.0)](http://www.bioconductor.org/packages/2.14/bioc/html/topGO.html)
    * [GO.db (== 2.14.0)](http://www.bioconductor.org/packages/2.14/data/annotation/html/GO.db.html)
    * [org.Hs.eg.db (== 2.14.0)](http://bioconductor.org/packages/2.14/data/annotation/html/org.Hs.eg.db.html)

### External sources

1. [Submitted manuscript](https://drive.google.com/folderview?id=0B9AEJU3ZybXIYkJ1T3JubFlOSWc&usp=sharing) (accessible only by collaborators).
2. [Interactive gene expression profiles](http://www.bioinformatics.babraham.ac.uk/shiny/kiselev-pip3-rna-seq-gene-profiles/)
(source files of this [Shiny app](http://shiny.rstudio.com/) can be viewed in `data-raw/kiselev-pip3-rna-seq-gene-profiles` folder).
3. [ISMARA](http://ismara.unibas.ch/fcgi/mara) report can be viewed [here](http://lenoverelab.org/data/2015/kiselev/ismara_report_hg19/).
