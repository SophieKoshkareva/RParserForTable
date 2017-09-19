#' An S4 class to represent a file.
#'
#' @slot path A character vector to set full file path
#' @param theObject A File object.
#' @examples
#' myfile <- new("File")
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
