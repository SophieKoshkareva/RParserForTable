Error <- setClass("Error",
  slots = c(indices = "character",
            style = "list",
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
    errorFont <- Font(theObject@style["Font"])
    errorFill <- Fill(theObject@style["Fill"])
    errorBorder <- Border(theObject@style["Border"])
    errorStyle <- CellStyle(file@wb, Font = errorFont, Fill = errorFill, Border = errorBorder)
    rows <- getRows(file@sheet, rowIndex = 1:nrow(file@table_out) + file@row_header + file@row_symbol)
    cells <- getCells(rows, colIndex = 1:ncol(file@table_out))
    lapply(names(cells[theObject@indices]), function(i) setCellStyle(cells[[i]], errorStyle))
    AddTableLegend(theObject, file)
  }
)

setGeneric(name = "AddTableLegend",
  def = function(theObject, file)
  {
    standardGeneric("AddTableLegend")
  }
)

setMethod(f = "AddTableLegend",
  signature = "Error",
  definition = function(theObject, file)
  {
    rows <- getRows(file@sheet,rowIndex = 1)
    sheetTitle <- createCell(rows, theObject@col_index_legend)
    setCellValue(sheetTitle[[1,1]], theObject@title)
    setCellStyle(sheetTitle[[1,1]], theObject@style)
  }
)
