\name{get_fisher_p}
\alias{get_fisher_p}
\title{
  Compute Fisher p-value given a list of p-values
}
\description{
  Compute Fisher p-value given a list of p-values, assuming that NAs do not count toward the total number of tests
}
\usage{
  get_fisher_p(pvals)
}
\arguments{
  \item{pvals}{
  Vector of p-values (which may include NAs)
  }
}
\value{
  Value of the Fisher p-value
}
\references{
	Fisher, R.A. (1925). \emph{Statistical Methods for Research Workers}.
}
\author{
Christine B. Peterson
}
