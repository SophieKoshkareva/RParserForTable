Misprint <- setClass("Misprint",
                     contains = "Error" 
)


setMethod(f = "initialize",
          signature = "Misprint",
          definition = function(.Object)
          { .Object@style <- CellStyle(wb) +
            Font(wb, isItalic = TRUE) +
            Fill(foregroundColor = "yellow1") +
            Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
          return(.Object)
          }
)