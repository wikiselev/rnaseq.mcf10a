library(ggplot2)
library(data.table)

annotate_go_terms <- function(name, num) {
    d <- read.csv(paste0("inst/extdata/GO/", name, "/REVIGO.csv"))
    # d <- d[d$eliminated == 0, ]
    d <- d[, c(1, 2, 7)]
    d <- d[order(d$log10.p.value), ]
    d <- as.data.table(d)
    setkey(d, "term_ID")

    t <- readRDS(paste0("inst/extdata/GO/", name, "/genes-ann-BP.rds"))
    t <- t[names(t) %in% d$term_ID]
    g.num <- lapply(t, length)
    g.num <- as.data.frame(unlist(g.num))
    g.num$term_ID <- rownames(g.num)
    colnames(g.num)[1] <- "gene.num"
    g.num <- as.data.table(g.num)
    setkey(g.num, "term_ID")
    res <- d[g.num]
    res <- res[order(log10.p.value)]

    d <- res
    d$description <- factor(d$description, levels = rev(d$description))
    d <- head(d, num)
    p <- ggplot(d, aes(description, gene.num, fill = log10.p.value)) +
        geom_bar(stat = "identity") +
        coord_flip() +
        scale_fill_gradient(high = "grey90", low = "grey40") +
        theme_bw() +
        theme(axis.line = element_blank(), panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(), panel.border = element_blank(),
              panel.background = element_blank())
    ggsave(paste0("inst/extdata/figures/GO/go-", name, ".pdf"), w = 10, h = 4)

    return(res)
}

set1.GO <- annotate_go_terms("set1", 10)
set2.GO <- annotate_go_terms("set2", 10)
set3.GO <- annotate_go_terms("set3", 10)
set4.GO <- annotate_go_terms("set4", 10)
set5.GO <- annotate_go_terms("set5", 10)
set6.GO <- annotate_go_terms("set6", 10)

set1.1.GO <- annotate_go_terms("set1-1", 10)
set1.2.GO <- annotate_go_terms("set1-2", 10)

set2.1.GO <- annotate_go_terms("set2-1", 10)
set2.2.GO <- annotate_go_terms("set2-2", 10)
set2.3.GO <- annotate_go_terms("set2-3", 10)
set2.4.GO <- annotate_go_terms("set2-4", 10)

set3.1.GO <- annotate_go_terms("set3-1", 10)
set3.2.GO <- annotate_go_terms("set3-2", 10)

set4.1.GO <- annotate_go_terms("set4-1", 10)
set4.2.GO <- annotate_go_terms("set4-2", 10)
set4.3.GO <- annotate_go_terms("set4-3", 10)
set4.4.GO <- annotate_go_terms("set4-4", 10)

set5.1.GO <- annotate_go_terms("set5-1", 10)
set5.2.GO <- annotate_go_terms("set5-2", 10)

set6.1.GO <- annotate_go_terms("set6-1", 10)
set6.2.GO <- annotate_go_terms("set6-2", 10)

setA.GO <- annotate_go_terms("setA", 10)
setB.GO <- annotate_go_terms("setB", 10)
setC.GO <- annotate_go_terms("setC", 10)
setD.GO <- annotate_go_terms("setD", 10)
setE.GO <- annotate_go_terms("setE", 10)
setF.GO <- annotate_go_terms("setF", 10)
setG.GO <- annotate_go_terms("setG", 10)
setH.GO <- annotate_go_terms("setH", 10)

setA.1.GO <- annotate_go_terms("setA-1", 10)
setA.2.GO <- annotate_go_terms("setA-2", 10)
setA.3.GO <- annotate_go_terms("setA-3", 10)
setA.4.GO <- annotate_go_terms("setA-4", 10)
setA.5.GO <- annotate_go_terms("setA-5", 10)

setB.1.GO <- annotate_go_terms("setB-1", 10)
setB.2.GO <- annotate_go_terms("setB-2", 10)
setB.3.GO <- annotate_go_terms("setB-3", 10)
setB.4.GO <- annotate_go_terms("setB-4", 10)

setC.1.GO <- annotate_go_terms("setC-1", 10)
setC.2.GO <- annotate_go_terms("setC-2", 10)
setC.3.GO <- annotate_go_terms("setC-3", 10)

setD.1.GO <- annotate_go_terms("setD-1", 10)
setD.2.GO <- annotate_go_terms("setD-2", 10)

setE.1.GO <- annotate_go_terms("setE-1", 10)
setE.2.GO <- annotate_go_terms("setE-2", 10)
setE.3.GO <- annotate_go_terms("setE-3", 10)
setE.4.GO <- annotate_go_terms("setE-4", 10)
setE.5.GO <- annotate_go_terms("setE-5", 10)

setF.1.GO <- annotate_go_terms("setF-1", 10)
setF.2.GO <- annotate_go_terms("setF-2", 10)

setG.1.GO <- annotate_go_terms("setG-1", 10)
setG.2.GO <- annotate_go_terms("setG-2", 10)
setG.3.GO <- annotate_go_terms("setG-3", 10)
setG.4.GO <- annotate_go_terms("setG-4", 10)

setH.1.GO <- annotate_go_terms("setH-1", 10)
setH.2.GO <- annotate_go_terms("setH-2", 10)
setH.3.GO <- annotate_go_terms("setH-3", 10)

save(set1.GO, set2.GO, set3.GO, set4.GO, set5.GO, set6.GO, set1.1.GO, set1.2.GO,
     set2.1.GO, set2.2.GO, set2.3.GO, set2.4.GO, set3.1.GO, set3.2.GO, set4.1.GO,
     set4.2.GO, set4.3.GO, set4.4.GO, set5.1.GO, set5.2.GO, set6.1.GO, set6.2.GO,
     setA.GO, setB.GO, setC.GO, setD.GO, setE.GO, setF.GO, setG.GO, setH.GO,
     setA.1.GO, setA.2.GO, setA.3.GO, setA.4.GO, setA.5.GO, setB.1.GO, setB.2.GO,
     setB.3.GO, setB.4.GO, setC.1.GO, setC.2.GO, setC.3.GO, setD.1.GO, setD.2.GO,
     setE.1.GO, setE.2.GO, setE.3.GO, setE.4.GO, setE.5.GO, setF.1.GO, setF.2.GO,
     setG.1.GO, setG.2.GO, setG.3.GO, setG.4.GO, setH.1.GO, setH.2.GO, setH.3.GO,
     file = "data/gene.sets.GO.rda")
