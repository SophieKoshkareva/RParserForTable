#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
#' @include Error.R
UnsolvedMisprint <- setClass("UnsolvedMisprint",
  contains = "Error"
)


setMethod(f = "initialize",
  signature = "UnsolvedMisprint",
  definition = function(.Object)
  {
    .Object@title <- c("????????")
    .Object@col_index_legend <- 3
    .Object@style <- c("unsolved_misprint")
    return(.Object)
  }
)
