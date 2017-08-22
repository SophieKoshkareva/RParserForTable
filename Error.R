Error <- setClass("Error",
  slots = c(indices = "character",
            style = "character",
            row_header = "numeric", 
            row_symbol = "numeric"),
  prototype = list(
              row_header = 1,
              row_symbol = 1)
)

setGeneric(name = "SetColor",
  def = function(theObject)
  {
    standardGeneric("SetColor")
  }
)

setMethod(f = "SetColor",
  signature = "Error",
  definition = function(theObject)
  {
    print("Coloring...")
  }
)