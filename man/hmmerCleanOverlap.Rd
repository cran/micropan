%% $Id: hmmerCleanOverlap.Rd 126 2013-06-28 09:27:54Z larssn $

\name{hmmerCleanOverlap and nonoverlap}
\alias{hmmerCleanOverlap}
\alias{nonoverlap}
\title{
  Removing overlapping hits from HMMER3 scans
}
\description{
  Removing hits to avoid overlapping HMMs on the same protein sequence.
}
\usage{
hmmerCleanOverlap(hmmer.table)
nonoverlap(hmmer.table)
}
\arguments{
  \item{hmmer.table}{A \code{data.frame} with \code{\link{hmmerScan}} results, see \code{\link{readHmmer}}.}
}
\details{
  When scanning sequences against a profile HMM database using \code{\link{hmmerScan}}, we often find that several patterns (HMMs) match in the same region of the query sequence, i.e. we have overlapping hits. The function \code{\link{hmmerCleanOverlap}} will remove the poorest overlapping hit in a recursive way such that all overlaps are eliminated.

The function \code{\link{nonoverlap}} is used by \code{\link{hmmerCleanOverlap}}, and not something you call directly.

The input is a \code{data.frame} of the type produced by \code{\link{readHmmer}}.
}
\value{
A \code{data.frame} which is a subset of the input, where some rows have been deleted to avoid overlapping hits.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{hmmerScan}}, \code{\link{readHmmer}}, \code{\link{dClust}}.
}
\examples{
# See the example in the Help-file for dClust.
}
