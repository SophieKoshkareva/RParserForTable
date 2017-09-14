Dates  <- setClass("Dates", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject, myfile, misprints)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Dates",
  definition = function(theObject, myfile, misprints)
  { 
    FindMisprints(misprints, myfile, theObject)
  }
)