# 1. Pre-R analysis
# please look in data-raw/raw-processing.txt

# 2. Analysis in R
# generate gene annotations
source("data-raw/gene-ann.R")
# generate expression count matrix for further analysis
source("data-raw/count-matrix.R")
# check that count.matrix is OK
source("data-raw/checks.R")
# generate expression count data frame for plotting gene time courses with ggplot2
source("data-raw/plot-table.R")
# perform differential expression analysis
source("data-raw/diff-expr.R")
# generate data sets
source("data-raw/initial-sets.R")
# perform clustering and write results in inst/extdata/clusts
source("data-raw/clust.R")
# perform GO analysis and write results in inst/extdata/GO
source("data-raw/go.R")
# plot GO charts for the figures
source("data-raw/go-plot.R")
# perform ismara processing and analysis
source("data-raw/ismara.R")
# perform comparisons with other data
source("data-raw/other-data.R")
# proteomics analysis
source("data-raw/proteomics.R")
