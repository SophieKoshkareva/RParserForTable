Continuous  <- setClass("Continuous", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject, myfile_in, myfile_out, myfile_report, misprints, missing_values, unsolved_misprints, outliers)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Continuous",
  definition = function(theObject, myfile_in, myfile_out, myfile_report, misprints, missing_values, unsolved_misprints, outliers)
  { 
    output_list <- FindMisprints(misprints, missing_values, unsolved_misprints, myfile_in, myfile_out, myfile_report, theObject)
    outliers <- FindOutliers(outliers, output_list$file, myfile_report, theObject, output_list$unsolved_number)
    output_list <- c(output_list, "outliers" = outliers)
    return(output_list)
  }
)