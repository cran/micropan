%% $Id: gregexpr.Rd 153 2014-07-02 21:05:16Z khliland $

\name{gregexpr}
\alias{gregexpr}
\title{
	Extended \code{\link{gregexpr}} with substring retrieval
}
\description{
	An extension of the base function \code{\link{gregexpr}} enabling retrieval of the matching substrings.
}
\usage{
  gregexpr(pattern, text, ignore.case=FALSE, perl=FALSE,
	fixed=FALSE, useBytes=FALSE, extract=FALSE)
}
\arguments{
  \item{pattern}{character string containing a \link{regular expression} (or character string for \code{fixed = TRUE}) to be matched in the given character vector.  Coerced by \code{\link{as.character}} to a character string if possible.  If a character vector of length 2 or more is supplied, the first element is used with a warning.  Missing values are not allowed.}
  \item{text}{a character vector where matches are sought, or an object which can be coerced by \code{\link{as.character}} to a character vector.}
  \item{ignore.case}{if \code{FALSE}, the pattern matching is \emph{case sensitive} and if \code{TRUE}, case is ignored during matching.}
  \item{perl}{logical. Should perl-compatible regexps be used? Has priority over \code{extended}.}
  \item{fixed}{logical. If \code{TRUE}, \samp{pattern} is a string to be matched as is. Overrides all conflicting arguments.}
  \item{useBytes}{logical. If \code{TRUE} the matching is done byte-by-byte rather than character-by-character. See \code{base::gregexpr} for details.}
  \item{extract}{logical indicating if matching substrings should be extracted and returned.}
}
\details{
	Extended version of \code{\link{gregexpr}} that enables the return of the substrings matching the pattern. The last argument \samp{extract} is the only difference to \code{base::gregexpr}. The default behaviour is identical to \code{base::gregexpr}, but setting \code{extract=TRUE} means the matching substrings are returned.
}
\value{
	It will either return what the \code{base::gregexpr} would (\code{extract=FALSE}) or a \samp{list} of substrings matching the pattern (\code{extract=TRUE}). There is one \samp{list} element for each string in \samp{text}, and each list element contains a character vector of all matching substrings in the corresponding entry of \samp{text}.
}
\author{
	Lars Snipen and Kristian Liland
}

\seealso{
	\code{\link[base]{gregexpr}}
}
\examples{
  sequences<-c("ACATGTCATGTCC","CTTGTATGCTG")
  gregexpr("ATG",sequences,extract=TRUE)
}
\keyword{ gregexpr }
