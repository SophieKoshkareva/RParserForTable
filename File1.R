setOldClass("file")
File <- setClass("File",
  contains = "file",
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