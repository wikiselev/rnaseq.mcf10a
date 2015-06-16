diff_expr_pairwise <- function(cond1, cond2, time1, time2) {
    files <- list.files("data-raw/htseq-read-count-raw/")
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
                                      directory = "data-raw/htseq-read-count-raw/",
                                      design = ~condition)

    # perform the main computation
    cds <- DESeq(cds)

    return(results(cds))
}

diff_expr_time_course <- function(cond) {
    files <- list.files("data-raw/htseq-read-count-raw/")
    files <- files[grepl(paste0(cond, "_"), files)]
    time <- sapply(strsplit(files, "\\_"), "[[", 3)
    time.levels <- c("0", "15", "40", "90", "180", "300")
    samples <- data.frame(sample.name = files, file.name = files, time = time)
    # change levels
    samples$time <- factor(samples$time, levels = time.levels)

    # create a DESeqDataSet with interaction term in the design formula
    cds <- DESeqDataSetFromHTSeqCount(sampleTable = samples,
                                      directory = "data-raw/htseq-read-count-raw/",
                                      design = ~time)

    # perform the main computation
    cds <- DESeq(cds)

    # using a new feature in DESeq2 package use maximum likelihood test to find
    # diff. expressed genes in WT time course
    cdsLRT <- nbinomLRT(cds, reduced = ~1)
    return(results(cdsLRT))
}

diff_expr_two_time_courses_cond <- function(cond1, cond2) {
    files <- list.files("data-raw/htseq-read-count-raw/")
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
                                      directory = "data-raw/htseq-read-count-raw/",
                                      design = ~condition + time + condition:time)

    # perform the main computation
    cds <- DESeq(cds)
    resultsNames(cds)

    # likelihood ratio test
    cdsLRT <- nbinomLRT(cds, reduced = ~time)
    return(results(cdsLRT))
}

get_diff_expr <- function(name, padj) {
    d <- load(paste0("data-raw/diff-expr/", name, ".rda"))
    return(d[!is.na(d$padj) & d$padj < padj, ])
}
