#' Read raw value from .csv-file and create new object class FileIn.
#'
#' @slot table_in a data.frame to loaded data.
#' @return an object class FileIn \code{theObject}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
#' @include File.R

FileIn <- setClass("FileIn",
  slots = c(table_in = "data.frame"),
  contains = "File"
)

setGeneric(name = "ReadFileIn",
  def = function(theObject)
  {
   standardGeneric("ReadFileIn")
  }
)
setMethod(f = "ReadFileIn",
  signature = "FileIn",
  definition = function(theObject)
  {
    theObject@table_in <- read.csv2(theObject@path,
                                    na.strings = c("", "NA"),
                                    sep = ";",
                                    dec = ",",
                                    stringsAsFactors = FALSE,
                                    check.names = FALSE)

    return(theObject)
  }
)
