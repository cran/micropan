%% $Id: hmmerScan.Rd 189 2014-09-06 08:22:07Z larssn $

\name{hmmerScan}
\alias{hmmerScan}
\title{
  Scanning a profile Hidden Markov Model database
}
\description{
  Scanning FASTA formatted protein files against a database of pHMMs using the HMMER3 software.
}
\usage{
hmmerScan(in.files,db,out.folder,verbose=TRUE)
}
\arguments{
  \item{in.files}{A character vector of file names.}
  \item{db}{The full name of the database to scan.}
  \item{out.folder}{The name of the folder to put the result files.}
  \item{verbose}{Logical indicating if textual output should be given to monitor the progress.}
}
\details{
  The HMMER3 software is purpose-made for handling profile Hidden Markov Models (pHMM) describing patterns in biological sequences (Eddy, 2008). This function will make calls to the HMMER3 software to scan FASTA files of proteins against a pHMM database. 

  The files named in \samp{in.files} must contain FASTA formatted protein sequences. These files should be prepared by \code{\link{panPrep}} to make certain each sequence, as well as the file name, has a GID-tag identifying their genome. The database named in \samp{db} must be a HMMER3 formatted database. It is typically the Pfam-A database, but you can also make your own HMMER3 databases, see the HMMER3 documentation for help.

  \code{\link{hmmerScan}} will query every input file against the named database. The database contains profile Hidden Markov Models describing position specific sequence patterns. Each sequence in every input file is scanned to see if some of the patterns can be matched to some degree. Each input file results in an output file with the same GID-tag in the name. The result files give tabular output, and are plain text files. See \code{\link{readHmmer}} for how to read the results into R.

  Scanning large databases like Pfam-A takes time, usually several minutes per genome. The scan is set up to use only 1 cpu per scan. To increase speed, start this function from mutliple R-sessions (Console windows). This function will not overwrite an existing result file, and multiple parallel sessions can write results to the same folder.
}
\value{
  This function produces files in the folder specified by \samp{out.folder}. Existing files are never overwritten by \code{\link{hmmerScan}}, if you want to re-compute something, delete the corresponding result files first.
}
\references{
  Eddy, S.R. (2008). A Probabilistic Model of Local Sequence Alignment That Simplifies Statistical Significance Estimation. PLoS Computational Biology, 4(5).
}
\note{
  The HMMER3 software must be installed on the system for this function to work, i.e. the command \samp{hmmscan} must be recognized as a valid command if you run it in a terminal window.
}
\author{
  Lars Snipen and Kristian Hovde Liland.
}

\seealso{
  \code{\link{panPrep}}, \code{\link{readHmmer}}.
}
\examples{
\dontrun{
	# Using a FASTA file in the micropan package
  # We need to uncompress it first...
	extdata.path <- file.path(path.package("micropan"),"extdata")
	filenames <- "Mpneumoniae_309_GID2.fsa"
  pth <- lapply( file.path( extdata.path, paste( filenames, ".xz", sep="" ) ), xzuncompress )
	
  # Using a miniature pHMM database in the micropan package
  # We need to uncompress its datafiles first...
  db <- "microfam0.hmm"
  pth <- lapply( file.path( extdata.path,
          paste( db, c(".h3f.xz",".h3i.xz",".h3m.xz",".h3p.xz"), sep="" ) ), xzuncompress )
	
  # ...and scanning the FASTA-file against microfam0...
	hmmerScan(in.files=file.path(extdata.path,filenames), 
		db=file.path(extdata.path,db),out.folder=".")
  
  # ...and compressing all files again...
  pth <- lapply( file.path( extdata.path, filenames ), xzcompress )
  pth <- lapply( file.path( extdata.path,
      paste( db, c(".h3f",".h3i",".h3m",".h3p"), sep="" ) ), xzcompress )
}
}

