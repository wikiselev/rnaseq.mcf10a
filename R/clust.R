clust_boot <- function(genes, min.clust.num, max.clust.num, name, ind) {
    cm <- cm[rownames(count.matrix.scaled) %in% genes, ]
    for (i in min.clust.num:max.clust.num) {
        c.boot <- clusterboot(cm,
                              B = 100,
                              bootmethod = "boot",
                              clustermethod = pamkCBI,
                              krange = i,
                              seed = 155)
        saveRDS(c.boot, paste0("../pip3-rna-seq-output/rds/clusts/", name, "/", ind, "-", i, ".rds"))
    }
}

plot_bootstrap_data <- function(name) {
    files <- list.files(paste0("../pip3-rna-seq-output/rds/clusts/", name))
    # files <- files[grepl(paste0('clust-', name, 'set'), files)]
    jaccard.stats <- data.frame(factor(), numeric(), numeric(), factor(), factor())
    for (file in files) {
        set <- strsplit(file, "-")[[1]][1]
        clust.num <- as.numeric(strsplit(strsplit(file, "-")[[1]][2], "\\.")[[1]][1])
        dat <- readRDS(paste0("../pip3-rna-seq-output/rds/clusts/", name, "/", file))
        for (i in 1:clust.num) {
            jaccard.stats <- rbind(jaccard.stats, cbind(set, dat$bootresult[i, ], i, clust.num))
        }

    }
    colnames(jaccard.stats) <- c("set", "jacc.sim", "clust.ind", "clust.num")
    jaccard.stats$jacc.sim <- as.numeric(jaccard.stats$jacc.sim)

    # limits <- aes(ymax = jacc.sim + jacc.sd, ymin = jacc.sim - jacc.sd) jaccard.stats$set <-
    # factor(jaccard.stats$set, levels = unique(jaccard.stats$set))

    p <- ggplot(jaccard.stats, aes(clust.ind, jacc.sim)) + geom_boxplot() + facet_grid(set ~ clust.num) +
        geom_hline(yintercept = 0.75, color = "red") + theme_bw()
    pdf(file = paste0("../pip3-rna-seq-output/figures/cluster-", name, "-boots.pdf"), width = 12, height = 8)
    print(p)
    dev.off()
}

get_clust_wt <- function() {
    clust1 <- get_clust_genes("a66", "1-2")
    clust2 <- get_clust_genes("a66", "2-4")
    clust3 <- get_clust_genes("a66", "3-2")
    clust4 <- get_clust_genes("a66", "4-2")
    clust5 <- get_clust_genes("a66", "5-2")
    clust6 <- get_clust_genes("a66", "6-2")


    clusts <- list(clust1$partition, clust2$partition, clust3$partition, clust4$partition, clust5$partition,
                   clust6$partition)

    plot_all_clusts(clusts, "a66", c(1, 2, 3, 4, 5, 6))
    return(clusts)
}
