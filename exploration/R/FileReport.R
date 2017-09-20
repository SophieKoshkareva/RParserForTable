setOldClass("file")
#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
#' @include File.R
FileReport <- setClass("FileReport",
  slots = c(file = "file"),
  contains = "File"
)

setGeneric(name = "setFileReportDirectory",
  def = function(theObject, new_directory)
  {
    standardGeneric("setFileReportDirectory")
  }
)
setMethod(f = "setFileReportDirectory",
  signature = "FileReport",
  definition = function(theObject, new_directory)
  {
    theObject@path <- paste(new_directory, "Report_", format(Sys.time(), "%Y_%m_%d"), ".txt", sep = "")
    return(theObject)
  }
)

setGeneric(name = "OpenFileReport",
  def = function(theObject)
  {
    standardGeneric("OpenFileReport")
  }
)
setMethod(f = "OpenFileReport",
  signature = "FileReport",
  definition = function(theObject)
  {
    theObject@file <- file(description = theObject@path, open = "w")
    return(theObject)
  }
)

setGeneric(name = "CloseFileReport",
  def = function(theObject)
  {
    standardGeneric("CloseFileReport")
  }
)
setMethod(f = "CloseFileReport",
  signature = "FileReport",
  definition = function(theObject)
  {
    on.exit(close(theObject@file))
    return(theObject)
  }
)
