PeakPressureGradientRepeat <- setClass("PeakPressureGradientRepeat", 
                contains = "Column"
)

setMethod(f = "initialize",
          signature = "PeakPressureGradientRepeat",
          definition = function(.Object)
          { 
            .Object@column_index <- 27
            return(.Object)
          }
)

setGeneric(name = "FindErrors", 
           def = function(theObject)
           {
             standardGeneric("FindErrors")
           }
)

setMethod(f = "FindErrors",
          signature = "PeakPressureGradientRepeat",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprintsForNumeric(misprint, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
            FindOutliers(outlier, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
          }
)