Outlier <- setClass("Outlier",
  contains = "Error" 
)

setMethod(f = "initialize",
  signature = "Outlier",
  definition = function(.Object)
  { 
    .Object@title <- c("Выбросы")
    .Object@col_index_legend <- 4
    .Object@style <- c("outlier")
    return(.Object)
  }
)

setGeneric(name = "FindOutliers",
  def = function(theObject, table, column_index, row_header, row_table_legend)
  { 
    standardGeneric("FindOutliers")
  }
)

setMethod(f = "FindOutliers",
  signature = "Outlier",
  definition = function(theObject, table, column_index, row_header, row_table_legend)
  { 
    outliers_row_ind <- c()
    only_digits <- c()
    outliers <- c()
    c <- table[[column_index]]
    
    for (i in 1:length(c))
      
    { 
      if (is.na(c[i]) == TRUE)
      {
        outliers_row_ind <- i + row_header + row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(outliers_row_ind, column_index, sep = "."))
        PrintReport(missingValue, file@path_report, outliers_row_ind, column_index)
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
      
      if (grepl("\\d", c[i]) == TRUE)
      { 
        only_digits <- append(only_digits, c[i])
        next
      }
    }
    
    only_digits <- gsub(',', '.', only_digits)
    outliers <- boxplot.stats(as.numeric(only_digits))$out
    if (!is.null(outliers))
    {
      #xlsx.createBook(table, sheet_out_name, file_out)
      outliers_row_ind <- which(c %in% outliers, arr.ind = T, useNames = F)
      outliers_row_ind <- outliers_row_ind + row_header + row_table_legend
      outlier@indices <<- append(outlier@indices, values = outer(outliers_row_ind, column_index, paste, sep = "."))
      lapply(outliers_row_ind, function(i) PrintReport(theObject, file@path_report, i, column_index))
      cat("Outlier coordinates are ", paste(outliers_row_ind, column_index, sep = "."), "\n")
    }
  }
)

  