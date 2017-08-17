Column <- setClass("Column",
                   slots = c(
                     dictionary = "list")
                     
                   
)

Sex <- setClass("Sex",
                contains = "Column"
                )
                  
setMethod(f = "initialize",
          signature = "Sex",
          definition = function(.Object)
            { #callNextMethod(.Object)

              dictionary.name <- c("Sex")
              .Object@dictionary <- vector("list", length(dictionary.name))
              names(.Object@dictionary) <- dictionary.name
              .Object@dictionary[dictionary.name] <- list(c("ж",
                                                            "жен",
                                                            "женщина"))
              return(.Object)
          }
)
col1 <- new("Column")
col1
col2 <- Sex()
col2 <- initialize(col2)
col2
