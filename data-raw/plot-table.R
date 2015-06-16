library(reshape2)
library(data.table)

melt_data <- function(m) {
    d <- melt(m)
    d <- as.data.table(d)
    d[, `:=`(cond, sapply(strsplit(as.character(d[, variable]), "_"), "[[", 1))]
    d[, `:=`(time, sapply(strsplit(as.character(d[, variable]), "_"), "[[", 2))]
    d <- d[, list(id, value, cond, time)]
    d[cond == "ki", `:=`(cond, "PIK3CA H1047R")]
    d[cond == "pten", `:=`(cond, "PTEN KO")]
    d[cond == "wt", `:=`(cond, "WT")]
    d[cond == "ko", `:=`(cond, "A66")]
    d[cond == "konost", `:=`(cond, "A66 no EGF")]
    d <- as.data.frame(d)
    d$time <- as.numeric(d$time)
    return(d)
}

# create table that contain time course data suitable for ggplot2
plot.data.av <- melt_data(count.matrix.av)
plot.data.sd <- melt_data(count.matrix.sd)

# merge average values with standard deviations
plot.data <- merge(plot.data.av, plot.data.sd, by = c("id", "cond", "time"))
colnames(plot.data) <- c("id", "cond", "time", "value", "sd")
save(plot.data, file = "data/plot.data.rda")

# create table that contain time course data suitable for ggplot2
plot.data.scaled.av <- melt_data(count.matrix.scaled.av)
plot.data.scaled.sd <- melt_data(count.matrix.scaled.sd)

# merge average values with standard deviations
plot.data.scaled <- merge(plot.data.scaled.av, plot.data.scaled.sd,
                          by = c("id", "cond", "time"))
colnames(plot.data.scaled) <- c("id", "cond", "time", "value", "sd")
save(plot.data.scaled, file = "data/plot.data.scaled.rda")

# create table that contain time course data suitable for ggplot2
plot.data.rpkm.av <- melt_data(count.matrix.rpkm.av)
plot.data.rpkm.sd <- melt_data(count.matrix.rpkm.sd)

# merge average values with standard deviations
plot.data.rpkm <- merge(plot.data.rpkm.av, plot.data.rpkm.sd,
                          by = c("id", "cond", "time"))
colnames(plot.data.rpkm) <- c("id", "cond", "time", "value", "sd")
save(plot.data.rpkm, file = "data/plot.data.rpkm.rda")
