%% $Id: binomixMachine.Rd 168 2014-07-16 12:31:32Z larssn $

\name{binomixMachine}
\alias{binomixMachine}

\title{
  Computing engine for binomial mixture models
}
\description{
  A function used by \code{binomixEstimate} for fitting binomial mixture models.
}
\usage{
binomixMachine(y,K,core.detect.prob=1.0)
}
\arguments{
  \item{y}{Vector with data, the number of gene clusters observed in 1,2,...,N genomes.}
  \item{K}{The number of binomial components to use.}
  \item{core.detect.prob}{The fixed detection probability of the core genes.}
}
\details{
  This is the function that performs the truncated maximum likelihood estimation for binomial mixture models, and not normally something you would call directly. Use \code{\link{binomixEstimate}} to fit binomial mixture models. This function is only of interest for those who want to explore the computational details of the method.
  
  For details on the computations, see Snipen et al (2009).
}
\value{
  The output is similar to that of \code{\link{binomixEstimate}}.
}
\references{
  Snipen, L., Almoy, T., Ussery, D.W. (2009). Microbial comparative pan-genomics using binomial
mixture models. BMC Genomics, 10:385.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{binomixEstimate}}, \code{\link{negTruncLogLike}}.
}
\examples{
# You should never run this function explicitly, use binomixEstimate().
}
\keyword{internal}