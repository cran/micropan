%% $Id: $

\name{setLeafAttributes}
\alias{setLeafAttributes}
\alias{branchPos}
\alias{clusterSignature}
\title{
  Setting leaf attributes
}
\description{
  Function used to set leaf attributes in a pan-genome tree.
}
\usage{
setLeafAttributes(node, lab.names, lab.col, lab.cex)
branchPos(mergeMatrix, ordering)
}
\arguments{
  \item{node}{The \code{\link{dendrogram}} node.}
  \item{lab.names}{Vector of node labels.}
  \item{lab.col}{Vector of node label colors.}
  \item{lab.cex}{Scaling of label fontsize.}
  \item{mergeMatrix}{Matrix of merged brances, see \code{\link{hclust}} for details.}
  \item{ordering}{Order of merged brances, see \code{\link{hclust}} for details.}
}
\details{
  These functions are used by \code{\link{panTree}}. \code{setLeafAttributes} is used in a call to \code{\link{dendrapply}} in order to set leaf attributes in the \code{\link{dendrogram}}. \code{branchPos} and \code{clusterSignature} are used to add bootstrap-values to the pan-genome tree. You would never call these functions explicitly.
}
\author{
  Lars Snipen and Kristian Hovde Liland
}

\seealso{
  \code{\link{panTree}}.
}
\examples{
# You should not call these functions explicitly.
}
\keyword{internal}