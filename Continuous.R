Continuous  <- setClass("Continuous", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Continuous",
  definition = function(theObject)
  { 
    FindMisprintsForNumeric(misprint, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
    FindOutliers(outlier, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
  }
)