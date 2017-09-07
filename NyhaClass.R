NyhaClass <- setClass("NyhaClass", 
                contains = "Column"
)

setMethod(f = "initialize",
          signature = "NyhaClass",
          definition = function(.Object)
          { 
            
            .Object@value[["NyhaClass"]] <- list(1, 2, 3, 4)
            .Object@column_index <- 6
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
          signature = "NyhaClass",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
            
          }
)