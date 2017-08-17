Column <- setClass("Column",
                   slots = c(
                     dictionary = "list",
                     value = "list")
                     
                   
)

Sex <- setClass("Sex", 
                contains = "Column"
                )

Diabetes <- setClass("Diabetes",
                   contains = "Column")
                  
setMethod(f = "initialize",
          signature = "Sex",
          definition = function(.Object)
            { #callNextMethod(.Object)

              # dictionary.name <- c("Male", "Female")
              # .Object@dictionary <- vector("list", length(dictionary.name))
              # names(.Object@dictionary) <- dictionary.name
              .Object@dictionary["Male"] <- list(c("м",
                                                   "муж",
                                                   "мужчина",
                                                   "мужик"))
              .Object@value["Male"] <- list(1)
              .Object@dictionary["Female"] <- list(c("ж",
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
            .Object@dictionary["FirstDiabetesType"] <- list(c("1 тип",
                                                              "1тип",
                                                              "первый"))
            .Object@dictionary["SecondDiabetesType"] <- list(c("2 тип",
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

