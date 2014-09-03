%% $Id: geneWeights.Rd 185 2014-09-03 08:09:01Z larssn $

\name{geneWeights}
\alias{geneWeights}
\title{
  Gene cluster weighting
}
\description{
  This function computes weights for gene cluster according to their distribution in a pan-genome.
}
\usage{
geneWeights(pan.matrix,type=c("shell","cloud"))
}
\arguments{
  \item{pan.matrix}{A \code{Panmat} object, see \code{\link{panMatrix}} for details.}
  \item{type}{A text indicating the weighting strategy.}
}
\details{
  When computing distances between genomes or a PCA, it is possible to give weights to the different gene clusters, emphasizing certain aspects.
  
  As proposed by Snipen & Ussery (2010), we have implemented two types of weighting: The default \samp{"shell"} type means gene families occuring frequently in the genomes, denoted shell-genes, are given large weight (close to 1) while those occurring rarely are given small weight (close to 0). The opposite is the \samp{"cloud"} type of weighting. Genes observed in a minority of the genomes are referred to as cloud-genes. Presumeably, the \samp{"shell"} weighting will give distances/PCA reflecting a more long-term evolution, since emphasis is put on genes who have just barely diverged away from the core. The \samp{"cloud"} weighting emphasizes those gene clusters seen rarely. Genomes with similar patterns among these genes may have common recent history. A \samp{"cloud"} weighting typically gives a more erratic or \sQuote{noisy} picture than the \samp{"shell"} weighting.
}
\value{
  A vector of weights, one for each column in \code{pan.matrix}.
}
\references{
  Snipen, L., Ussery, D.W. (2010). Standard operating procedure for computing pangenome trees. Standards in Genomic Sciences, 2:135-141.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{panMatrix}}, \code{\link{distManhattan}}.
}
\examples{
# Loading a Panmat object in the micropan package
data(list="Mpneumoniae.blast.panmat",package="micropan")

# Weighted Manhattan distances based on a BLAST clustering Panmat object
w <- geneWeights(Mpneumoniae.blast.panmat,type="shell")
Mdist.blast <- distManhattan(Mpneumoniae.blast.panmat,weights=w)
}