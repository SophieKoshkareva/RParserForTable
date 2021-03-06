Diabetes <- setClass("Diabetes",
  contains = "Column")

setMethod(f = "initialize",
  signature = "Diabetes",
  definition = function(.Object)
  { 
    .Object@key[["DiabetesType"]] <- list("1 ���",
                                          "1���",
                                          "������",
                                          "2 ���",
                                          "2���",
                                          "������",
                                          "2")
    .Object@value[["DiabetesType"]] <- list(1)
    .Object@key[["NoDiabetes"]] <- list("���")
    .Object@value[["NoDiabetes"]] <- list(0)
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