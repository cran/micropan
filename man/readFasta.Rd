%% $Id: readFasta.Rd 189 2014-09-06 08:22:07Z larssn $

\name{readFasta and writeFasta}
\alias{readFasta}
\alias{writeFasta}

\title{
	Read and write biological sequence files.
}
\description{
	Reads and writes biological sequences (DNA, RNA, protein) in the commonly used FASTA format. 
}
\usage{
readFasta(in.file)
writeFasta(fdta,out.file,width=80)
}
\arguments{
  \item{in.file}{url/directory/name of FASTA file to read.}
  \item{fdta}{A \samp{Fasta} object with the columns \samp{Header} and \samp{Sequence}, see \sQuote{Details} below.}
  \item{out.file}{Name of FASTA-file to create.}
  \item{width}{Number of characters per line in the FASTA format.}
}
\details{
  These functions handle input/output of sequences in the commonly used FASTA format. The sequences are stored in a \code{Fasta} object. This is a small (S3) extension of a \code{data.frame} containing two text-columns named \samp{Header} and \samp{Sequence}. If other columns are present, these will be ignored by \code{\link{writeFasta}}.

  The \code{Fasta} object can be treated as a \code{data.frame}, but the generic functions \code{\link{plot.Fasta}}, \code{\link{summary.Fasta}} and \code{\link{str.Fasta}} are defined. The \code{data.frame} property makes it straightforward to manipulate all headers or all sequences, or to extract or delete entries (rows), or to merge several data sets using \code{\link{rbind}}.
}
\value{
  \code{\link{readFasta}} returns a \code{Fasta} object with the contents of the FASTA file. This is a small extension to a \code{data.frame} and contains two columns of text. The first, named \samp{Header}, contains the headerlines and the second, named \samp{Sequence}, contains the sequences.
  
  \code{\link{writeFasta}} produces a FASTA file.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}
\seealso{
  \code{\link{plot.Fasta}}, \code{\link{summary.Fasta}}, \code{\link{str.Fasta}}.
}

\examples{
# Reading a FASTA-file from the package extdata/ folder
# We need to uncompress it first...
extdata.path <- file.path(path.package("micropan"),"extdata")
filenames <- "Mpneumoniae_309_protein.fsa"
pth <- lapply( file.path( extdata.path, paste( filenames, ".xz", sep="" ) ), xzuncompress )

# Reading the file...
fdta <- readFasta(in.file=file.path(extdata.path,filenames))

# ...and compressing it again
pth <- lapply( file.path( extdata.path, filenames ), xzcompress )

# Plotting and printing the Fasta object
plot(fdta)
summary(fdta)
str(fdta)

# Writing the Fasta object to a new file
writeFasta(fdta,out.file="Delete_me.fsa")
}
\keyword{ sequence }
\keyword{ FASTA }
