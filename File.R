File <- setClass("File",
  slots = c(path_in = "character",
            table_in = "data.frame",
            path_out = "character",
            table_out = "data.frame",
            sheet_name = "character",
            wb = "jobjRef",
            sheet = "jobjRef")
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
    theObject@path_out <- "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx"
    theObject@table_in <- read.csv2(theObject@path_in,
                                 na.strings = c("", "NA"),
                                 sep = ";",
                                 dec = ",",
                                 stringsAsFactors = FALSE,
                                 check.names = FALSE)
    theObject@table_out <- theObject@table_in
    theObject@sheet_name <- "data_CABG_PCI_2"
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
    addDataFrame(theObject@table_out, theObject@sheet,  row.names = FALSE, startRow = 2, startColumn = 1)
    rows <- getRows(theObject@sheet, rowIndex = 1:nrow(theObject@table_out) + row_header + row_symbol)
    cells <- getCells(rows, colIndex = 1:ncol(theObject@table_out))

    return(theObject)
  }
)