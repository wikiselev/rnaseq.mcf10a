library(rtracklayer)

d <- import("inst/extdata/gene-ann-illumina/genes.gtf")

# calculate total length of all exons in each gene
# warning - takes a lot of time to calculate!
sink("inst/extdata/gene-ann-illumina/exon.lengths.csv")
cat(paste("ensembl_gene_id", "total_exon_length", sep = ","))
for (g in unique(d$gene_id)) {
    r <- reduce(d[d$gene_id == g & d$type == "exon"])
    len <- sum(end(r) - start(r))
    cat(paste(g, len, sep = ","))
    cat("\n")
}
sink()

# annotate ensembl gene ids with gene names
gene.annotations <- unique(data.frame(ensembl_gene_id = d$gene_id,
                                      hgnc_symbol = d$gene_name))
exon.lengths <- read.table("inst/extdata/gene-ann-illumina/exon.lengths.csv",
                           header = T, sep = ",")
gene.annotations <- cbind(gene.annotations, exon.lengths$total_exon_length)
colnames(gene.annotations)[3] <- "total_exon_length"
save(gene.annotations, file = "data/gene.annotations.rda")
