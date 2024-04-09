\name{get_simes_p}
\alias{get_simes_p}
\title{
  Compute Simes p-value given a list of p-values
}
\description{
  Compute Simes p-value given a list of p-values, assuming that NAs do not count toward the total number of tests
}
\usage{
  get_simes_p(pvals)
}
\arguments{
  \item{pvals}{
  Vector of p-values (which may include NAs)
  }
}
\value{
  Value of the Simes p-value
}
\references{
	R. J. Simes (1986). 
	An improved Bonferroni procedure for multiple tests of significance. \emph{Biometrika}. \bold{73}(3): 751--754. 
}
\author{
Christine B. Peterson
}
