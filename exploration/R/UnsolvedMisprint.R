#' @include Error.R
#' #' An S4 class to represent a file.
#'
#' @slot path A character vector to set full file path
#' @param theObject A File object.
#' @examples
#' myfile <- new("File")
UnsolvedMisprint <- setClass("UnsolvedMisprint",
  contains = "Error"
)


setMethod(f = "initialize",
  signature = "UnsolvedMisprint",
  definition = function(.Object)
  {
    .Object@title <- c("Опечатки")
    .Object@col_index_legend <- 3
    .Object@style <- c("unsolved_misprint")
    return(.Object)
  }
)
