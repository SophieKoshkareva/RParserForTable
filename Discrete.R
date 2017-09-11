Discrete <- setClass("Discrete", 
  contains = "Column"
)
 
setGeneric(name = "FindErrors", 
  def = function(theObject)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Discrete",
  definition = function(theObject)
  { 
    FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
  }
)