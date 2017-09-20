#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A Error object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
MissingValue <- setClass("MissingValue",
  contains = "Error"
)

setMethod(f = "initialize",
  signature = "MissingValue",
  definition = function(.Object)
  {
    .Object@title <- c("??????????? ????????")
    .Object@col_index_legend <- 1
    .Object@style <- c("missing_value")
    return(.Object)
  }
)
