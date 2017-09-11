AveragePressureGradientRepeat <- setClass("AveragePressureGradientRepeat", 
                contains = "Column"
)

# setMethod(f = "initialize",
#           signature = "AveragePressureGradientRepeat",
#           definition = function(.Object)
#           { 
#             .Object@column_index <- 28
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
          signature = "AveragePressureGradientRepeat",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprintsForNumeric(misprint, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
            FindOutliers(outlier, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
          }
)