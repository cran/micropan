%% $Id: plot.Fasta.Rd 191 2014-09-06 08:27:08Z larssn $

\name{plot.Fasta}
\alias{plot.Fasta}
\alias{summary.Fasta}
\alias{str.Fasta}

\title{
  Plotting and printing \code{Fasta} objects
}
\description{
  Generic functions for plotting and printing the content of a \code{Fasta} object.
}
\usage{
\method{plot}{Fasta}(x, col="tan4", border="tan4", ...)
\method{summary}{Fasta}(object, ...)
\method{str}{Fasta}(object, ...)
}
\arguments{
  \item{x}{A \code{Fasta} object, see below.}
  \item{col}{Color of bar interiors.}
  \item{border}{Color of bar borders.}
  \item{object}{A \code{Fasta} object, see below.}
  \item{...}{Optional graphical arguments.}
}
\details{
  A \code{Fasta} object contains biological sequences in the FASTA format. It is a small (S3) extension to a \code{data.frame}. It is actually a \code{data.frame} containing at least two text columns named \samp{Header} and \samp{Sequence}. The \samp{Header} column contains the headerlines for each sequence, and the \samp{Sequence} columns the sequences themselves. A \code{Fasta} object is typically created by reading a FASTA formatted file into R by \code{\link{readFasta}}.
  
  A \code{Fasta} object can be treated as a \code{data.frame}, which makes it quick and easy to search both \samp{Header} and \samp{Sequence} for specific regular expressions, sort or re-arrange the ordering of the sequences, extract subsets or add new data to an existing \code{Fasta} object.
  
  The \code{\link{plot.Fasta}} function will display the content of the \code{Fasta} object as a bar chart over the lengths of the sequences. The bars are displayed horizontally, and the first sequence is on top, just like in the FASTA file.
  
  The \code{\link{summary.Fasta}} function will display a text giving the number of sequences and the alphabet, i.e. listing all unique symbols found in the file.
  
  The \code{\link{str.Fasta}} function will simply print the number of sequences in the \code{Fasta} object.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{readFasta}}, \code{\link{writeFasta}}.
}
\examples{
# See the examples in the Help-file for readFasta/writeFasta
}
\keyword{ ~sequences }
\keyword{ ~FASTA }
\keyword{ ~Fasta }
