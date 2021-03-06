% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WCR_function.R
\name{wcr_test}
\alias{wcr_test}
\title{Worst Cast Randomization Test}
\usage{
wcr_test(Xtilde, resids, subclust, clust, alpha = 0.05)
}
\arguments{
\item{Xtilde}{The covariate to be tested, after residualizing on the other variables.}

\item{resids}{Residual from the regression to be tested.}

\item{subclust}{The fine level of clustering that is correct under the null hypothesis.}

\item{clust}{The coarse level of clustering that is correct under the alternative hypothesis.}

\item{alpha}{The size of the test. 5\% by default.}
}
\description{
This function implements the scalar version of the Worst Case Randomization test in Cai (2021).
}
\examples{
# Generate data
X <- rnorm(100); W <- rnorm(100); Y <- X + W + rnorm(100)
clust <- rep(1:5, each = 20)
subclust <- rep(1:20, each = 5)
df <- data.frame(Y,X,W)
  
# Prepare arguments
Xtilde <- model.matrix(X ~ W, df)
reg <- lm(Y~X+W, df)  
  
# Run the test
wcr_test(Xtilde, reg$residuals, subclust, clust)
}
