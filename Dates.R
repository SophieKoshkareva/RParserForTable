Dates  <- setClass("Dates", 
  contains = "Column"
)

setGeneric(name = "FindErrors", 
  def = function(theObject)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Dates",
  definition = function(theObject)
  { 
    FindMisprintsForDates(misprint, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
  }
)