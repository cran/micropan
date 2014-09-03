\name{xzcompress}
\alias{xzcompress}
\alias{xzuncompress}

\title{xz (un)compress a file}

\usage{
 xzcompress(filename, destname=sprintf("\%s.xz", filename), temporary=FALSE, skip=FALSE,
  overwrite=FALSE, remove=TRUE, BFR.SIZE=1e+07, compression=6, ...)
 xzuncompress(filename, destname=gsub("[.]xz$", "", filename, ignore.case = TRUE),
  temporary=FALSE, skip=FALSE, overwrite=FALSE, remove=TRUE, BFR.SIZE=1e+07, ...)
}

\description{
 xz (un)compress a file
}

\arguments{
 \item{filename}{Pathname of input file.}
 \item{destname}{Pathname of output file.}
 \item{temporary}{If \code{\link[base:logical]{TRUE}}, the output file is created in a
   temporary directory.}
 \item{skip}{If \code{\link[base:logical]{TRUE}} and the output file already exists,
   the output file is returned as is.}
 \item{overwrite}{If \code{\link[base:logical]{TRUE}} and the output file already exists,
   the file is silently overwritting, otherwise an exception is
   thrown (unless \code{skip} is \code{\link[base:logical]{TRUE}}).}
 \item{remove}{If \code{\link[base:logical]{TRUE}}, the input file is removed afterward,
   otherwise not.}
 \item{BFR.SIZE}{The number of bytes read in each chunk.}
 \item{compression}{The compression level used (1-9).}
  \item{...}{Not used.}
}

\value{
  Returns the pathname of the output file.
  The number of bytes processed is returned as an attribute.
}

\details{
  These functions are adapted from the \code{R.utils} package from gzip to xz.
  Internally \code{xzfile()} (see \code{\link[base]{connections}}) is used to
  read (write) chunks to (from) the xz file.
  If the process is interrupted before completed, the partially written
  output file is automatically removed.
}

\examples{
  cat(file="foo.txt", "Hello world!")

  xzcompress("foo.txt")
  print(file.info("foo.txt.xz"))

  xzuncompress("foo.txt.xz")
  print(file.info("foo.txt"))

  file.remove("foo.txt")
}

\author{Kristian Hovde Liland}



\keyword{file}
\keyword{programming}
