import_other_mcf10a_wt <- function() {
    d <- read.csv("../pip3-rna-seq-input/other-cell-lines/140625_Klijn_count_noncoding.txt", sep = "\t", header = TRUE)
    d <- as.data.table(d)
    d <- d[, list(geneID, Sample.73)]

    d1 <- read.csv("../pip3-rna-seq-input/other-cell-lines/140625_Klijn_counts_coding.txt", sep = "\t", header = TRUE)
    d1 <- as.data.table(d1)
    d1 <- d1[, list(geneID, Sample.73)]
    setnames(d1, colnames(d1), c("EntrezGene.ID", "counts"))
    setkey(d1, "EntrezGene.ID")

    # ann <- read.csv('../pip3-rna-seq-input/other-cell-lines/140625_Klijn_geneToTranscript.txt', sep = '\t',
    # header = TRUE) ann <- as.data.table(ann) ann$gene_id <-
    # as.numeric(unlist(sapply(strsplit(as.character(ann$gene_id), ':'), '[[', 2)))

    mart <- read.csv("../pip3-rna-seq-input/other-cell-lines/mart_export.txt", sep = "\t", header = TRUE)
    mart <- mart[!is.na(mart$EntrezGene.ID), ]
    mart <- as.data.table(mart)
    setkey(mart, "EntrezGene.ID")

    d1 <- d1[mart]
    d1 <- d1[!is.na(counts)]
    d1 <- d1[, list(Ensembl.Gene.ID, counts)]

    setnames(d, colnames(d), c("Ensembl.Gene.ID", "counts"))
    d <- rbind(as.data.frame(d1), as.data.frame(d))
    colnames(d) <- c("ensembl_gene_id", "klijn_wt")
    d[, 2] <- as.numeric(d[, 2])
    return(d)
}

import_other_mcf10a_pten <- function() {
    d <- read.csv("../pip3-rna-seq-input/other-cell-lines/MCF10A_PTEN_expression.txt", sep = "\t", header = TRUE)
    d <- as.data.table(d)
    setnames(d, colnames(d), c("counts", "rpkm", "EntrezGene.ID"))
    setkey(d, "EntrezGene.ID")

    mart <- read.csv("../pip3-rna-seq-input/other-cell-lines/mart_export.txt", sep = "\t", header = TRUE)
    mart <- mart[!is.na(mart$EntrezGene.ID), ]
    mart <- as.data.table(mart)
    setkey(mart, "EntrezGene.ID")

    d <- d[mart]
    d <- d[!is.na(counts)]
    d <- d[, list(Ensembl.Gene.ID, counts)]
    d <- as.data.frame(d)

    colnames(d) <- c("ensembl_gene_id", "klijn_pten")
    d[, 2] <- as.numeric(d[, 2])
    return(d)
}

import_other_mcf10a_pten_wt <- function() {
    d <- read.csv("../pip3-rna-seq-input/other-cell-lines/MCF10A_WT_expression.txt", sep = "\t", header = TRUE)
    d <- as.data.table(d)
    setnames(d, colnames(d), c("counts", "rpkm", "EntrezGene.ID"))
    setkey(d, "EntrezGene.ID")

    mart <- read.csv("../pip3-rna-seq-input/other-cell-lines/mart_export.txt", sep = "\t", header = TRUE)
    mart <- mart[!is.na(mart$EntrezGene.ID), ]
    mart <- as.data.table(mart)
    setkey(mart, "EntrezGene.ID")

    d <- d[mart]
    d <- d[!is.na(counts)]
    d <- d[, list(Ensembl.Gene.ID, counts)]
    d <- as.data.frame(d)

    colnames(d) <- c("ensembl_gene_id", "klijn_wt")
    d[, 2] <- as.numeric(d[, 2])
    return(d)
}

import_other_mcf10a_vogt <- function() {
    # paper: Hart, J. R. et al. The butterfly effect in cancer: A single base mutation can remodel the cell.
    # Proc. Natl. Acad. Sci. U. S. A. 112, 1131–1136 (2015).
    d <- read.csv("../pip3-rna-seq-input/other-cell-lines/GSE63452_mcf10a.vs.pik3ca.h1047r.csv", sep = ",")
    d <- d[, 1:7]
    gene.names <- hgnc_symbol_to_ensembl_id(d$gene)
    colnames(gene.names)[2] <- "gene"
    d <- merge(d, gene.names)
    d <- d[, 2:8]
    colnames(d) <- c("vogt_h1047r_1", "vogt_h1047r_2", "vogt_h1047r_3", "vogt_wt_1", "vogt_wt_2", "vogt_wt_3",
                     "ensembl_gene_id")
    return(d)
}

import_other_rwpe1 <- function() {
    affybatch <- read.celfiles(paste0("../pip3-rna-seq-input/other-cell-lines/E-GEOD-47047/", list.celfiles("../pip3-rna-seq-input/other-cell-lines/E-GEOD-47047/")))
    eset <- rma(affybatch)
    eset.expr <- exprs(affybatch)
    d <- as.data.frame(eset.expr)

    k <- keys(hugene10sttranscriptcluster.db, keytype = "PROBEID")
    t <- select(hugene10sttranscriptcluster.db, keys = k, columns = c("ENSEMBL"), keytype = "PROBEID")
    t <- t[!is.na(t[, 2]), ]

    d$PROBEID <- rownames(d)
    res <- merge(d, t)
    res <- res[, c(5:8)]
    colnames(res) <- c("RWPE1_1", "RWPE1_2", "RWPE1_3", "ensembl_gene_id")
    return(res)
}

# analysis of similarities of our results with the results of a new paper: Hart, J. R. et al. The
# butterfly effect in cancer: A single base mutation can remodel the cell.  Proc. Natl. Acad. Sci. U. S.
# A. 112, 1131–1136 (2015).
d <- read.csv("../pip3-rna-seq-input/other-cell-lines/GSE63452_mcf10a.vs.pik3ca.h1047r.csv", sep = ",")
# select only significant genes at 0hr time point: 3485 genes
d <- d[d$X0hr.p.value < 0.05, ]
d <- hgnc_symbol_to_ensembl_id(d$gene)
initialize_sets()
venn(list(Butterfly = d$ensembl_gene_id, `Our KI` = ki, `Our PTEN` = pten), TRUE, "comparison-with-new-paper-0hr")

# correlations between WTs and KIs
count.matrix <- readRDS("../pip3-rna-seq-output/rds/count-matrix.rds")
c <- count.matrix[, c(1:3, 40:42, 58:60)]
c <- as.data.frame(c)
c$ensembl_gene_id <- rownames(c)

mcf10a.klijn.wt <- import_other_mcf10a_pten_wt()
mcf10a.klijn.pten <- import_other_mcf10a_pten()
mcf10a.vogt <- import_other_mcf10a_vogt()
# rwpe1 <- import_other_rwpe1()

t <- merge(mcf10a.vogt, c)
t <- merge(mcf10a.klijn.wt, t)
t <- merge(mcf10a.klijn.pten, t)
# t <- merge(rwpe1, t)

# plot a correlation matrix from a count matrix calculate pearson's correlation coefficients
cor.matrix <- cor(as.matrix(t[, c(2:18)]), method = "pearson")
# plot correlation matrix in a file with 'name'
pdf(file = "../pip3-rna-seq-output/figures/cor-butterfly.pdf", w = 6, h = 6)
heatmap.2(cor.matrix, Rowv = FALSE, Colv = FALSE, dendrogram = "none", col = bluered(99), breaks = 100,
          trace = "none", keysize = 1.5, margins = c(10, 10))
dev.off()

t1 <- scale(t[, c(2:18)], center = T, scale = T)

res <- prcomp(t1)
pdf(file = "../pip3-rna-seq-output/figures/pca-variances-butterfly.pdf", w = 4, h = 3)
print(screeplot(res))
dev.off()

data <- as.data.frame(res$rotation[, 1:3])
data$Condition <- c("PTEN-/-", "WT", "H1047R", "H1047R", "H1047R", "WT", "WT", "WT", "H1047R", "H1047R",
                    "H1047R", "PTEN-/-", "PTEN-/-", "PTEN-/-", "WT", "WT", "WT")
data$Paper <- c(rep("Klijn", 2), rep("Vogt", 6), rep("Ours", 9))
p <- ggplot(data, aes(PC1, PC2, color = Condition)) + geom_point(aes(shape = Paper, size = 2)) + theme_bw()
pdf(file = "../pip3-rna-seq-output/figures/pca12-butterfly.pdf", w = 5, h = 4)
print(p)
dev.off()
p <- ggplot(data, aes(PC1, PC3, color = Condition)) + geom_point(aes(shape = Paper, size = 2)) + theme_bw()
pdf(file = "../pip3-rna-seq-output/figures/pca13-butterfly.pdf", w = 5, h = 4)
print(p)
dev.off()
p <- ggplot(data, aes(PC2, PC3, color = Condition)) + geom_point(aes(shape = Paper, size = 2)) + theme_bw()
pdf(file = "../pip3-rna-seq-output/figures/pca23-butterfly.pdf", w = 5, h = 4)
print(p)
dev.off()

open3d(windowRect = c(100, 100, 700, 700))
plot3d(res$rotation, xlab = "PC1", ylab = "PC2", zlab = "PC3")
spheres3d(res$rotation, radius = 0.01, col = rainbow(length(res$rotation[, 1])))
grid3d(side = "z", at = list(z = 0))
text3d(res$rotation, text = rownames(res$rotation), adj = 1.3)
