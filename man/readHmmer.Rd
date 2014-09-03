%% $Id: readHmmer.Rd 189 2014-09-06 08:22:07Z larssn $

\name{readHmmer}
\alias{readHmmer}
\title{
  Reading results from a HMMER3 scan
}
\description{
  Reading a text file produced by \code{\link{hmmerScan}}.
}
\usage{
readHmmer(hmmer.file,e.value=1,use.acc=TRUE)
}
\arguments{
  \item{hmmer.file}{The name of a \code{\link{hmmerScan}} result file.}
  \item{e.value}{Numeric threshold, hits with E-value above this are ignored (default is 1.0).}
  \item{use.acc}{Logical indicating if accession numbers should be used to identify the hits.}
}
\details{
  The function reads a text file produced by \code{\link{hmmerScan}}. By specifying a smaller \samp{e.value} you filter out poorer hits, and fewer results are returned. The option \samp{use.acc} should be turned off (FALSE) if you scan against your own database where accession numbers are lacking.
}
\value{
  The results are returned in a \samp{data.frame} with columns \samp{Query}, \samp{Hit}, \samp{Evalue}, \samp{Score}, \samp{Start}, \samp{Stop}, \samp{Description}. \samp{Query} is the tag identifying each sequence in each genome, typically \samp{GID111_seq1}, \samp{GID121_seq3}, etc. \samp{Hit} is the name or accession number for a pHMM in the database describing patterns. The \samp{Evalue} is the \samp{ievalue} in the HMMER3 terminology. The \samp{Score} is the HMMER3 score for the match between \samp{Query} and \samp{Hit}. The \samp{Start} and \samp{Stop} are the positions within the \samp{Query} where the \samp{Hit} (pattern) starts and stops. \samp{Description} is the description of the \samp{Hit}.

  There is one line for each hit. 
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{hmmerScan}}, \code{\link{hmmerCleanOverlap}}, \code{\link{dClust}}.
}
\examples{
# See the example in the Help-file for dClust
}

