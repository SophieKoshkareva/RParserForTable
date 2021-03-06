Age <- setClass("Age", 
                contains = "Column"
)

# setMethod(f = "initialize",
#           signature = "Age",
#           definition = function(.Object)
#           { 
#             
#             return(.Object)
#           }
# )

setGeneric(name = "FindErrors", 
           def = function(theObject)
           {
             standardGeneric("FindErrors")
           }
)

setMethod(f = "FindErrors",
          signature = "Age",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprintsForNumeric(misprint, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
            FindOutliers(outlier, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
          }
)