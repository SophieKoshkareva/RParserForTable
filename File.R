setOldClass("file")
File <- setClass("File",
  contains = "file",
  slots = c(path_in = "character",
            table_in = "data.frame",
            path_out = "character",
            table_out = "data.frame",
            sheet_name = "character",
            wb = "jobjRef",
            sheet = "jobjRef",
            row_header = "numeric", 
            row_table_legend = "numeric",
            file_report_name = "character",
            path_report = "file"),
  prototype = list(row_header = 1,
                   row_table_legend = 1)
)

setGeneric(name = "getInputFilePath",
  def = function(theObject)
  {
    standardGeneric("getInputFilePath")
  }
)
setMethod(f = "getInputFilePath",
  signature = "File",
  definition = function(theObject)
  {
    return(theObject@path_in)
  }
)

setGeneric(name = "setInputFilePath",
  def = function(theObject, path_in)
  {
    standardGeneric("setInputFilePath")
  }
)
setMethod(f = "setInputFilePath",
  signature = "File",
  definition = function(theObject, path_in)
  {
    theObject@path_in <- path_in
    return(theObject)
  }
)

setGeneric(name = "getOutputFilePath",
  def = function(theObject)
  {
    standardGeneric("getOutputFilePath")
  }
)
setMethod(f = "getOutputFilePath",
  signature = "File",
  definition = function(theObject)
  {
    return(theObject@path_out)
  }
)

setGeneric(name = "setOutputFilePath",
  def = function(theObject, path_out)
  {
    standardGeneric("setOutputFilePath")
  }
)
setMethod(f = "setOutputFilePath",
  signature = "File",
  definition = function(theObject, path_out)
  {
    theObject@path_out <- path_out
    return(theObject)
  }
)

setGeneric(name = "getSheetOutputName",
  def = function(theObject)
  {
    standardGeneric("getSheetOutputName")
  }
)
setMethod(f = "getSheetOutputName",
  signature = "File",
  definition = function(theObject)
  {
    return(theObject@sheet_name)
  }
)

setGeneric(name = "setSheetOutputName",
  def = function(theObject, sheet_name)
  {
    standardGeneric("setSheetOutputName")
  }
)
setMethod(f = "setSheetOutputName",
  signature = "File",
  definition = function(theObject, sheet_name)
  {
    theObject@sheet_name <- sheet_name
    return(theObject)
  }
)

setGeneric(name = "getFileReportName",
  def = function(theObject)
  {
    standardGeneric("getFileReportName")
  }
)
setMethod(f = "getFileReportName",
  signature = "File",
  definition = function(theObject)
  {
    return(theObject@file_report_name)
  }
)

setGeneric(name = "setFileReportDirectory",
  def = function(theObject, directory)
  {
    standardGeneric("setFileReportDirectory")
  }
)
setMethod(f = "setFileReportDirectory",
  signature = "File",
  definition = function(theObject, directory)
  {
    theObject@file_report_name <- paste(directory, "Report_", format(Sys.time(), "%Y_%m_%d"), ".txt", sep = "")
    return(theObject)
  }
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
    #theObject@path_in <- "D:/Diploma/r_project/data_GABR_PCI ред1..csv"
    theObject@table_in <- read.csv2(theObject@path_in,
                                 na.strings = c("", "NA"),
                                 sep = ";",
                                 dec = ",",
                                 stringsAsFactors = FALSE,
                                 check.names = FALSE)
    
    #theObject@path_out <- "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx"
    theObject@table_out <- theObject@table_in
    #theObject@sheet_name <- "data_CABG_PCI_2"
    
    #file_report_name <- paste("D:/Diploma/r_project/", "Report_", format(Sys.time(), "%Y_%m_%d"), ".txt", sep = "")
    theObject@path_report <- file(description = theObject@file_report_name, open ="w")
    
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
    createFreezePane(theObject@sheet, rowSplit = 2, colSplit = 1, startRow = 1, startColumn = 1)
    saveWorkbook(theObject@wb, theObject@path_out )
    print("New workbook was created")
    on.exit(close(theObject@path_report))
    return(theObject)
  }
)

#setGeneric(name ="CreateTable")