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
           def = function(theObject, date1, date2, file1)
           { 
             standardGeneric("FindDateMisprints")
           }
)

setMethod(f = "FindDateMisprints",
          signature = c("DateMisprint", "Dates", "Dates", "File"),
          definition = function(theObject, date1, date2, file1)
          { 
            dateMisprints_row_ind <- c()
            columns <- sort(c(date1@column_index, date2@column_index))
            print(columns)
            d1 <- as.Date(file1@table_out[[columns[1]]], format = "%d.%m.%Y")
            d2 <- as.Date(file1@table_out[[columns[2]]], format = "%d.%m.%Y")
            dateMisprints_row_ind <- append(dateMisprints_row_ind, which(d1 > d2), after = length(x))
            dateMisprints_row_ind <- dateMisprints_row_ind + file1@row_header + file1@row_table_legend
            dateMisprint@indices <<- append(dateMisprint@indices, values = outer(dateMisprints_row_ind, columns, paste, sep = "."))
            lapply(dateMisprints_row_ind, function(i) PrintReport(theObject, file@path_report, i, columns))
            cat("Outlier coordinates are ", paste(dateMisprints_row_ind, columns, sep = "."), "\n")
            }
          
)