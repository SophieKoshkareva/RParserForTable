Outlier <- setClass("Outlier",
                    contains = "Error" 
)

setMethod(f = "initialize",
          signature = "Outlier",
          definition = function(.Object)
          { .Object@style <- CellStyle(wb) +
            Font(wb, isItalic = TRUE) +
            Fill(foregroundColor = "tomato2") +
            Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
          return(.Object)
          }
)