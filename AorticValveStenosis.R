AorticValveStenosis <- setClass("AorticValveStenosis", 
                                    contains = "Column"
)

setMethod(f = "initialize",
          signature = "AorticValveStenosis",
          definition = function(.Object)
          { 
            .Object@column_index <- 16
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
          signature = "AorticValveStenosis",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprintsForNumeric(misprint, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
            FindOutliers(outlier, file@table_in, theObject@column_index, file@row_header, file@row_table_legend)
          }
)