FileOut <- setClass("FileOut",
  slots = c(table_out = "data.frame",
           sheet_out_name = "character",
           wb = "",
           sheet = ""),
  prototype = list(table_out = FileIn@table_in),
  contains = "File"
  )

setMethod(f = "initialize",
  signature = "FileOut",
  definition = function(theObject)
  { 
    .Object@path <- "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx"
    .Object@sheet_out_name <- "data_CABG_PCI_2"
    return(.Object)
  }
)


# wb <- createWorkbook(type = "xlsx")
# sheet <- createSheet(wb, sheetName)
# 
# 
# createRow(sheet, rowIndex = 1)
# addDataFrame(table, sheet,  row.names = FALSE, startRow = 2, startColumn = 1, colnamesStyle = TABLE_COLNAMES_STYLE)
# rows <- getRows(sheet, rowIndex = 1:nrow(table) + row_header + row_symbol)    
# cells <- getCells(rows, colIndex = 1:ncol(table)) 
# 
# autoSizeColumn(sheet, colIndex = c(1:ncol(table)))
# createFreezePane(sheet, rowSplit = 2, colSplit = 2, startRow = 1, startColumn = 1)
# saveWorkbook(wb, file)
# print("New workbook was created")