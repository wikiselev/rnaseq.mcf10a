library(ggplot2)
library(data.table)
library(gplots)

cor_heatmap <- function(count.matrix, name) {
    # plot a correlation matrix from a count matrix calculate pearson's
    # correlation coefficients
    cor.matrix <- cor(count.matrix, method = "pearson")

    # plot correlation matrix in a file with 'name'
    pdf(file = paste0("inst/extdata/figures/", name), w = 10, h = 10)
    heatmap.2(cor.matrix, Rowv = FALSE, Colv = FALSE, dendrogram = "none",
              col = bluered(9), breaks = 10, trace = "none")
    dev.off()
}

plot_read_density <- function(d) {
    d$facet <- paste(d$cond, d$rep, d$time, sep = "_")
    p <- ggplot(as.data.frame(d), aes(value, color = facet)) +
        geom_density() +
        scale_x_log10()
    ggsave(paste0("inst/extdata/figures/read-density.pdf"), w = 10, h = 10)
}

plot_read_ecdf <- function(d) {
    d$facet <- paste(d$cond, d$rep, d$time, sep = "_")
    p <- ggplot(as.data.frame(d), aes(value, color = facet)) +
        stat_ecdf() +
        scale_x_log10()
    # facet_grid(cond ~ time)
    ggsave(file = paste0("inst/extdata/figures/read-ecdf.pdf"), w = 10, h = 10)
}

pca <- function() {
    res <- prcomp(count.matrix.scaled)
    pdf(file = "inst/extdata/figures/pca-vars.pdf", w = 7, h = 6)
    print(screeplot(res))
    dev.off()

    data <- as.data.frame(res$rotation[, 1:3])
    data$cond <- unlist(lapply(strsplit(rownames(data), "_"), function(x) {
        return(x[1])
    }))
    data$time <- unlist(lapply(strsplit(rownames(data), "_"), function(x) {
        return(x[3])
    }))
    data$time <- as.numeric(data$time)
    data$cond <- factor(data$cond, levels = c("ko", "konost", "ki", "pten", "wt"))
    p <- ggplot(data, aes(PC1, PC2, color = cond)) +
        geom_point(aes(size = time, shape = cond)) +
        scale_size(range = c(3, 6)) +
        theme_bw()
    ggsave("inst/extdata/figures/fig1-pca12.pdf", w = 7, h = 6)

    p <- ggplot(data, aes(PC2, PC3, color = cond)) +
        geom_point(aes(size = time, shape = cond)) +
        scale_size(range = c(3, 6)) +
        theme_bw()
    ggsave("inst/extdata/figures/fig1-pca23.pdf", w = 7, h = 6)

    p <- ggplot(data, aes(PC1, PC3, color = cond)) +
        geom_point(aes(size = time, shape = cond)) +
        scale_size(range = c(3, 6)) +
        theme_bw()
    ggsave(file = "inst/extdata/figures/fig1-pca13.pdf", w = 7, h = 6)

#     # in 3D - reqires 'rgl' package to be installed
#     open3d(windowRect = c(100, 100, 700, 700))
#     plot3d(res$rotation, xlab = "PC1", ylab = "PC2", zlab = "PC3")
#     spheres3d(res$rotation, radius = 0.01, col = rainbow(length(res$rotation[, 1])))
#     grid3d(side = "z", at = list(z = 0))
#     text3d(res$rotation, text = rownames(res$rotation), adj = 1.3)
#     rgl.postscript(file = "inst/extdata/figures/figures/pca-3d.pdf", fmt = "pdf")
}

# plot correlation heatmap of count.matrix - Figure 1 A in the paper
cor_heatmap(count.matrix, "fig1A.pdf")

# check read density distribution and cumulative distribution
plot_read_density(count.data.table)
plot_read_ecdf(count.data.table)

# principal component analysis - Figure 1 B in the paper
pca()
