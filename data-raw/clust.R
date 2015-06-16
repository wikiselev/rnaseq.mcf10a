library(fpc)
library(ggplot2)

clust_bootstrap <- function(genes, min.clust.num, max.clust.num, name) {
    count.matrix.scaled <-
        count.matrix.scaled[rownames(count.matrix.scaled) %in% genes, ]
    for (i in min.clust.num:max.clust.num) {
        c.boot <- clusterboot(count.matrix.scaled,
                              B = 100,
                              bootmethod = "boot",
                              clustermethod = pamkCBI,
                              krange = i,
                              seed = 155)
        saveRDS(c.boot, paste0("inst/extdata/clusts/", name, "-", i, ".rds"))
    }
}

plot_bootstrap <- function(pattern, name) {
    files <- list.files(paste0("inst/extdata/clusts/"), pattern = paste0(pattern, "-*"))
    jaccard.stats <- data.frame(factor(), numeric(), numeric(), factor(), factor())
    for (file in files) {
        set <- strsplit(file, "-")[[1]][1]
        clust.num <- as.numeric(strsplit(strsplit(file, "-")[[1]][2], "\\.")[[1]][1])
        dat <- readRDS(paste0("inst/extdata/clusts/", file))
        for (i in 1:clust.num) {
            jaccard.stats <-
                rbind(jaccard.stats, cbind(set, dat$bootresult[i, ], i, clust.num))
        }

    }
    colnames(jaccard.stats) <- c("set", "jacc.sim", "clust.ind", "clust.num")
    jaccard.stats$jacc.sim <- as.numeric(as.character(jaccard.stats$jacc.sim))

    p <- ggplot(jaccard.stats, aes(clust.ind, jacc.sim)) +
        geom_boxplot() +
        facet_grid(set ~ clust.num) +
        geom_hline(yintercept = 0.75, color = "red") +
        theme_bw()
    ggsave(paste0("inst/extdata/figures/", name, ".pdf"), w = 12, h = 8)
}

plot_clusts <- function(clusts, name) {
    d <- as.data.table(plot.data.scaled)
    d[, `:=`(clust, -1)]

    ind <- 1
    clust.size <- NULL
    inds <- c(1:length(clusts))
    for (j in clusts) {
        clust.size <- rbind(clust.size, cbind(as.data.frame(table(j)), inds[ind]))
        for (i in 1:length(unique(j))) {
            genes <- names(j[j == i])
            d[id %in% genes, `:=`(clust, i)]
            d[id %in% genes, `:=`(set, inds[ind])]
        }
        ind <- ind + 1
    }
    colnames(clust.size) <- c("clust", "gene.num", "set")
    clust.size$val <- 0
    clust.size$sd <- 0
    clust.size$cond <- "anything"
    clust.size$time <- 0

    d <- d[clust != -1]
    d <- d[ , list(val = mean(value), sd = sd(value)),
            by = c("cond", "time", "clust", "set")]

    limits <- aes(ymax = val + sd, ymin = val - sd)
    p <- ggplot(d, aes(time, val, group = cond, color = cond)) +
        geom_line() +
        geom_point() +
        geom_text(aes(x = 270, y = 1, label = gene.num),
                  data = clust.size,
                  colour = "black") +
        facet_grid(set ~ clust) +
        theme_bw()
    ggsave(paste0("inst/extdata/figures/clusts-", name, ".pdf"), w = 10, h = 10)
}

clust_bootstrap(set1, 2, 6, "set1")
clust_bootstrap(set2, 2, 6, "set2")
clust_bootstrap(set3, 2, 6, "set3")
clust_bootstrap(set4, 2, 6, "set4")
clust_bootstrap(set5, 2, 6, "set5")
clust_bootstrap(set6, 2, 6, "set6")

clust_bootstrap(setA, 2, 7, "setA")
clust_bootstrap(setB, 2, 6, "setB")
clust_bootstrap(setC, 2, 7, "setC")
clust_bootstrap(setD, 2, 6, "setD")
clust_bootstrap(setE, 2, 7, "setE")
clust_bootstrap(setF, 2, 6, "setF")
clust_bootstrap(setG, 2, 7, "setG")
clust_bootstrap(setH, 2, 6, "setH")

plot_bootstrap("set[1-6]", "supp1")
plot_bootstrap("set[A-H]", "supp2")

# select good clusterings
set1.clusts <- readRDS("inst/extdata/clusts/set1-2.rds")$partition
set2.clusts <- readRDS("inst/extdata/clusts/set2-4.rds")$partition
set3.clusts <- readRDS("inst/extdata/clusts/set3-2.rds")$partition
set4.clusts <- readRDS("inst/extdata/clusts/set4-4.rds")$partition
set5.clusts <- readRDS("inst/extdata/clusts/set5-2.rds")$partition
set6.clusts <- readRDS("inst/extdata/clusts/set6-2.rds")$partition

plot_clusts(list(set1.clusts, set2.clusts, set3.clusts, set4.clusts,
                 set5.clusts, set6.clusts), "wt")

# select good clusterings
setA.clusts <- readRDS("inst/extdata/clusts/setA-5.rds")$partition
setB.clusts <- readRDS("inst/extdata/clusts/setB-4.rds")$partition
setC.clusts <- readRDS("inst/extdata/clusts/setC-3.rds")$partition
setD.clusts <- readRDS("inst/extdata/clusts/setD-2.rds")$partition
setE.clusts <- readRDS("inst/extdata/clusts/setE-5.rds")$partition
setF.clusts <- readRDS("inst/extdata/clusts/setF-2.rds")$partition
setG.clusts <- readRDS("inst/extdata/clusts/setG-4.rds")$partition
setH.clusts <- readRDS("inst/extdata/clusts/setH-3.rds")$partition

plot_clusts(list(setA.clusts, setB.clusts, setC.clusts, setD.clusts,
                 setE.clusts, setF.clusts, setG.clusts, setH.clusts), "mut")

save(set1.clusts, set2.clusts, set3.clusts, set4.clusts, set5.clusts,
     set6.clusts, setA.clusts, setB.clusts, setC.clusts, setD.clusts,
     setE.clusts, setF.clusts, setG.clusts, setH.clusts,
     file = "data/gene.clusters.all.rda")
