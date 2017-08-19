Outlier <- setClass("Outlier",
                    contains = "Error" 
)

setMethod(f = "initialize",
          signature = "Outlier",
          definition = function(.Object)
          { .Object@style <- "tomato2"
            # .Object@style <- CellStyle(wb) +
            # Font(wb, isItalic = TRUE) +
            # Fill(foregroundColor = "tomato2") +
            # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
          return(.Object)
          }
)

setGeneric(name = "FindOutliers",
           def = function(theObject, data_table)
           { 
             standardGeneric("FindOutliers")
           }
)

setMethod(f = "FindOutliers",
          signature = "Outlier",
          definition = function(theObject, data_table)
          { #outliers <- c()
            #outliers_row_ind <- c()
            #theObject@ind <- c()
            num_levels_defaul <- 5
            for (i in 1:ncol(data_table)){
              if (is.numeric(data_table[[i]]) & length(unique(data_table[[i]])) > num_levels_defaul){
                outliers <- boxplot.stats(data_table[[i]])$out
                if (is.null(outliers) == TRUE) {
                  #xlsx.createBook(data_table, sheet_out_name, file_out)
                } else {
                  outliers_row_ind <- which(data_table[[i]] %in% outliers, arr.ind = T, useNames = F)
                  outliers_row_ind <- outliers_row_ind + theObject@row_header + theObject@row_symbol
                  theObject@ind <- append(theObject@ind, values = outer(outliers_row_ind, i, paste, sep = "."))
                }
              }
            }
            return(theObject)
          }
)

  