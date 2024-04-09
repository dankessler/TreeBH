\name{get_TreeBH_selections}
\alias{get_TreeBH_selections}
\title{
  Performs multi-level hierarchical selection 
}
\description{
  This function identifies hypotheses of interest, where the hypotheses are organized within a hierarchical tree structure.
  Given p-values for the leaf nodes and a definition of the tree structure, this procedure identifies selected
  hypotheses, controlling the targeted selective false discovery rate at each level in the tree.
}
\usage{
  get_TreeBH_selections(pvals, groups, q, test = "simes")
}
\arguments{
  \item{pvals}{
  Vector of \code{N} p-values (some of which may be \code{NA}) corresponding to the individual hypotheseses in the most granular level of the tree
  }
  \item{groups}{
  Matrix defining how hypotheses are grouped within each level of the tree.
  Specifically, an \code{N x L} matrix where if hypothesis \code{n} belongs to the \code{k}th group in level \code{l}, 
  \code{groups[n, l]} should be set to \code{k}.
  The final column should just be \code{1:N} since the most granular grouping is by individual hypothesis
  }
  \item{q}{
  Vector of \code{L} error rates (e.g. 0.05) to be targeted for each level in the tree
  }
  \item{test}{
  Vector of \code{L-1} combination methods to obtain level \code{l-1} p-values from level \code{l} p-values.
  Options are "simes" and "fisher". Default is "simes" at each level.
  }
}
\value{
  \code{N x L} binary matrix. This matrix matches up with the input argument \code{groups}. If the \code{k}th group in level \code{l} was selected,
  the first matrix element corresponding to this group will be set to 1 to indicate the group was selected. The remaining entries will be 0s.
}
\references{
  Marina Bogomolov*, Christine B. Peterson*, Yoav Benjamini, and Chiara Sabatti (2017).
\href{https://arxiv.org/abs/1705.07529}{Testing hypotheses on a tree: new error rates and controlling strategies}. arXiv:1705.07529. *Authors contributed equally. 
}
\author{
Christine B. Peterson
}
