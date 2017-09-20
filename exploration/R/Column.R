#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
Column <- setClass("Column",
  slots = c(column_index = "numeric")
)

setGeneric(name = "getColumnIndex",
  def = function(theObject)
  {
    standardGeneric("getColumnIndex")
  }
)
setMethod(f = "getColumnIndex",
  signature = "Column",
  definition = function(theObject)
  {
    return(theObject@column_index)
  }
)

setGeneric(name = "setColumnIndex",
  def = function(theObject, index_value)
  {
    standardGeneric("setColumnIndex")
  }
)
setMethod(f = "setColumnIndex",
  signature = "Column",
  definition = function(theObject, index_value)
  {
    theObject@column_index <- index_value
    return(theObject)
  }
)
