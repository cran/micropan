\name{plot.Pantree}
\alias{plot.Pantree}
\alias{summary.Pantree}
\alias{str.Pantree}

\title{
  Plotting and printing \code{Pantree} objects
}
\description{
  Generic functions for plotting and printing the content of a \code{Pantree} object.
}
\usage{
\method{plot}{Pantree}(x, leaf.lab=NULL, col="black", xlab="", main="", cex=1, show.boot=TRUE, ...)
\method{summary}{Pantree}(object, ...)
\method{str}{Pantree}(object, ...)
}
\arguments{
  \item{x}{A \code{Pantree} object, see below.}
  \item{object}{A \code{Pantree} object, see below.}
  \item{leaf.lab}{Alternative labels for the leaves, see below.}
  \item{col}{Color of the leaf labels, see below.}
  \item{xlab}{Text for the x-axis (distance-axis) of the plotted tree.}
  \item{main}{Title above the plotted tree.}
  \item{cex}{Scaling of the leaf labels of the plotted tree.}
  \item{show.boot}{Logical to turn off plotting of bootstrap values.}
  \item{\dots}{Additional arguments, see below.}
}
\details{
  A \code{Pantree} object is created by \code{\link{panTree}} and contains information to display a pan-genome tree. The \code{\link{plot.Pantree}} function will display the tree as a \code{\link{dendrogram}} object.
  
  The argument \samp{leaf.lab} can be used to give alternative labels, the GID-tags are used by default. \samp{leaf.lab} must be a vector of labels, one for each genome in the \code{Pantree}. The labels may be in any order, but the vector must be named by the GID-tags, i.e. each element in \samp{leaf.lab} must have a name which is a valid GID-tag for some genome. This is necessary to ensure the alternative labels are placed correctly in the tree.
  
  The argument \samp{col} specifies the color(s) of the leaf labels in the tree. It can either be a single color or a vector of colors, one for each leaf label (genome). Again, the colors may be in any order, but the vector must be named by the GID-tags, i.e. each element in \samp{col} must have a name which is a valid GID-tag for some genome.
  
  The argument \samp{cex} scales the leaf label font size.
  
  The argument \samp{show.boot} can be used to turn off the display of bootstrap values. Note that if the tree was constructed without bootstrapping, no bootstrap values are available, and this argument has no effect.
  
  Any additional arguments are passed on to the \code{\link{plot.dendrogram}} function.
  
  Both \code{\link{summary.Pantree}} and \code{\link{str.Pantree}} prints a short text describing the \code{Pantree} object.
}
\author{
    Lars Snipen and Kristian Hovde Liland.
}
\note{Using \samp{nodePar} to manipulate the \code{\link{dendrogram}} object will have no effect on the leaf nodes here since these are set by the \code{\link{dendrapply}} function. The tree is always displayed horizontal, to align the labels in the right margin for easy reading.}

\seealso{
  \code{\link{panTree}}
}
\examples{
# See examples in the Help-file for panTree.
}
\keyword{ ~Pantree }
