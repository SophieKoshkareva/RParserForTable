#' @include Error.R
#' #' An S4 class to represent a file.
#'
#' @slot path A character vector to set full file path
#' @param theObject A File object.
#' @examples
#' myfile <- new("File")
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
  def = function(theObject, myfile_out, myfile_report, column_class, unsolved_number)
  {
    standardGeneric("FindOutliers")
  }
)

setMethod(f = "FindOutliers",
  signature = "Outlier" ,
  definition = function(theObject, myfile_out, myfile_report, column_class, unsolved_number)
  {
    outliers_row_ind <- c()
    only_digits <- c()
    outliers <- c()
    c <- myfile_out@table_out[[column_class@column_index]]

    if (unsolved_number != 0)
    {
      cat("It is impossible to determine outliers, there are  unsolved misprints in the column ", column_class@column_index, "\n")
    } else
    {
      for (i in 1:length(c))
      {
        if (is.na(c[i]) == TRUE)
        {
          # outliers_row_ind <- i + row_header + row_table_legend
          # missingValue@indices <<- append(missingValue@indices, values = paste(outliers_row_ind, column_index, sep = "."))
          # PrintReport(missingValue, file@path_report, outliers_row_ind, column_index)
          # cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
          next
        }

        if (grepl("^(\\d)+([.,](\\d)+)?$", c[[i]]) == TRUE)
        {
          only_digits <- append(only_digits, c[i])
          next
        }
      }
      only_digits <- gsub("[,]", ".", only_digits)
      outliers <- boxplot.stats(as.numeric(only_digits))$out

      if (!is.null(outliers))
      {
        outliers_row_ind <- which(gsub("[,]", ".", c) %in% outliers, arr.ind = T, useNames = F)
        #outliers_row_ind <- which(c %in% outliers, arr.ind = T, useNames = F)
        outliers_row_ind <- outliers_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        theObject@indices <- append(theObject@indices, values = outer(outliers_row_ind, column_class@column_index, paste, sep = "."))
        lapply(outliers_row_ind, function(i) PrintReport(theObject, myfile_report, i, column_class@column_index))
        cat("Outlier coordinates are ", paste(outliers_row_ind, column_class@column_index, sep = "."), "\n")
      }
    }
    return(theObject)
  }
)

