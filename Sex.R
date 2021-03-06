Sex <- setClass("Sex", 
  contains = "Column"
)

setMethod(f = "initialize",
  signature = "Sex",
  definition = function(.Object)
  { 
    .Object@key[["Male"]] <- list("�",
                                  "���",
                                  "�������",
                                  "�������")
    .Object@value[["Male"]] <- list(1)
    
    .Object@key[["Female"]] <- list("�",
                                    "���",
                                    "�������",
                                    "�������")
    .Object@value[["Female"]] <- list(0)
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
    FindMisprints(misprint, file@table_in, theObject@column_index, theObject@key, theObject@value, file@row_header, file@row_table_legend)
    
  }
)