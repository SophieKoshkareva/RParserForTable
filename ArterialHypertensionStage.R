ArterialHypertensionStage <- setClass("ArterialHypertensionStage", 
                      contains = "Column"
)

setMethod(f = "initialize",
          signature = "ArterialHypertensionStage",
          definition = function(.Object)
          { 
            
            .Object@value[["ArterialHypertensionStage"]] <- list(0, 1, 2, 3)
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
          signature = "ArterialHypertensionStage",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
            
          }
)