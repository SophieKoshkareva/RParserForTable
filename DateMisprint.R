DateMisprint <- setClass("DateMisprint",
                    contains = "Error" 
)

setMethod(f = "initialize",
  signature = "DateMisprint",
  definition = function(.Object)
  { 
    .Object@title <- c("Непоследовательные даты")
    .Object@col_index_legend <- 5
    .Object@style <- c("dateMisprint")
    return(.Object)
  }
)

setGeneric(name = "FindDateMisprints",
  def = function(theObject, date1, date2, myfile)
  { 
    standardGeneric("FindDateMisprints")
  }
)

setMethod(f = "FindDateMisprints",
  signature = "DateMisprint",
  definition = function(theObject, date1, date2, myfile)
  { 
    dateMisprints_row_ind <- c()
    columns <- sort(c(date1@column_index, date2@column_index))
    d1 <- as.Date(myfile@table_out[[columns[1]]], format = "%d.%m.%Y")
    d2 <- as.Date(myfile@table_out[[columns[2]]], format = "%d.%m.%Y")
    dateMisprints_row_ind <- append(dateMisprints_row_ind, which(d1 > d2))
    dateMisprints_row_ind <- dateMisprints_row_ind + myfile@row_header + myfile@row_table_legend
    theObject@indices <- append(theObject@indices, values = outer(dateMisprints_row_ind, columns, paste, sep = "."))
    lapply(dateMisprints_row_ind, function(i) PrintReport(theObject, file, i, columns[i]))
    cat("Outlier coordinates are ", paste(dateMisprints_row_ind, columns, sep = "."), "\n")
    return(theObject)
  }
)