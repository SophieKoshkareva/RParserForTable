#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
Error <- setClass("Error",
  slots = c(indices = "character",
            style = "character",
            title = "character",
            col_index_legend = "numeric")
)

setGeneric(name = "SetColor",
  def = function(theObject, myfile_out)
  {
    standardGeneric("SetColor")
  }
)
setMethod(f = "SetColor",
  signature = "Error",
  definition = function(theObject, myfile_out)
  {
    #!!!!!!!!!!!!!!
    cat(sprintf("Attention! The painting of the %s is in progress, please wait.", tolower(class(theObject)[1])))

    MISSING_VALUE_STYLE <- CellStyle(myfile_out@wb) +
      Font(myfile_out@wb, isItalic = TRUE) +
      Fill(foregroundColor = "gray70") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    MISPRINT_STYLE <- CellStyle(myfile_out@wb) +
      Font(myfile_out@wb, isItalic = TRUE) +
      Fill(foregroundColor = "gold1") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    UNSOLVED_MISPRINT_STYLE <- CellStyle(myfile_out@wb) +
      Font(myfile_out@wb, isItalic = TRUE) +
      Fill(foregroundColor = "darkorange") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    OUTLIERS_STYLE <- CellStyle(myfile_out@wb) +
      Font(myfile_out@wb, isItalic = TRUE) +
      Fill(foregroundColor = "firebrick1") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    DATE_MISPRINT_STYLE <- CellStyle(myfile_out@wb) +
      Font(myfile_out@wb, isItalic = TRUE) +
      Fill(foregroundColor = "lightpink4") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))

    style <- switch(theObject@style,
                    "missing_value"= MISSING_VALUE_STYLE,
                    "misprint"= MISPRINT_STYLE,
                    "unsolved_misprint"= UNSOLVED_MISPRINT_STYLE,
                    "outlier"= OUTLIERS_STYLE,
                    "dateMisprint" = DATE_MISPRINT_STYLE)

    rows <- getRows(myfile_out@sheet, rowIndex = 1:nrow(myfile_out@table_out) + myfile_out@row_header + myfile_out@row_table_legend)
    cells <- getCells(rows, colIndex = 1:ncol(myfile_out@table_out))
    lapply(names(cells[theObject@indices]), function(i) setCellStyle(cells[[i]], style))
    AddTableLegend(theObject, myfile_out, style)
    #return(myfile_out)
  }
)

setGeneric(name = "AddTableLegend",
  def = function(theObject, myfile_out, style)
  {
    standardGeneric("AddTableLegend")
  }
)
setMethod(f = "AddTableLegend",
  signature = "Error",
  definition = function(theObject, myfile_out, style)
  {
    rows <- getRows(myfile_out@sheet,rowIndex = 1)
    sheetTitle <- createCell(rows, theObject@col_index_legend)
    setCellValue(sheetTitle[[1,1]], theObject@title)
    setCellStyle(sheetTitle[[1,1]], style)
    #return(theObject)
  }
)

setGeneric(name = "PrintReport",
  def = function(theObject, myfile_report, row_index, col_index)
  {
    standardGeneric("PrintReport")
  }
)
setMethod(f = "PrintReport",
  signature = "Error",
  definition = function(theObject, myfile_report, row_index, col_index)
  {
    cat(c(class(theObject)[1], "in", "row", row_index, "column", col_index, "\n"), file = myfile_report@file, append = T)
    #cat("It is impossible to determine outliers, there are  unsolved misprints in the column ", col_index, "\n")
  }
)
