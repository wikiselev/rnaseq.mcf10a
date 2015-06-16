cor_heatmap <- function(count.matrix, name) {
    # plot a correlation matrix from a count matrix calculate pearson's correlation coefficients
    cor.matrix <- cor(count.matrix, method = "pearson")

    # plot correlation matrix in a file with 'name'
    pdf(file = paste0("../pip3-rna-seq-output/figures/", name), w = 10, h = 10)
    heatmap.2(cor.matrix, Rowv = FALSE, Colv = FALSE, dendrogram = "none", col = bluered(9), breaks = 10,
              trace = "none")
    dev.off()
}

plot_read_density <- function(d, name) {
    d$facet <- paste(d$cond, d$rep, d$time, sep = "_")
    p <- ggplot(as.data.frame(d), aes(value, color = facet)) + geom_density() + scale_x_log10()
    # facet_grid(cond ~ time)
    pdf(file = paste0("../pip3-rna-seq-output/figures/read-density-", name, ".pdf"), w = 12, h = 12)
    print(p)
    dev.off()
}

plot_read_ecdf <- function(d, name) {
    d$facet <- paste(d$cond, d$rep, d$time, sep = "_")
    p <- ggplot(as.data.frame(d), aes(value, color = facet)) + stat_ecdf() + scale_x_log10()
    # facet_grid(cond ~ time)
    pdf(file = paste0("../pip3-rna-seq-output/figures/read-ecdf-", name, ".pdf"), w = 12, h = 12)
    print(p)
    dev.off()
}

venn <- function(list, is.weights, name) {
    v <- Venn(list)
    pdf(file = paste0("../pip3-rna-seq-output/figures/venn-", name, ".pdf"))
    plot(v, doWeights = is.weights)
    dev.off()
}

venn_ellipses <- function(list, is.weights, name) {
    v <- Venn(list)
    pdf(file = paste0("../pip3-rna-seq-output/figures/venn-", name, ".pdf"))
    plot(v, doWeights = is.weights, type = "ellipses")
    dev.off()
}

