#' @include File.R
#'An S4 class to read raw table from .csv-file and create new data.frame.
#'
#' @slot table_in A a data.frame to represent csv-table/
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
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
