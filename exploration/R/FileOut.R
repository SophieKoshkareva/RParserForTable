#' @include File.R
#' An S4 class to work with Excel workbook.
#'
#' @slot table_out A a data.frame to represent csv-table/
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileOut")
#' myfile <- setFilePath(myfile, "D:/data.xlsx")
#' myfile <- ReadFileIn(myfile)
FileOut <- setClass("FileOut",
  slots = c(table_out = "data.frame",
           sheet_name = "character",
           wb = "jobjRef",
           sheet = "jobjRef",
           row_header = "numeric",
           row_table_legend = "numeric"),
  contains = "File",
  prototype = list(row_header = 1,
                   row_table_legend = 1)
)

setGeneric(name = "setTableOut",
  def = function(theObject, myfile)
  {
    standardGeneric("setTableOut")
  }
)
setMethod(f = "setTableOut",
  signature = "FileOut",
  definition = function(theObject, myfile)
  {
    theObject@table_out <- myfile@table_in
    return(theObject)
  }
)

setGeneric(name = "getExcelSheetName",
  def = function(theObject)
  {
    standardGeneric("getExcelSheetName")
  }
)
setMethod(f = "getExcelSheetName",
  signature = "FileOut",
  definition = function(theObject)
  {
    return(theObject@sheet_name)
  }
)

setGeneric(name = "setExcelSheetName",
  def = function(theObject, new_sheet_name)
  {
    standardGeneric("setExcelSheetName")
  }
)
setMethod(f = "setExcelSheetName",
  signature = "FileOut",
  definition = function(theObject, new_sheet_name)
  {
    theObject@sheet_name <- new_sheet_name
    return(theObject)
  }
)

setGeneric(name = "CreateExcelWB",
  def = function(theObject, colnames = TRUE, startRow)
  {
    standardGeneric("CreateExcelWB")
  }
)
setMethod(f = "CreateExcelWB",
  signature = "FileOut",
  definition = function(theObject, colnames = TRUE, startRow)
  {
    theObject@wb <- createWorkbook(type = "xlsx")
    theObject@sheet <- createSheet(theObject@wb, theObject@sheet_name)
    createRow(theObject@sheet, rowIndex = 1)
    TABLE_COLNAMES_STYLE <- CellStyle(theObject@wb) +
                            Font(theObject@wb, isBold = TRUE) +
                            Alignment(wrapText = TRUE, horizontal = "ALIGN_CENTER") +
                            Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))

    addDataFrame(theObject@table_out,
                 theObject@sheet,
                 row.names = FALSE,
                 startRow = startRow,
                 startColumn = 1,
                 colnamesStyle = TABLE_COLNAMES_STYLE,
                 col.names = colnames)
    return(theObject)
  }
)

setGeneric(name = "SaveExcelWB",
  def = function(theObject, freeze = FALSE)
  {
    standardGeneric("SaveExcelWB")
  }
)
setMethod(f = "SaveExcelWB",
  signature = "FileOut",
  definition = function(theObject, freeze = FALSE)
  {
    autoSizeColumn(theObject@sheet, colIndex = c(1:ncol(theObject@table_out)))
    #!!!!!
    if (freeze) createFreezePane(theObject@sheet, rowSplit = 2, colSplit = 1, startRow = 1, startColumn = 1)
    saveWorkbook(theObject@wb, theObject@path)
    print("New workbook was created")
    return(theObject)
  }
)
