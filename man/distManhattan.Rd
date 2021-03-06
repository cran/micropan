% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genomedistances.R
\name{distManhattan}
\alias{distManhattan}
\title{Computing Manhattan distances between genomes}
\usage{
distManhattan(pan.matrix, scale = 0, weights = rep(1, ncol(pan.matrix)))
}
\arguments{
\item{pan.matrix}{A pan-matrix, see \code{\link{panMatrix}} for details.}

\item{scale}{An optional scale to control how copy numbers should affect the distances.}

\item{weights}{Vector of optional weights of gene clusters.}
}
\value{
A \code{dist} object (see \code{\link{dist}}) containing all pairwise Manhattan distances
between genomes.
}
\description{
Computes the (weighted) Manhattan distances beween all pairs of genomes.
}
\details{
The Manhattan distance is defined as the sum of absolute elementwise differences between
two vectors. Each genome is represented as a vector (row) of integers in \samp{pan.matrix}. The
Manhattan distance between two genomes is the sum of absolute difference between these rows. If
two rows (genomes) of the \samp{pan.matrix} are identical, the corresponding Manhattan distance
is \samp{0.0}.

The \samp{scale} can be used to control how copy number differences play a role in the distances
computed. Usually we assume that going from 0 to 1 copy of a gene is the big change of the genome,
and going from 1 to 2 (or more) copies is less. Prior to computing the Manhattan distance, the
\samp{pan.matrix} is transformed according to the following affine mapping: If the original value in
\samp{pan.matrix} is \samp{x}, and \samp{x} is not 0, then the transformed value is \samp{1 + (x-1)*scale}.
Note that with \samp{scale=0.0} (default) this will result in 1 regardless of how large \samp{x} was.
In this case the Manhattan distance only distinguish between presence and absence of gene clusters.
If \samp{scale=1.0} the value \samp{x} is left untransformed. In this case the difference between 1
copy and 2 copies is just as big as between 1 copy and 0 copies. For any \samp{scale} between 0.0 and
1.0 the transformed value is shrunk towards 1, but a certain effect of larger copy numbers is still
present. In this way you can decide if the distances between genomes should be affected, and to what
degree, by differences in copy numbers beyond 1. Notice that as long as \samp{scale=0.0} (and no
weighting) the Manhattan distance has a nice interpretation, namely the number of gene clusters that
differ in present/absent status between two genomes.

When summing the difference across gene clusters we can also up- or downweight some clusters compared
to others. The vector \samp{weights} must contain one value for each column in \samp{pan.matrix}. The
default is to use flat weights, i.e. all clusters count equal. See \code{\link{geneWeights}} for
alternative weighting strategies.
}
\examples{
# Loading a pan-matrix in this package
data(xmpl.panmat)

# Manhattan distances between genomes
Mdist <- distManhattan(xmpl.panmat)

\dontrun{
# Making a dendrogram based on shell-weighted distances
library(ggdendro)
weights <- geneWeights(xmpl.panmat, type = "shell")
Mdist <- distManhattan(xmpl.panmat, weights = weights)
ggdendrogram(dendro_data(hclust(Mdist, method = "average")),
  rotate = TRUE, theme_dendro = FALSE) +
  labs(x = "Genomes", y = "Shell-weighted Manhattan distance", title = "Pan-genome dendrogram")
}

}
\seealso{
\code{\link{panMatrix}}, \code{\link{distJaccard}}, \code{\link{geneWeights}}.
}
\author{
Lars Snipen and Kristian Hovde Liland.
}
