#' An S4 class to represent an any file.
#'
#' @slot path A character vector
#' @return The object of class File
#' @examples
#' myfile <- new("File")
File <- setClass("File",
  slots = c(path = "character")
)

setGeneric(name = "getFilePath",
  def = function(theObject)
  {
    standardGeneric("getFilePath")
  }
)
setMethod(f = "getFilePath",
  signature = "File",
  definition = function(theObject)
  {
    return(theObject@path)
  }
)

setGeneric(name = "setFilePath",
  def = function(theObject, new_path)
  {
    standardGeneric("setFilePath")
  }
)
setMethod(f = "setFilePath",
  signature = "File",
  definition = function(theObject, new_path)
  {
    theObject@path <- new_path
    return(theObject)
  }
)
