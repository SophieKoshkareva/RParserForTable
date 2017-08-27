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