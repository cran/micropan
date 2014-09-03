%% $Id: reverseComplement.Rd 116 2013-06-21 08:22:04Z larssn $

\name{reverseComplement}
\alias{reverseComplement}
\title{
	Reverse-complement of a DNA or RNA sequence
}
\description{
	Translates any base U to T and finds the reverse-complement to the
supplied DNA or RNA sequences.
}
\usage{
reverseComplement(nuc.strings)
}
\arguments{
  \item{nuc.strings}{character vector containing DNA or RNA sequences.}
}
\details{
	Standard reverse-complementation of DNA or RNA sequences. Any alien symbol (not \samp{A}, \samp{C}, \samp{G}, \samp{U} or \samp{T}) is replaced by \samp{X}. The complement of \samp{X} is also \samp{X}. All reverse-complemented sequences are in upper-case letters.
}
\value{
	Returns a character vector containing the reverse-complemented (DNA) sequences.
}
\author{
	Kristian Hovde Liland and Lars Snipen
}

\seealso{
	\code{\link{translate}}
}
\examples{
dna<-"ATGGGTCTGAACTGCTGGACTAAATGA"
reverseComplement(dna)
}
\keyword{ DNA }
\keyword{ RNA }
