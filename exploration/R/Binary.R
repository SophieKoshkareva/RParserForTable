#' Read row table from .csv-file and create new data.frame as object FileIn slot file_in .
#'
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileIn")
#' myfile <- setFilePath(myfile, "D:/data.csv")
#' myfile <- ReadFileIn(myfile)
#' @include Column.R Discrete.R

Binary <- setClass("Binary",
  contains = "Discrete"
)
setMethod(f = "initialize",
          signature = "Binary",
          definition = function(.Object)
          {

            .Object@value[["Zero"]] <- list(0)
            .Object@value[["One"]]<- list(1)
            return(.Object)
          }
)
