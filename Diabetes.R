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
    .Object@column_index <- 5
    return(.Object)
  }
)

setGeneric(name = "FindErrors", 
           def = function(theObject)
           {
             standardGeneric("FindErrors")
           }
)

setMethod(f = "FindErrors",
          signature = "Diabetes",
          definition = function(theObject)
          { 
            #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
            FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
          }
)