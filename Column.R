Column <- setClass("Column",
  slots = c(
  key = "list",
  value = "list",
  column_index = "numeric")
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

setGeneric(name = "getValue",
  def = function(theObject)
  {
    standardGeneric("getValue")
  }
)

setMethod(f = "getValue",
  signature = "Column",
  definition = function(theObject)
  {
    return(theObject@value)
  }
)
setGeneric(name = "setValue",
  def = function(theObject, newValue, add = FALSE)
  {
    standardGeneric("setValue")
  }
)

setMethod(f = "setValue",
  signature = "Column",
  definition = function(theObject, newValue, add = FALSE)
  {
    if(add)
    {
      theObject@value <- c(theObject@value, newValue)
    }else
    {
      theObject@value <- as.list(newValue)
    }
      return(theObject)
  }
)

setGeneric(name = "setKey",
  def = function(theObject, newKey, add = FALSE)
  {
    standardGeneric("setKey")
  }
)
  
  setMethod(f = "setKey",
  signature = "Column",
  definition = function(theObject, newKey, add = FALSE)
  {
    # if(add)
    # {
    #   theObject@key[[i]] <- c(theObject@value, newKey)
    # }else
    # {
    #   theObject@key <- as.list(newKey)
    # }
    return(theObject)
  }
)