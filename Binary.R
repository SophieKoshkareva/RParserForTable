TiaAdcc <- setClass("Binary", 
                    contains = "Column"
)

setMethod(f = "initialize",
          signature = "Binary",
          definition = function(.Object)
          { 
            
            .Object@value[["Zero"]] <- list(0)
            .Object@value[["First"]]<- list(1)
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
          signature = "Binary",
          definition = function(theObject)
          { 
            FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
          }
)