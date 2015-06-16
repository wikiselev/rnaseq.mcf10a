library(topGO)

python.path <- "~/homebrew/bin/python"

GO <- function(selected.genes, all.genes, name, p.val) {
    system(paste0("rm -r inst/extdata/GO/", name))
    system(paste0("mkdir inst/extdata/GO/", name))

    geneList <- factor(as.integer(all.genes %in% selected.genes))
    names(geneList) <- all.genes

    GOdata <- new("topGOdata",
                  ontology = "BP",
                  allGenes = geneList,
                  annot = annFUN.org,
                  mapping = "org.Hs.eg.db",
                  ID = "ensembl")

    res <- runTest(GOdata, algorithm = "classic", statistic = "fisher")

    res.table <- GenTable(GOdata, classicFisher = res, topNodes = length(usedGO(GOdata)))
    res.table$classicFisher <- as.numeric(res.table$classicFisher)
    res.table <- res.table[res.table$classicFisher < p.val, ]
    genes.ann <- genesInTerm(GOdata, whichGO = res.table$GO.ID)
    genes.ann <- lapply(genes.ann, function(x) {
        x[x %in% selected.genes]
    })
    saveRDS(genes.ann, paste0("inst/extdata/GO/", name, "/genes-ann-BP.rds"))
    write.table(res.table[, c(1, 6)],
                file = paste0("inst/extdata/GO/", name, "/BP-Fisher-revigo.txt"),
                quote = F, row.names = F, col.names = F, sep = "\t")
    system(paste0(python.path, " data-raw/revigo.py BP-Fisher-revigo.txt ", name))
    source(paste0("inst/extdata/GO/", name, "/treemap.R"), chdir = T)
}

# check GO enrichment in unclustered gene sets
GO(set1, all.genes, "set1", 0.05)
GO(set2, all.genes, "set2", 0.05)
GO(set3, all.genes, "set3", 0.05)
GO(set4, all.genes, "set4", 0.05)
GO(set5, all.genes, "set5", 0.05)
GO(set6, all.genes, "set6", 0.05)

GO(setA, all.genes, "setA", 0.05)
GO(setB, all.genes, "setB", 0.05)
GO(setC, all.genes, "setC", 0.05)
GO(setD, all.genes, "setD", 0.05)
GO(setE, all.genes, "setE", 0.05)
GO(setF, all.genes, "setF", 0.05)
GO(setG, all.genes, "setG", 0.05)
GO(setH, all.genes, "setH", 0.05)

# check GO enrichment in clustered gene sets
clusts <- list(set1.clusts, set2.clusts, set3.clusts, set4.clusts, set5.clusts,
               set6.clusts)
ind <- 1
for (j in clusts) {
    for (i in 1:length(unique(j))) {
        GO(names(j[j == i]), all.genes,
           paste0("set", c(1, 2, 3, 4, 5, 6)[ind], "-", i), 0.05)
    }
    ind <- ind + 1
}

clusts <- list(setA.clusts, setB.clusts, setC.clusts, setD.clusts, setE.clusts,
               setF.clusts, setG.clusts, setH.clusts)
ind <- 1
for (j in clusts) {
    for (i in 1:length(unique(j))) {
        GO(names(j[j == i]), all.genes,
           paste0("set", c("A", "B", "C", "D", "E", "F", "G", "H")[ind], "-", i),
           0.05)
    }
    ind <- ind + 1
}
