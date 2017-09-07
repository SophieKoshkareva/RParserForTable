TiaAdcc <- setClass("TiaAdcc", 
                    contains = "Column"
)

setMethod(f = "initialize",
          signature = "TiaAdcc",
          definition = function(.Object)
          { 
            
            .Object@value[["TiaAdcc"]] <- list(0, 1)
            .Object@column_index <- 7
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
          signature = "TiaAdcc",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
            
          }
)