#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A DateMisprint object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
#' @include Error.R
DateMisprint <- setClass("DateMisprint",
                    contains = "Error"
)

setMethod(f = "initialize",
  signature = "DateMisprint",
  definition = function(.Object)
  {
    .Object@title <- c("?????????????????? ????")
    .Object@col_index_legend <- 5
    .Object@style <- c("dateMisprint")
    return(.Object)
  }
)

setGeneric(name = "FindDateMisprints",
  def = function(theObject, date1, date2, myfile_out, myfile_report)
  {
    standardGeneric("FindDateMisprints")
  }
)

setMethod(f = "FindDateMisprints",
  signature = "DateMisprint",
  definition = function(theObject, date1, date2, myfile_out, myfile_report)
  {
    dateMisprints_row_ind <- c()
    columns <- sort(c(date1@column_index, date2@column_index))
    d1 <- as.Date(myfile_out@table_out[[columns[1]]], format = "%d.%m.%Y")
    d2 <- as.Date(myfile_out@table_out[[columns[2]]], format = "%d.%m.%Y")
    dateMisprints_row_ind <- append(dateMisprints_row_ind, which(d1 > d2))
    dateMisprints_row_ind <- dateMisprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
    theObject@indices <- append(theObject@indices, values = outer(dateMisprints_row_ind, columns, paste, sep = "."))
    for(i in 1:length(columns)) lapply(dateMisprints_row_ind, function(j) PrintReport(theObject, myfile_report, j, columns[i]))
    cat("Date misprints coordinates are ", paste(dateMisprints_row_ind, columns, sep = "."), "\n")
    return(theObject)
  }
)
