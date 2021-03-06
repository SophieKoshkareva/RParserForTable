Dates  <- setClass("Dates", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject, myfile_in, myfile_out, myfile_report, misprints, missing_values, unsolved_misprints)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Dates",
  definition = function(theObject, myfile_in, myfile_out, myfile_report, misprints, missing_values, unsolved_misprints)
  { 
    output_list <- FindMisprints(misprints, missing_values, unsolved_misprints, myfile_in, myfile_out, myfile_report, theObject)
    return(output_list)
  }
)