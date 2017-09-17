Dates  <- setClass("Dates", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject, myfile, misprints, missing_values, unsolved_misprints)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Dates",
  definition = function(theObject, myfile, misprints, missing_values, unsolved_misprints)
  { 
    output_list <- FindMisprints(misprints, missing_values, unsolved_misprints, myfile, theObject)
    return(output_list)
  }
)