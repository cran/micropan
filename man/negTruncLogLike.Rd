%% $Id: negTruncLogLike.Rd 185 2014-09-03 08:09:01Z larssn $

\name{negTruncLogLike}
\alias{negTruncLogLike}
\title{
  Negative truncated log-likelihood function
}
\description{
  The negative truncated log-likelihood function to maximize when fitting binomial mixture models to pan-genome data.
}
\usage{
negTruncLogLike(p,y,core.p)
}
\arguments{
  \item{p}{Vector of parameters (mixing proportions and detection probabilities).}
  \item{y}{Vector of data, the number of gene families observed in 1, 2,...,N genomes.}
  \item{core.p}{The fixed detection probability of core genes.}
}
\details{
  This is the function optimized by \code{\link{binomixMachine}} when fitting a binomial mixture model to data, and not a function you would call otherwise. This function is only of interest for those who want to explore the computational details of the method.
}
\value{
  The negative log-likelihood value is returned, since the optimization algorithm used in \code{\link{binomixEstimate}} search for minima.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{binomixEstimate}}, \code{\link{binomixMachine}}.
}
\examples{
# You should never run this function explicitly, use binomixEstimate().
}
\keyword{internal}