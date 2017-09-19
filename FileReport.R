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