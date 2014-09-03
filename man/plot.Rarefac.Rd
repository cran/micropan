%% $Id: plot.Rarefac.Rd 166 2014-07-13 21:41:15Z khliland $

\name{plot.Rarefac}
\alias{plot.Rarefac}
\alias{summary.Rarefac}
\alias{str.Rarefac}

\title{
  Plotting and printing \code{Rarefac} objects
}
\description{
  Generic functions for plotting and printing the content of a \code{Rarefac} object.
}
\usage{
\method{plot}{Rarefac}(x,type="b", pch=16, xlab="Genomes", ylab="Number of unique gene clusters", ... )
\method{summary}{Rarefac}(object, ...)
\method{str}{Rarefac}(object, ...)
}
\arguments{
  \item{x}{A \code{Rarefac} object, see below.}
  \item{object}{A \code{Rarefac} object, see below.}
  \item{type}{Type of plot, default is \samp{"b"}, giving markers with lines between.}
  \item{pch}{Marker type, default is \samp{16}, a filled circle.}
  \item{xlab}{Text for horizontal axis.}
  \item{ylab}{Text for vertical axis.}
  \item{...}{Optional graphical arguments.}
}
\details{
  A \code{Rarefac} object is a small (S3) extension to a matrix. The first column contains the cumulative number of unique gene clusters found when considering 1,2,...,G genomes in a pan-matrix. Thus, the \code{Rarefac} object is a matrix with G rows. Any additional columns will hold similar numbers, but for random shufflings of the genome's ordering. A \code{Rarefac} object is typically created by the function \code{\link{rarefaction}}.
  
  The \code{\link{plot.Rarefac}} function will display the content of the \code{Rarefac} object as a plot of the mean value in rows 1,2,...,G, where G is the total number of genomes in the study.
  
  The \code{\link{summary.Rarefac}} function will display a text giving the same information as \code{\link{plot.Rarefac}}.
  
  The \code{\link{str.Rarefac}} function will simply print the number of genomes of the \code{Rarefac} object.
}

\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{rarefaction}}, \code{\link{heaps}}.
}
\examples{
# Loading a Panmat objects in the micropan package
data(list="Mpneumoniae.blast.panmat",package="micropan")

# Computing Rarefaction
rarefac.blast <- rarefaction(Mpneumoniae.blast.panmat,n.perm=100)


# Plotting and printing the Rarefac object
plot(rarefac.blast)
summary(rarefac.blast)
str(rarefac.blast)
}
