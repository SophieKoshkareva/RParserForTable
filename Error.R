Error <- setClass("Error",
  slots = c(indices = "character",
            style = "character",
            title = "character",
            col_index_legend = "numeric")
)

setGeneric(name = "SetColor",
  def = function(theObject, file)
  {
    standardGeneric("SetColor")
  }
)

setMethod(f = "SetColor",
  signature = "Error",
  definition = function(theObject, file)
  { 
    print("Coloring...")
    
    MISSING_VALUE_STYLE <- CellStyle(file@wb) +
      Font(file@wb, isItalic = TRUE) +
      Fill(foregroundColor = "gray70") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    MISPRINT_STYLE <- CellStyle(file@wb) +
      Font(file@wb, isItalic = TRUE) +
      Fill(foregroundColor = "gold1") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    UNSOLVED_MISPRINT_STYLE <- CellStyle(file@wb) +
      Font(file@wb, isItalic = TRUE) +
      Fill(foregroundColor = "darkorange") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    OUTLIERS_STYLE <- CellStyle(file@wb) +
      Font(file@wb, isItalic = TRUE) +
      Fill(foregroundColor = "firebrick1") +
      Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    
    style <- switch(theObject@style,
                    "missing_value"= MISSING_VALUE_STYLE,
                    "misprint"= MISPRINT_STYLE,
                    "unsolved_misprint"= UNSOLVED_MISPRINT_STYLE,
                    "outlier"= OUTLIERS_STYLE)
    # errorFont <- Font(file@wb, theObject@style["Font"])
    # errorFill <- Fill(theObject@style["Fill"])
    # errorBorder <- Border(theObject@style["Border"])
    # errorStyle <- CellStyle(file@wb, font = errorFont, fill = errorFill, border = errorBorder)
    rows <- getRows(file@sheet, rowIndex = 1:nrow(file@table_out) + file@row_header + file@row_table_legend)
    cells <- getCells(rows, colIndex = 1:ncol(file@table_out))
    lapply(names(cells[theObject@indices]), function(i) setCellStyle(cells[[i]], style))
    AddTableLegend(theObject, style, file)
    return(file)
  }
)

setGeneric(name = "AddTableLegend",
  def = function(theObject, style, file)
  {
    standardGeneric("AddTableLegend")
  }
)

setMethod(f = "AddTableLegend",
  signature = "Error",
  definition = function(theObject, style, file)
  {
    rows <- getRows(file@sheet,rowIndex = 1)
    sheetTitle <- createCell(rows, theObject@col_index_legend)
    setCellValue(sheetTitle[[1,1]], theObject@title)
    setCellStyle(sheetTitle[[1,1]], style)
    return(theObject)
  }
)
