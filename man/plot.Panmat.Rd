%% $Id: plot.Panmat.Rd 185 2014-09-03 08:09:01Z larssn $

\name{plot.Panmat}
\alias{plot.Panmat}
\alias{summary.Panmat}
\alias{str.Panmat}
\title{
  Plotting and printing \code{Panmat} objects
}
\description{
  Generic functions for plotting and printing the content of a \code{Panmat} object.
}
\usage{
\method{plot}{Panmat}(x, col="black", xlab="Number of genomes", ylab="Number of clusters", ...)
\method{summary}{Panmat}(object, ...)
\method{str}{Panmat}(object, ...)
}
\arguments{
  \item{x}{A \code{Panmat} object, see below.}
  \item{object}{A \code{Panmat} object, see below.}
  \item{col}{The color, default is \samp{"black"}, of interior and borders of the bars in the barplot.}
  \item{xlab}{The label of the X axis.}
  \item{ylab}{The label of the Y axis.}
  \item{...}{Optional (graphical) arguments.}
}
\details{
  A \code{Panmat} object contains a pan-matrix, which is the fundamental data structure for pan-genome analyses. It is a small (S3) extension to a \code{matrix}. It has one row for each genome in the study, and one column for each gene cluster. The number in cell \samp{[i,j]} is the number of sequences in genome \samp{i} that belongs to cluster \samp{j}. A \code{Panmat} object is typically created by the function \code{\link{panMatrix}}.
  
  The \code{\link{plot.Panmat}} function will display the content of the \code{Panmat} object as a bar chart showing the number of clusters found in 1,2,...,G genomes, where G is the total number of genomes in the study (rows in \samp{Panmat}).
  
  The \code{\link{summary.Panmat}} function will display a text giving the same information as \code{\link{plot.Panmat}}.
  
  The \code{\link{str.Panmat}} function will simply print the dimensions of the \code{Panmat} object.
}
\author{
   Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{panMatrix}}.
}
\examples{
# Loading clustering data in the micropan package
data(list="Mpneumoniae.blast.clustering",package="micropan")
panmat.blast <- panMatrix(Mpneumoniae.blast.clustering)

# Plotting and printing the Panmat object
plot(panmat.blast)
summary(panmat.blast)
str(panmat.blast)
}
\keyword{ ~Panmat }
\keyword{ ~pan-matrix }
