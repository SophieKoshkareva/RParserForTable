Sex <- setClass("Sex", 
                contains = "Column"
)

setMethod(f = "initialize",
          signature = "Sex",
          definition = function(.Object)
          { #.Object@data <- column_data
            .Object@key[["Male"]] <- list("м", "муж",
                                          "мужской",
                                          "мужчина",
                                          "мужик")
            .Object@value[["Male"]] <- list(1)
            .Object@key[["Female"]] <- list("ж",
                                            "жен",
                                            "женский",
                                            "женщина")
            .Object@value[["Female"]] <- list(0)
            .Object@data <- 2
            return(.Object)
          }
)