File <- setClass("File",
                 slots = c(path_in = "character",
                           table = "data.frame")
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
            theObject@path_in <- "D:/Diploma/r_project/data_CABG_PCI_2.csv"
            theObject@table <- read.csv2(theObject@path_in,
                                         na.strings = c("", "NA"),
                                         stringsAsFactors = FALSE,
                                         check.names = FALSE)
            return(theObject)
          }
)
