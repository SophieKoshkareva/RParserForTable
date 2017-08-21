UnsolvedMisprint <- setClass("UnsolvedMisprint",
  contains = "Error" 
)


setMethod(f = "initialize",
  signature = "UnsolvedMisprint",
  definition = function(.Object)
  { 
    .Object@style <- "orange1"
  # .Object@style <- CellStyle(wb) +
  # Font(wb, isItalic = TRUE) +
  # Fill(foregroundColor = "yellow1") +
  # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    return(.Object)
  }
)