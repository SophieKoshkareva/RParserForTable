Misprint <- setClass("Misprint",
                     contains = "Error" 
)


setMethod(f = "initialize",
          signature = "Misprint",
          definition = function(.Object)
          { .Object@style <- "yellow1"
            # .Object@style <- CellStyle(wb) +
            # Font(wb, isItalic = TRUE) +
            # Fill(foregroundColor = "yellow1") +
            # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
          return(.Object)
          }
)

setGeneric(name = "FindMisprints",
           def = function(theObject, data_table, dictionary_keys)
           { 
             standardGeneric("FindMisprints")
           }
)

setMethod(f = "FindMisprints",
          signature = "Misprint",
          definition = function(theObject, data_table, dictionary_keys)
          { 
            #for (i in 1:ncol(data_table)){
            misprint_row_ind <- which(data_table[2] %in% dictionary_keys, arr.ind = T, useNames = F)
            
            #misprint_row_ind <- which(data_table[[i]] %in% dictionary_keys, arr.ind = T, useNames = F)
            misprint_row_ind <- outliers_row_ind + theObject@row_header + theObject@row_symbol
            theObject@ind <- append(theObject@ind, values = outer(misprint_row_ind, i, paste, sep = "."))
            #}
            return(theObject)
          }
)