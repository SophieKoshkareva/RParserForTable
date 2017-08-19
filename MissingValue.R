MissingValue <- setClass("MissingValue",
                         contains = "Error" 
)

setMethod(f = "initialize",
          signature = "MissingValue",
          definition = function(.Object)
          { .Object@style <- "lightgray"
            # .Object@style <- CellStyle(wb) +
            # Font(wb, isItalic = TRUE) +
            # Fill(foregroundColor = "lightgray") +
            # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
          return(.Object)
          }
)

setGeneric(name = "FindMissingValue",
                               def = function(theObject, table, column_index)
                               { 
                                 standardGeneric("FindMissingValue")
                                }
)

setMethod(f = "FindMissingValue",
          signature = "MissingValue",
          definition = function(theObject, table, column_index)
          { mis_row_ind <- 0
            mis_row_ind <- which(is.na(table[column_index]))
            if (is.null(mis_row_ind) == TRUE) {
              print("No missing values")
            # xlsx.createBook(x, sheet_out_name, file_out)
            } else {
              mis_row_ind <- mis_row_ind + theObject@row_header + theObject@row_symbol
              theObject@ind <- append(theObject@ind, values = outer(mis_row_ind, column_index, paste, sep = "."))
            }
            return(theObject)
          }
)