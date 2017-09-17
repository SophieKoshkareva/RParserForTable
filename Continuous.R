Continuous  <- setClass("Continuous", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject, myfile, misprints, missing_values, unsolved_misprints, outliers)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Continuous",
  definition = function(theObject, myfile, misprints, missing_values, unsolved_misprints, outliers)
  { 
    output_list <- FindMisprints(misprints, missing_values, unsolved_misprints, myfile, theObject)
    outliers <- FindOutliers(outliers, output_list$file, theObject, output_list$unsolved_number)
    output_list <- c(output_list, "outliers" = outliers)
    return(output_list)
  }
)