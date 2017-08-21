Diabetes <- setClass("Diabetes",
  contains = "Column")

setMethod(f = "initialize",
  signature = "Diabetes",
  definition = function(.Object)
  { #.Object@data <- column_data
  
    .Object@key["FirstDiabetesType"] <- list(c("1 тип",
                                               "1тип",
                                               "первый"))
    .Object@value["FirstDiabetesType"] <- list(1)
    .Object@key["SecondDiabetesType"] <- list(c("2 тип",
                                                "2тип",
                                                "второй",
                                                "2"))
    .Object@value["SecondDiabetesType"] <- list(0)
    return(.Object)
  }
)