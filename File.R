setOldClass("file")
File <- setClass("File",
  contains = "file",
  slots = c(path_in = "character",
            table_in = "data.frame",
            path_out = "character",
            path_report = "file",
            table_out = "data.frame",
            sheet_name = "character",
            wb = "jobjRef",
            sheet = "jobjRef",
            row_header = "numeric", 
            row_table_legend = "numeric"),
  prototype = list(row_header = 1,
                   row_table_legend = 1)
)

setGeneric(name = "Open", 
  def = function(theObject)
  {
    standardGeneric("Open")
  }
)

setMethod(f = "Open",
  signature = "File",
  definition = function(theObject)
  { 
    #theObject@path_in <- "D:/Diploma/r_project/data_CABG_PCI_2.csv"
    theObject@path_in <- "D:/Diploma/r_project/data_GABR_PCI ред..csv"
    theObject@table_in <- read.csv2(theObject@path_in,
                                 na.strings = c("", "NA"),
                                 sep = ";",
                                 dec = ",",
                                 stringsAsFactors = FALSE,
                                 check.names = FALSE)
    
    theObject@path_out <- "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx"
    theObject@table_out <- theObject@table_in
    theObject@sheet_name <- "data_CABG_PCI_2"
    
    file_report_name <- paste("D:/Diploma/r_project/", "Report_", format(Sys.time(), "%Y_%m_%d"), ".txt", sep = "")
    theObject@path_report <- file(description = file_report_name, open ="w")
    return(theObject)
  }
)

setGeneric(name = "CreateExcelWB", 
           def = function(theObject)
           {
             standardGeneric("CreateExcelWB")
           }
)

setMethod(f = "CreateExcelWB",
  signature = "File",
  definition = function(theObject)
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
                 startRow = 2,
                 startColumn = 1,
                 colnamesStyle = TABLE_COLNAMES_STYLE)
    return(theObject)
  }
)

setGeneric(name = "SaveExcelWB", 
  def = function(theObject)
  {
    standardGeneric("SaveExcelWB")
  }
)
setMethod(f = "SaveExcelWB",
  signature = "File",
  definition = function(theObject)
  {
    autoSizeColumn(theObject@sheet, colIndex = c(1:ncol(theObject@table_out)))
    #createFreezePane(theObject@sheet, rowSplit = 2, colSplit = 2, startRow = 1, startColumn = 1)
    saveWorkbook(theObject@wb, theObject@path_out )
    print("New workbook was created")
    close(theObject@path_report)
    return(theObject)
  }
)