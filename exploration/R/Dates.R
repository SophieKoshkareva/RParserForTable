#' @include Column.R
#' An S4 class to represent a file.
#'
#' @slot path A character vector to set full file path
#' @param theObject A File object.
#' @examples
#' myfile <- new("File")
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
