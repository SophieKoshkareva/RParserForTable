Column <- setClass("Column",
                   slots = c(
                     key = "list",
                     value = "list",
                     data = "data.frame")
)

Sex <- setClass("Sex", 
                contains = "Column"
                )

Diabetes <- setClass("Diabetes",
                   contains = "Column")
                  
setMethod(f = "initialize",
          signature = "Sex",
          definition = function(.Object)
            { .Object@key["Male"] <- list(c("м",
                                                   "муж",
                                                   "мужчина",
                                                   "мужик"))
              .Object@value["Male"] <- list(1)
              .Object@key["Female"] <- list(c("ж",
                                                     "жен",
                                                     "женщина"))
              .Object@value["Female"] <- list(0)
              return(.Object)
          }
)

setMethod(f = "initialize",
          signature = "Diabetes",
          definition = function(.Object)
          {
            .Object@key["FirstDiabetesType"] <- list(c("1 тип",
                                                              "1тип",
                                                              "первый"))
            .Object@key["SecondDiabetesType"] <- list(c("2 тип",
                                                               "2тип",
                                                               "второй",
                                                               "2"))
            return(.Object)
          }
)





col1 <- new("Column")
col1
col2 <- Sex()
col2 <- initialize(col2)
col2
col3 <- new("Diabetes")
col3 <- initialize(col3)
col3

