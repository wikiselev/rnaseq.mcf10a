library(DESeq2)

count_matrix_from_files <- function(files, normalized) {
    # this function create a count matrix from raw htseq read counts files it
    # uses DESeq2 library to construct the matrix

    # create a design matrix for DESeq2
    sample.name <- sapply(strsplit(files, "_trimmed"), "[[", 1)
    condition <- sapply(strsplit(sample.name, "_"), "[[", 1)
    samples <- data.frame(sample.name = sample.name,
                          file.name = paste0("inst/extdata/htseq/", files),
                          condition = condition)
    samples$condition <- factor(samples$condition,
                                levels = unique(samples$condition))

    # import data from files using 'samples' design matrix
    cds <- DESeqDataSetFromHTSeqCount(sampleTable = samples,
                                      directory = ".",
                                      design = ~condition)

    # if normalized is TRUE then the count matrix is normalized by library size
    # using estimateSizeFactors function of DESeq2
    if (normalized)
    {
        cds <- estimateSizeFactors(cds)
        return(counts(cds, normalized = TRUE))
    }  # otherwise return the raw matrix
    else {
        return(counts(cds))
    }
}

average_count_matrix_by_reps <- function(count.matrix) {
    # average count matrix over the replicates
    conditions <- c("wt", "ko", "pten", "ki")
    times <- c(0, 15, 40, 90, 180, 300)
    count.matrix.av <- data.frame(id = rownames(count.matrix))
    count.matrix.sd <- data.frame(id = rownames(count.matrix))

    for (cond in conditions) {
        for (time in times) {
            count.matrix.av$new <-
                rowMeans(count.matrix[ , grepl(paste0(cond, "_.*_", time),
                                               colnames(count.matrix))])
            colnames(count.matrix.av)[dim(count.matrix.av)[2]] <- paste0(cond, "_", time)
            count.matrix.sd$new <-
                apply(count.matrix[ , grepl(paste0(cond, "_.*_", time),
                                            colnames(count.matrix))], 1, sd)
            colnames(count.matrix.sd)[dim(count.matrix.sd)[2]] <- paste0(cond, "_", time)
        }
    }
    # last condition
    cond <- "konost"
    time <- 300
    count.matrix.av$new <- rowMeans(count.matrix[ , grepl(paste0(cond, "_.*_", time),
                                                          colnames(count.matrix))])
    colnames(count.matrix.av)[dim(count.matrix.av)[2]] <- "konost_300"
    count.matrix.sd$new <- apply(count.matrix[ , grepl(paste0(cond, "_.*_", time),
                                                       colnames(count.matrix))], 1, sd)
    colnames(count.matrix.sd)[dim(count.matrix.sd)[2]] <- "konost_300"
    return(list(count.matrix.av, count.matrix.sd))
}

count_matrix_2_data_table <- function(m) {
    # this function create a data table from a read count matrix
    # data tables are useful for some analysis
    d <- as.data.frame(m)
    d$gene_id <- rownames(d)
    d <- melt(d)
    d <- as.data.table(d)
    d[, `:=`(cond, sapply(strsplit(as.character(d[, variable]), "_"), "[[", 1))]
    d[, `:=`(rep, sapply(strsplit(as.character(d[, variable]), "_"), "[[", 2))]
    d[, `:=`(time, sapply(strsplit(as.character(d[, variable]), "_"), "[[", 3))]
    d <- d[, list(gene_id, value, cond, rep, time)]
    # change wrong treatment names to proper ones
    d[cond == "ko", `:=`(cond, "a66")]
    d[cond == "konost", `:=`(cond, "a66_nost")]
    return(d)
}

# create a count matrix from raw counts produced by htseq_count
files <- list.files("inst/extdata/htseq")

# create count matrix using DESeqDataSetFromHTSeqCount() function from DESeq2
# read counts normalised by SizeFactors using DESeq2 estimateSizeFactors function
count.matrix <- count_matrix_from_files(files, T)

# remove all 0-expressed genes
count.matrix <- count.matrix[rowSums(count.matrix) > 0, ]

# rearrage columns in count matrix so that they ordered by treatments and times
x <- c(1, 7, 13, 2, 8, 14, 5, 11, 17, 6, 12, 18, 3, 9, 15, 4, 10, 16,
       19, 25, 31, 20, 26, 32, 23, 29, 35, 24, 30, 36, 21, 27, 33, 22,
       28, 34, 37, 38, 39, 40, 46, 52, 41, 47, 53, 44, 50, 56, 45, 51,
       57, 42, 48, 54, 43, 49, 55, 58, 70, 68, 71, 59, 64, 69, 62, 75,
       74, 63, 67, 72, 60, 65, 73, 61, 66)
count.matrix <- count.matrix[ , x]

# average count matrix by replicates
res <- average_count_matrix_by_reps(count.matrix)
count.matrix.av <- res[[1]]
count.matrix.sd <- res[[2]]
save(count.matrix, count.matrix.av, count.matrix.sd,
     file = "data/count.matrix.rda")

# calculate RPKM values by using total exon lengths in each gene
exon.lengths <-
    gene.annotations[gene.annotations$ensembl_gene_id %in% rownames(count.matrix), ]
exon.lengths <- exon.lengths[order(exon.lengths$ensembl_gene_id), ]
# mean(colSums(count.matrix)) == 21890091 - mean library size;
# this values is also used in shiny app
count.matrix.rpkm <- count.matrix /
                     exon.lengths$total_exon_length *
                     1e+09 /
                     mean(colSums(count.matrix))
# average RPKM matrix by replicates
res <- average_count_matrix_by_reps(count.matrix.rpkm)
count.matrix.rpkm.av <- res[[1]]
count.matrix.rpkm.sd <- res[[2]]
save(count.matrix.rpkm, count.matrix.rpkm.av, count.matrix.rpkm.sd,
     file = "data/count.matrix.rpkm.rda")

# scale and center count matrix -- needed for clustering
count.matrix.scaled <- t(scale(t(count.matrix), center = T, scale = T))

# average scaled matrix by replicates
res <- average_count_matrix_by_reps(count.matrix.scaled)
count.matrix.scaled.av <- res[[1]]
count.matrix.scaled.sd <- res[[2]]
save(count.matrix.scaled, count.matrix.scaled.av, count.matrix.scaled.sd,
     file = "data/count.matrix.scaled.rda")

# convert count.matrix into data.table
count.data.table <- count_matrix_2_data_table(count.matrix)
save(count.data.table, file = "data/count.data.table.rda")
