Sex <- setClass("Sex", 
  contains = "Column"
)

setMethod(f = "initialize",
  signature = "Sex",
  definition = function(.Object)
  { 
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
    .Object@column_index <- 2
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
  signature = "Sex",
  definition = function(theObject)
  { 
    #FindMisprints(file@table_in, theObject@column_index, theObject@key, theObject@value)
    FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
    
  }
)