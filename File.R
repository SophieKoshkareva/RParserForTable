File <- setClass("File",
  slots = c(path_in = "character",
            table_in = "data.frame",
            path_out = "character",
            table_out = "data.frame")
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
    
    return(theObject)
  }
)
