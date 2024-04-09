\name{TreeBH-package}
\alias{TreeBH-package}
\alias{TreeBH}
\docType{package}
\title{
Error Control for Tree-Structured Hypotheses
}
\description{
This package implements a multiple testing procedure which addresses the challenge of controlling error rates at multiple levels of resolution. We frame this problem as the selection of hypotheses which are organized in a tree structure. The procedure controls relevant error rates (in particular, the selective FDR in each level of the tree) given certain assumptions on the dependence among the hypotheses.
    For code designed specifically for error control in the context of single and multi-tissue eQTL analysis, see the \href{http://bioinformatics.org/treeqtl/}{TreeQTL} package.
}
\details{
\tabular{ll}{
Package: \tab TreeBH\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-03-02\cr
License: \tab LGPL\cr
}
}
\author{
Christine B. Peterson

Maintainer: Christine B. Peterson <cbpeterson@gmail.com>
}
\references{
  Marina Bogomolov*, Christine B. Peterson*, Yoav Benjamini, and Chiara Sabatti (2017).
\href{https://arxiv.org/abs/1705.07529}{Testing hypotheses on a tree: new error rates and controlling strategies}. arXiv:1705.07529. *Authors contributed equally.
}
\keyword{ package }
\examples{
# This example follows the simulation set-up in Section 5.2 of Bogomolov et al. (2017)
# [https://arxiv.org/pdf/1705.07529.pdf] and Section 6.2 of Barber and Ramdas (2017)
# [http://dx.doi.org/10.1111/rssb.12218]. Specifically, there are a total of 100 x 100
# hypotheses, with the non-null hypotheses (true signals) arranged into 2 blocks of size
# 15 x 15 with 15 additional non-null hypotheses along the diagonal.

# Set up matrix with 0 for true null hypotheses and 1 for non-nulls
truth <- matrix(0, nrow = 100, ncol = 100)
truth[1:15, 1:15] <- 1
truth[16:30, 16:30] <- 1
for (i in 31:45) {
  truth[i, i] <- 1
}

# Generate p-values following known structure
mu <- truth * 3
X <- mu + matrix(rnorm(100 * 100), nrow = 100, ncol = 100)
pval_table <- 1 - pnorm(X)

# Define a three-level hierarchy, with hypotheses grouped
# 1. By row
# 2. In blocks of size 15 (with a final block of size 10) within each row
# 3. Individually within each block
level1_grouping <- as.vector(matrix(rep(1:100, 100), ncol = 100, byrow = FALSE))
level2_grouping <- as.vector(matrix(c(rep(1, 15), rep(2, 15), rep(3, 15),
                                      rep(4, 15), rep(5, 15), rep(6, 15),
                                      rep(7, 10)), ncol = 100, nrow = 100, byrow = TRUE) +
                               t(matrix(0:99 * 7, ncol = 100, nrow = 100, byrow = TRUE)))
level3_grouping <- 1:10000
groups <- cbind(level1_grouping, level2_grouping, level3_grouping)

# Apply TreeBH procedure, targeting a selective FDR of 0.2 in each level
target_level <- 0.2
treeBH_results <- get_TreeBH_selections(pvals = as.vector(pval_table),
                                        groups = groups,
                                        q = rep(target_level, 3))
}
