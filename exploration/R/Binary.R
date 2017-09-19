#'@include Column.R
#'@include Discrete.R
#' An S4 class to work with Excel workbook.
#'
#' @slot table_out A a data.frame to represent csv-table/
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileOut")
#' myfile <- setFilePath(myfile, "D:/data.xlsx")
#' myfile <- ReadFileIn(myfile)
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
