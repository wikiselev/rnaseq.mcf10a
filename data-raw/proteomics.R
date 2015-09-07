# proteomics data from this paper:
# Reversed-phase chromatography with multiple fraction concatenation strategy
# for proteome profiling of human MCF10A cells
# http://onlinelibrary.wiley.com/doi/10.1002/pmic.201000722/suppinfo

d <- read.csv("~/Downloads/supplementary_table.csv")
d <- d[, c(4,6:8)]
d <- as.data.table(d)
genes <- d[,list(len = length(LpH)), by = "Entrez_GeneName"]
genes <- genes[len > 10]$Entrez_GeneName
genes <- as.character(genes)
d <- d[d$Entrez_GeneName %in% genes[!grepl(";", genes)]]
d <- d[Entrez_GeneName != ""]

# export for Biomart processing
write.table(as.character(unique(d[d$HpH > 10]$Entrez_GeneName)), row.names = F, col.names = F, quote = F, "~/genes.txt")
# import processed by Biomart (containing Ensembl IDs)
d1 <- read.table("~/Downloads/mart_export.txt", sep = "\t", header = T)

# leave only peptides with the maximum score
d <- d[, list(HpH = max(HpH)), by = "Entrez_GeneName"]
colnames(d1)[2] <- "Entrez_GeneName"
d <- merge(as.data.frame(d), d1)
d <- as.data.table(d)

write.table(d[Ensembl.Gene.ID %in% set1], file = "~/set1.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% set2], file = "~/set2.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% set3], file = "~/set3.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% set4], file = "~/set4.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setA], file = "~/setA.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setB], file = "~/setB.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setC], file = "~/setC.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setD], file = "~/setD.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setE], file = "~/setE.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setF], file = "~/setF.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setG], file = "~/setG.txt", row.names = F, quote = F)
write.table(d[Ensembl.Gene.ID %in% setH], file = "~/setH.txt", row.names = F, quote = F)
