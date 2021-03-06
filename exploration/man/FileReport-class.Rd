% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FileReport.R
\docType{class}
\name{FileReport-class}
\alias{FileReport-class}
\alias{FileReport}
\title{Read row table from .csv-file and create new data.frame as object FileIn slot file_in .}
\arguments{
\item{theObject}{A FileIn object.}
}
\value{
data.frame \code{x}.
}
\description{
Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
}
\examples{
myfile <- new("FileIn")
myfile <- setFilePath(myfile, "D:/data.csv")
myfile <- ReadFileIn(myfile)
}
