library(data.table)
library(reshape)
library(gplots)
library(ggplot2)

get_ismara_target_info_from_file <- function(file) {
    # read the targets file line by line and store them in mylist
    fc <- file(paste0("inst/extdata/ismara/targets/", file))
    mylist <- strsplit(readLines(fc), "\t")
    close(fc)

    # from mylist remove locations with no targets
    mylist <- mylist[unlist(lapply(mylist, length)) > 3]

    # extract information from mylist
    loc <- unlist(lapply(mylist, "[", 1))
    score <- unlist(lapply(mylist, "[", 2))
    motif <- unlist(lapply(mylist, "[", 3))
    len <- unlist(lapply(mylist, function(x) length(4:length(x))))
    targets <- unlist(lapply(mylist, function(x) x[4:length(x)]))
    target <- unlist(lapply(strsplit(targets, "\\|"), "[", 2))

    # record the source reference
    ref <- unlist(lapply(strsplit(targets, "\\|"), "[", 1))

    # put all information in one table
    mytable <- unique(data.table(location = rep(loc, len),
                                 score = rep(score, len),
                                 motif = rep(motif, len),
                                 target = target, ref = ref))

    # remove all GenBank entries, leave only RefSeq entries and collaps entries
    # with the same location,score,motif,target sets
    mytable <- unique(mytable[grepl("NM_", ref),
                              list(location, score, motif, target)])
    return(mytable)
}

merge_ismara_target_files <- function() {
    files <- list.files("inst/extdata/ismara/targets/")

    data <- data.table()
    for (i in files) {
        dt <- get_ismara_target_info_from_file(i)
        data <- rbindlist(list(data, dt))
    }
    data[, `:=`(score, as.numeric(data[, score]))]
    # When a target was present several times with different promoters, we used the
    # promoter which had the maximum score Spm (personal communication with Piotr
    # Balwierz)
    data <- data[, list(score = max(score)), by = c("target", "motif")]

    sig <- read.table(file = "inst/extdata/ismara/active_matrices.txt")
    colnames(sig) <- c("motif", "zval")

    ismara.targets <- as.data.table(merge(as.data.frame(data), sig))

    save(ismara.targets, file = "data/ismara.targets.rda")
}

heatmap_ismara_activities <- function() {
    d <- t(read.table(file = "inst/extdata/ismara/activity_table.txt", header = T))
    sig <- read.table(file = "inst/extdata/ismara/active_matrices.txt")
    colnames(sig) <- c("variable", "zval")
    sig.z <- sig[sig$zval > 2, ]
    d <- d[rownames(d) %in% sig.z[, 1], ]
    sig.z <- sig.z[order(sig.z[, 1]), ]

    t <- arrange_ismara_activity_matrix(d)
    colnames(t) <- sapply(strsplit(colnames(t), "_"), function(x) {
        paste(x[1], x[3], sep = "_")
    })

    t.av <- as.data.table(melt(t))
    t.av <- t.av[, list(av = mean(value)), by = c("X1", "X2")]
    t.av <- cast(t.av, X1 ~ X2)
    rownames(t.av) <- t.av$X1
    t.av <- t.av[, 2:26]
    cols <- colnames(t.av)
    rows <- rownames(t.av)
    t.av <- as.matrix(t.av)
    colnames(t.av) <- cols
    rownames(t.av) <- rows
    t.av <- arrange_ismara_activity_matrix_av(t.av)
    t <- t(scale(t(t), center = T, scale = T))
    t.av <- t(scale(t(t.av), center = T, scale = T))
    rownames(t.av) <- paste(sig.z[, 1], sig.z[, 2], sep = " - ")

    # set custom distance and clustering functions
    hclustfunc <- function(x) hclust(x, method = "complete")
    distfunc <- function(x) dist(x, method = "maximum")

    # obtain the clusters
    fit <- hclustfunc(distfunc(t))
    clusters <- cutree(fit, 4)
    pdf(file = "inst/extdata/figures/fig4-raw.pdf", w = 7, h = 6)
    heatmap.2(t,
              Colv = F,
              trace = "none",
              scale = "none",
              margins = c(5, 21),
              hclust = hclustfunc,
              distfun = distfunc,
              col = bluered(256),
              symbreak = T,
              dendrogram = "row",
              lwid = c(0.3, 0.05, 1),
              lhei = c(0.3, 1),
              lmat = rbind(c(5, 0, 4), c(3, 1, 2)),
              RowSideColors = as.character(clusters))
    dev.off()

    # obtain the clusters
    fit <- hclustfunc(distfunc(t.av))
    clusters <- cutree(fit, 4)
    pdf(file = "inst/extdata/figures/fig4-av.pdf", w = 7, h = 6)
    heatmap.2(t.av,
              Colv = F,
              trace = "none",
              scale = "none",
              margins = c(5, 21),
              hclust = hclustfunc,
              distfun = distfunc,
              col = bluered(256),
              symbreak = T,
              dendrogram = "row",
              lwid = c(0.3, 0.05, 1),
              lhei = c(0.3, 1),
              lmat = rbind(c(5, 0, 4), c(3, 1, 2)),
              RowSideColors = as.character(clusters))
    dev.off()
}

arrange_ismara_activity_matrix <- function(count.matrix) {
    x <- c(37, 38, 39, 58, 68, 70, 59, 64, 71, 62, 69, 75, 63, 67, 74, 60, 65,
           72, 61, 66, 73, 19, 25, 31, 20, 26, 32, 23, 29, 35, 24, 30, 36, 21,
           27, 33, 22, 28, 34, 1, 7, 13, 2, 8, 14, 5, 11, 17, 6, 12, 18, 3, 9,
           15, 4, 10, 16, 40, 46, 52, 41, 47, 53, 44, 50, 56, 45, 51, 57, 42,
           48, 54, 43, 49, 55)
    return(count.matrix[, x])
}

arrange_ismara_activity_matrix_av <- function(count.matrix) {
    x <- c(13, 20, 21, 24, 25, 22, 23, 7, 8, 11, 12, 9, 10, 1, 2, 5, 6, 3, 4,
           14, 15, 18, 19, 16, 17)
    return(count.matrix[, x])
}

ismara_plot_score_dist <- function(data, name) {
    ann.data <- data[1:6]
    ann.data$score <- 30
    ann.data$y <- Inf
    ann.data$target <- "target"
    ann.data$diff <- unique(ann.data$diff)[1]
    ann.data <- unique(ann.data)
    ann.data$D <- format(ann.data$D, digits = 1, nsmall = 2)

    # http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
    cbPalette <- c("red", "blue")

    p <- ggplot(data, aes(x = score)) +
         geom_bar(aes(fill = diff), position = "dodge", width = 0.3) +
        facet_wrap(~motif, scale = "free_y") +
        scale_fill_manual(values = cbPalette) +
        labs(x = "Target score, Sm", y = "Target number") +
        guides(fill = guide_legend(title = "Gene types")) +
        theme_bw()
    ggsave(paste0("inst/extdata/figures/", name, ".pdf"), w = 16, h = 10)
}

kolmogorov_smirnov_test <- function(score, diff, diff1, diff2) {
    x <- score[diff == diff1]
    y <- score[diff == diff2]
    if (length(x) != 0 & length(y) != 0) {
        return(ks.test(x, y))
    }
}

wilcox_test <- function(score, diff, diff1, diff2) {
    x <- score[diff == diff1]
    y <- score[diff == diff2]
    if (length(x) != 0 & length(y) != 0) {
        return(wilcox.test(x, y))
    }
}

ensembl_id_to_hgnc_symbol <- function(genes) {
    mart <- gene.annotations
    res <- unique(mart[mart$ensembl_gene_id %in% genes, 1:2])
    return(res)
}

hgnc_symbol_to_ensembl_id <- function(genes) {
    mart <- gene.annotations
    res <- unique(mart[mart$hgnc_symbol %in% genes, 1:2])
    return(res)
}

get_ismara_motifs <- function(gene.set) {
    gene.names <- ensembl_id_to_hgnc_symbol(gene.set)
    return(ismara.targets[target %in% gene.names$hgnc_symbol])
}

motif_diff_activity <- function(gene.set1, gene.set2, diff1, diff2, name) {
    d1 <- get_ismara_motifs(gene.set1)
    d2 <- get_ismara_motifs(gene.set2)

    d1 <- d1[, list(motif, zval, score, target, diff = diff1)]
    d2 <- d2[, list(motif, zval, score, target, diff = diff2)]

    d <- rbind(d1, d2)

    # filter insignificant targets and motifs (everywhere use 2)
    d <- d[zval > 2]

    ks <- d[, list(D = kolmogorov_smirnov_test(score, diff, diff1, diff2)[[1]],
                   p = kolmogorov_smirnov_test(score, diff, diff1, diff2)[[2]]),
            by = "motif"]
    ks <- ks[order(-ks[, D])]

    wx <- d[, list(W = wilcox_test(score, diff, diff1, diff2)[[1]],
                   p = wilcox_test(score, diff, diff1, diff2)[[3]]),
            by = "motif"]
    wx <- wx[order(wx[, W])]

    # all wx motifs are included in ks
    setkey(ks, "motif")
    setkey(d, "motif")

    # use merge to keep motifs which present only in diff1 or diff2
    d <- merge(ks, d, all = TRUE, by = "motif")
    # motifs which present only in diff1 or diff2 will have score D=1
    d[is.na(D), `:=`(D, 1)]
    d <- as.data.frame(d)
    # factorize motifs with levels proportional to their zval
    d$motif <- factor(d$motif, levels = unique(d[with(d, order(-D)), ]$motif))

    # plot distribution of scores for each motif
    ismara_plot_score_dist(d, name)
    return(as.data.table(d))
}

plot_prdm1_targets <- function(genes, norm, s) {
    res <- hgnc_symbol_to_ensembl_id(genes)
    colnames(res) <- c("id", "name")
    plot.data <- plot.data.rpkm[plot.data.rpkm$id %in% res$id, ]
    plot.data <- merge(plot.data, res)
    plot.data$name <- factor(plot.data$name, levels = genes)

    limits <- aes(ymax = value + sd, ymin = value - sd)

    p <- ggplot(plot.data, aes(time, value, group = cond, color = cond)) +
        geom_point(data = plot.data[plot.data$name %in% genes &
                                    plot.data$time == 300 &
                                    plot.data$cond == "a66_nost", ]) +
        geom_line() + facet_grid(name ~ ., scale = "free") +
        geom_errorbar(limits, width = 0.25) +
        theme(axis.title.x = element_blank(), axis.title.y = element_blank(),
              axis.text = element_text(size = 7), legend.position = "none",
              plot.background = element_blank(), panel.background = element_blank(),
              strip.text = element_blank(), strip.background = element_blank())
    ggsave("inst/extdata/figures/table2.pdf", w = 2, h = 10, bg = "transparent")
}

# import ismara target information from ismara report
merge_ismara_target_files()
# Figure 4 in the paper
heatmap_ismara_activities()
# Figure 8 in the paper
motif_diff_activity(setA, setB, "A", "B", "fig8")
# Table 2 in the paper
prdm1.targets <- ismara.targets[motif == "PRDM1.p3" &
                                target %in% ensembl_id_to_hgnc_symbol(setA)[ , 2]]
prdm1.targets <- prdm1.targets[order(-score)]
save(prdm1.targets, file = "data/prdm1.targets.rda")
plot_prdm1_targets(prdm1.targets$target)
