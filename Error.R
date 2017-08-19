Error <- setClass("Error",
                  slots = c(ind = "character",
                            style = "character")
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