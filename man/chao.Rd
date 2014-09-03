%% $Id: chao.Rd 185 2014-09-03 08:09:01Z larssn $

\name{chao}
\alias{chao}

\title{
  The Chao lower bound estimate of pan-genome size
}
\description{
  Computes the Chao lower bound estimated number of gene clusters in a pan-genome.
}
\usage{
chao(pan.matrix)
}
\arguments{
  \item{pan.matrix}{A \code{Panmat} object, see \code{\link{panMatrix}} for details.}
}
\details{
  The size of a pan-genome is the number of gene clusters in it, both those observed and those not yet observed.
  
  The input \samp{pan.matrix} is a \code{Panmat} object, i.e. it is a matrix with one row for each genome and one column for each observed gene cluster in the pan-genome. See \code{\link{panMatrix}} for how to construct such objects.
  
  The number of observed gene clusters is simply the number of columns in \samp{pan.matrix}. The number of gene clusters not yet observed is estimated by the Chao lower bound estimator (Chao, 1987). This is based solely on the number of clusters observed in 1 and 2 genomes. It is a very simple and conservative estimator, i.e. it is more likely to be too small than too large.
}
\value{
  The function returns an integer, the estimated pan-genome size. This includes both the number of gene clusters observed so far, as well as the estimated number not yet seen.
}
\references{
Chao, A. (1987). Estimating the population size for capture-recapture data with unequal catchability. Biometrics, 43:783-791.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{panMatrix}}, \code{\link{binomixEstimate}}.
}
\examples{
# Loading a Panmat object in the micropan package
data(list="Mpneumoniae.blast.panmat",package="micropan")

# Estimating the pan-genome size using the Chao estimator
chao.pansize <- chao(Mpneumoniae.blast.panmat)
}

