Sex <- setClass("Sex", 
                contains = "Column"
)

setMethod(f = "initialize",
          signature = "Sex",
          definition = function(.Object)
          { #.Object@data <- column_data
            .Object@key["Male"] <- list(c("м",
                                          "муж",
                                          "мужской",
                                          "мужчина",
                                          "мужик"))
            .Object@value["Male"] <- list(1)
            .Object@key["Female"] <- list(c("ж",
                                            "жен",
                                            "женский",
                                            "женщина"))
            .Object@value["Female"] <- list(0)
            return(.Object)
          }
)