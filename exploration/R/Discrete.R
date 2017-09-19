#' @include Column.R
#' An S4 class to work with Excel workbook.
#'
#' @slot key,value A list, logical dictionary structure/
#' @param theObject A FileIn object.
#' @return data.frame \code{x}.
#' @examples
#' myfile <- new("FileOut")
#' myfile <- setFilePath(myfile, "D:/data.xlsx")
#' myfile <- ReadFileIn(myfile)
Discrete <- setClass("Discrete",
  contains = "Column",
  slots = c(key = "list",
            value = "list")
)
setGeneric(name = "getValue",
  def = function(theObject)
  {
    standardGeneric("getValue")
  }
)
setMethod(f = "getValue",
  signature = "Discrete",
  definition = function(theObject)
  {
    return(theObject@value)
  }
)

setGeneric(name = "setValue",
  def = function(theObject, newValue, add = FALSE)
  {
    standardGeneric("setValue")
  }
)
setMethod(f = "setValue",
  signature = "Discrete",
  definition = function(theObject, newValue)#, add = FALSE)
  {
  # if(add)
  # {
  #   theObject@value <- c(theObject@value, newValue)
  # }else
  # {
    theObject@value <- as.list(newValue)
  #}
    return(theObject)
  }
)

setGeneric(name = "getKey",
  def = function(theObject)
  {
    standardGeneric("getKey")
  }
)
setMethod(f = "getKey",
  signature = "Discrete",
  definition = function(theObject)
  {
    return(theObject@key)
  }
)

setGeneric(name = "setKey",
  def = function(theObject, newKey, add = FALSE)
  {
    standardGeneric("setKey")
  }
)#!!!!!!!!!!!
setMethod(f = "setKey",
  signature = "Discrete",
  definition = function(theObject, newKey)#, add = FALSE)
  {
    if (!is.list(newKey)) newKey <- list(newKey)
    for(i in 1:length(newKey))
    {
      # if(add)
      # {
      #   theObject@key[[i]] <- c(theObject@key[[i]], as.list(newKey[[i]]))
      # }else
      # {
      theObject@key[[i]] <- as.list(newKey[[i]])
      #}
    }
    return(theObject)
  }
)
#setKey(sex, list(c("male", "m"), c("female", "f")), add = TRUE)
#setKey(diabetes, list(c("2 тип", "2тип", "второй", "2")), add = TRUE)

setGeneric(name = "FindErrors",
  def = function(theObject, myfile_in, myfile_out, myfile_report, misprints, missing_values, unsolved_misprints)
  {
    standardGeneric("FindErrors")
  }
)
setMethod(f = "FindErrors",
  signature = "Discrete",
  definition = function(theObject, myfile_in, myfile_out, myfile_report, misprints, missing_values, unsolved_misprints)
  {
    output_list <- FindMisprints(misprints, missing_values, unsolved_misprints,  myfile_in, myfile_out, myfile_report, theObject)
    return(output_list)
  }
)
