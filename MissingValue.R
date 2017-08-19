MissingValue <- setClass("MissingValue",
                         contains = "Error" 
)

setMethod(f = "initialize",
          signature = "MissingValue",
          definition = function(.Object)
          { .Object@style <- "gray"
            # .Object@style <- CellStyle(wb) +
            # Font(wb, isItalic = TRUE) +
            # Fill(foregroundColor = "lightgray") +
            # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
          return(.Object)
          }
)

setGeneric(name = "FindMissingValue",
                               def = function(theObject, data_table)
                               { 
                                 standardGeneric("FindMissingValue")
                                }
)

setMethod(f = "FindMissingValue",
                              signature = "MissingValue",
                              definition = function(theObject, data_table)
                              { 
                                mis_ind <- which(is.na(data_table), arr.ind = TRUE, useNames = FALSE)
                                if (is.null(mis_ind) == TRUE) {
                                  print("No missing values")
                                 # xlsx.createBook(x, sheet_out_name, file_out)
                                } else {
                                  mis_ind[,1] <- mis_ind[,1] + theObject@row_header + theObject@row_symbol
                                  theObject@ind <- apply(mis_ind, 1, paste, collapse = ".")
                                }
                                return(theObject)
                              }
)