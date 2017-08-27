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
    # .Object@style <- CellStyle(file@wb) +
    # Font(file@wb, isItalic = TRUE) +
    # Fill(foregroundColor = "tomato") +
    # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
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
      if (grepl("\\d", c[i]) == TRUE)
        only_digits <- append(only_digits, c[i])
    }
    outliers <- boxplot.stats(as.numeric(only_digits))$out
    print(outliers)
    if (!is.null(outliers))
    {
      #xlsx.createBook(table, sheet_out_name, file_out)
      outliers_row_ind <- which(c %in% outliers, arr.ind = T, useNames = F)
      outliers_row_ind <- outliers_row_ind + row_header + row_table_legend
      globalOutlier <<- append(globalOutlier, values = outer(outliers_row_ind, column_index, paste, sep = "."))
      cat("Outlier coordinates are ", paste(outliers_row_ind, column_index, sep = "."), "\n")
    }
  #return(theObject)
  }
)

  