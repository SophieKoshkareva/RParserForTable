FileIn <- setClass("FileIn",
  slots = c(table_in = "data.frame"),
  contains = "File"
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
    theObject@path_in = "D:/Diploma/r_project/data_GABR_PCI ред..csv"
    theObject@table_in <- read.csv2(theObject@path_in,
                                    na.strings = c("", "NA"),
                                    sep = ";",
                                    dec = ",",
                                    stringsAsFactors = FALSE,
                                    check.names = FALSE)
    
    #theObject@table_out <- theObject@table_in
    return(theObject)
  }
)
