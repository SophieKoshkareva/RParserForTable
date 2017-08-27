MissingValue <- setClass("MissingValue",
  contains = "Error" 
)

setMethod(f = "initialize",
  signature = "MissingValue",
  definition = function(.Object)
  { 
    .Object@title <- c("Пропущенные значения")
    .Object@col_index_legend <- 1
    .Object@style <- c("missing_value")
    # .Object@style <- CellStyle(file@wb) +
    # Font(file@wb, isItalic = TRUE) +
    # Fill(foregroundColor = "lightgray") +
    # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    return(.Object)
  }
)

# setGeneric(name = "FindMissingValue",
#   def = function(theObject, table, column_index)
#   { 
#     standardGeneric("FindMissingValue")
#   }
# )
# 
# setMethod(f = "FindMissingValue",
#   signature = "MissingValue",
#   definition = function(theObject, table, column_index)
#   { 
#     mis_row_index <- 0
#     mis_row_index <- which(is.na(table[[column_index]]))
#     print(mis_row_index)
#     if (is.null(mis_row_index) == TRUE) {
#       print("No missing values")
#     # xlsx.createBook(x, sheet_out_name, file_out)
#     } else {
#       mis_row_index <- mis_row_index + theObject@row_header + theObject@row_symbol
#       theObject@indices <- append(theObject@indices, values = paste(mis_row_index, column_index, sep = "."))
#     }
#     return(theObject)
#   }
# )