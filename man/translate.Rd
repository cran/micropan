%% $Id: translate.Rd 153 2014-07-02 21:05:16Z khliland $

\name{translate}
\alias{translate}
\title{
	From nucleotides to proteins
}
\description{
	Translates nucleotide strings (DNA or RNA) into protein sequences.
}
\usage{
translate(nuc.strings, Mstart=TRUE)
}
\arguments{
  \item{nuc.strings}{character vector containing nucleotide strings.}
  \item{Mstart}{logical indicating if \code{V} and \code{L} nucleotides should be changed to \code{M}.}
}
\details{
  Translates nucleotide strings (DNA or RNA) into amino acid sequences
using the standard genetic code. A vector of sequences (strings) can be used as
input, and a corresponding vector of amino acid strings are returned. Stop
codons are translated into \samp{*}.

  Alien characters (not \samp{A}, \samp{C}, \samp{G}, \samp{U} or \samp{T}) will be tolerated in the third codon position in those cases where the third character is irrelevant for the translation. In all other cases, a codon containing an alien will be translated into \samp{X}.
}
\value{
	Returns a character vector containing the translated amino acid sequences.
}
\author{
	Kristian Hovde Liland and Lars Snipen.
}

\seealso{
	\code{\link{reverseComplement}}
}
\examples{
dna<-"ATGGGTCTGAACTGCTGGACTAAATGA"
translate(dna)
}
\keyword{ DNA }
\keyword{ RNA }
\keyword{ amino acid }
