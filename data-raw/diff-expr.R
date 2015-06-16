library(DESeq2)

diff_expr_pairwise <- function(cond1, cond2, time1, time2) {
    files <- list.files("inst/extdata/htseq/")
    files <- files[grepl(paste0(cond1, "_", ".*", "_", time1, "_"), files) |
                   grepl(paste0(cond2, "_", ".*", "_", time2, "_"), files)]
    condition <- sapply(strsplit(files, "\\_"), "[[", 1)
    time <- sapply(strsplit(files, "\\_"), "[[", 3)
    condition.levels = c(paste(cond1, time1, sep = "_"),
                         paste(cond2, time2, sep = "_"))
    samples <- data.frame(sample.name = files,
                          file.name = files,
                          condition = paste(condition, time, sep = "_"))

    # change levels
    samples$condition <- factor(samples$condition, levels = condition.levels)

    # create a DESeqDataSet with interaction term in the design formula
    cds <- DESeqDataSetFromHTSeqCount(sampleTable = samples,
                                      directory = "data-raw/htseq/",
                                      design = ~condition)

    # perform the main computation
    cds <- DESeq(cds)
    return(results(cds))
}

diff_expr_time_course <- function(cond) {
    files <- list.files("inst/extdata/htseq/")
    files <- files[grepl(paste0(cond, "_"), files)]
    time <- sapply(strsplit(files, "\\_"), "[[", 3)
    time.levels <- c("0", "15", "40", "90", "180", "300")
    samples <- data.frame(sample.name = files, file.name = files, time = time)
    # change levels
    samples$time <- factor(samples$time, levels = time.levels)

    # create a DESeqDataSet with interaction term in the design formula
    cds <- DESeqDataSetFromHTSeqCount(sampleTable = samples,
                                      directory = "data-raw/htseq/",
                                      design = ~time)

    # perform the main computation
    cds <- DESeq(cds)

    # using a new feature in DESeq2 package use maximum likelihood test to find
    # diff. expressed genes in WT time course
    cdsLRT <- nbinomLRT(cds, reduced = ~1)
    return(results(cdsLRT))
}

diff_expr_two_time_courses <- function(cond1, cond2) {
    files <- list.files("inst/extdata/htseq/")
    files <- files[grepl(paste(c(paste0(cond1, "_"), paste0(cond2, "_")),
                               collapse = "|"), files)]
    time <- sapply(strsplit(files, "\\_"), "[[", 3)
    condition <- sapply(strsplit(files, "\\_"), "[[", 1)
    samples <- data.frame(sample.name = files,
                          file.name = files,
                          condition = condition,
                          time = time)

    # change levels
    samples$condition <- factor(samples$condition, levels = c(cond1, cond2))
    samples$time <- factor(samples$time,
                           levels = c("0", "15", "40", "90", "180", "300"))

    # create a DESeqDataSet with interaction term in the design formula
    cds <- DESeqDataSetFromHTSeqCount(sampleTable = samples,
                                      directory = "data-raw/htseq/",
                                      design = ~condition + time + condition:time)

    # perform the main computation
    cds <- DESeq(cds)
    resultsNames(cds)

    # likelihood ratio test
    cdsLRT <- nbinomLRT(cds, reduced = ~time)
    return(results(cdsLRT))
}

# find EGF responding genes in WT
diff.expr.wt <- diff_expr_time_course("wt")

# calculate differentially expressed genes between all conditions and
# WT at 0 time point
diff.expr.a66.0.wt.0 <- diff_expr_pairwise("wt", "ko", 0, 0)
diff.expr.ki.0.wt.0 <- diff_expr_pairwise("wt", "ki", 0, 0)
diff.expr.pten.0.wt.0 <- diff_expr_pairwise("wt", "pten", 0, 0)

# calculate differentially expressed genes using A66 control (no EGF stimulation)
# at 300 min
diff.expr.a66.300.a66.0 <- diff_expr_pairwise("ko", "konost", 0, 300)

# check condition+interaction between all conditions and wt
diff.expr.pten.wt <- diff_expr_two_time_courses("wt", "pten")
diff.expr.ki.wt <- diff_expr_two_time_courses("wt", "ki")
diff.expr.a66.wt <- diff_expr_two_time_courses("wt", "ko")

save(diff.expr.wt, diff.expr.a66.0.wt.0, diff.expr.ki.0.wt.0,
     diff.expr.pten.0.wt.0, diff.expr.a66.300.a66.0, diff.expr.pten.wt,
     diff.expr.ki.wt, diff.expr.a66.wt, file = "data/diff.expr.all.rda")
