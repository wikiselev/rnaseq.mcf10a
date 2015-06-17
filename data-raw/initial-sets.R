# EGF-responding genes in WT
egf <- rownames(diff.expr.wt[!is.na(diff.expr.wt$padj) &
                             diff.expr.wt$padj < 0.01, ])
# all conditions against WT at 0 min
ki <- rownames(diff.expr.ki.0.wt.0[!is.na(diff.expr.ki.0.wt.0$padj) &
                                   diff.expr.ki.0.wt.0$padj < 0.05, ])
pten <- rownames(diff.expr.pten.0.wt.0[!is.na(diff.expr.pten.0.wt.0$padj) &
                                       diff.expr.pten.0.wt.0$padj < 0.05, ])
a66 <- rownames(diff.expr.a66.0.wt.0[!is.na(diff.expr.a66.0.wt.0$padj) &
                                     diff.expr.a66.0.wt.0$padj < 0.05, ])
# compare time courses
pten.tc <- rownames(diff.expr.pten.wt[!is.na(diff.expr.pten.wt$padj) &
                                      diff.expr.pten.wt$padj < 0.01, ])
ki.tc <- rownames(diff.expr.ki.wt[!is.na(diff.expr.ki.wt$padj) &
                                  diff.expr.ki.wt$padj < 0.01, ])
a66.tc <- rownames(diff.expr.a66.wt[!is.na(diff.expr.a66.wt$padj) &
                                    diff.expr.a66.wt$padj < 0.01, ])

a66.nost.eff <- rownames(diff.expr.a66.300.a66.0[!is.na(diff.expr.a66.300.a66.0$padj) &
                                                 diff.expr.a66.300.a66.0$padj < 0.05, ])

pi3k.related <- unique(c(pten.tc, ki.tc))

# gene universe
all.genes <- unique(c(egf, ki, pten, pi3k.related, a66.tc, a66.nost.eff))
save(egf, ki, pten, a66, pten.tc, ki.tc, a66.tc, a66.nost.eff, pi3k.related,
     all.genes, file = "data/auxiliary.gene.sets.rda")

# WT gene sets
set1 <- a66.nost.eff[!a66.nost.eff %in% a66.tc & a66.nost.eff %in% egf]
set2 <- a66.nost.eff[!a66.nost.eff %in% a66.tc & !a66.nost.eff %in% egf]
set3 <- a66.nost.eff[a66.nost.eff %in% a66.tc & a66.nost.eff %in% egf]
set4 <- a66.tc[!a66.tc %in% a66.nost.eff & a66.tc %in% egf]
set5 <- a66.tc[!a66.tc %in% a66.nost.eff & !a66.tc %in% egf]
set6 <- a66.nost.eff[a66.nost.eff %in% a66.tc & !a66.nost.eff %in% egf]

# mutant gene sets
setA <- ki[ki %in% pten & ki %in% egf & ki %in% pi3k.related]
setB <- ki[ki %in% pten & !ki %in% egf & ki %in% pi3k.related]
setC <- ki[!ki %in% pten & ki %in% egf & ki %in% pi3k.related]
setD <- ki[!ki %in% pten & !ki %in% egf & ki %in% pi3k.related]
setE <- pten[!pten %in% ki & pten %in% egf & pten %in% pi3k.related]
setF <- pten[!pten %in% ki & !pten %in% egf & pten %in% pi3k.related]
setG <- egf[!egf %in% pten & !egf %in% ki & egf %in% pi3k.related]
setH <- pi3k.related[!pi3k.related %in% pten & !pi3k.related %in% ki & !pi3k.related %in% egf]
save(set1, set2, set3, set4, set5, set6, setA, setB, setC, setD, setE, setF,
     setG, setH, file = "data/main.gene.sets.rda")
