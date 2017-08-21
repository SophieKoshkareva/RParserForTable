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
    missingValue <- FindMissingValue(missingValue, file@table, theObject@column_index)
    #FindMisprints(misprint, file@table, theObject@column_index, theObject@key, theObject@value)
  }
)