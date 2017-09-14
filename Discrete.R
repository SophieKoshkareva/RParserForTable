Discrete <- setClass("Discrete", 
  contains = "Column"
)
 
setGeneric(name = "FindErrors", 
  def = function(theObject, myfile, misprints)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Discrete",
  definition = function(theObject, myfile, misprints)
  { 
    FindMisprints(misprints, myfile, theObject)
  }
)