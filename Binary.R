Binary <- setClass("Binary", 
                    contains = "Column",
                    prototype = prototype (value = list("Zero" = list(0),
                                     "One" = list(1)))
                    
)

# setMethod(f = "initialize",
#           signature = "Binary",
#           definition = function(.Object)
#           { 
#             
#             .Object@value[["Zero"]] <- list(0)
#             .Object@value[["One"]]<- list(1)
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
          signature = "Binary",
          definition = function(theObject)
          { 
            FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
          }
)