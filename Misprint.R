Misprint <- setClass("Misprint",
  contains = "Error" 
)


setMethod(f = "initialize",
  signature = "Misprint",
  definition = function(.Object)
  {
    .Object@style <- "yellow1"
    # .Object@style <- CellStyle(wb) +
    # Font(wb, isItalic = TRUE) +
    # Fill(foregroundColor = "yellow1") +
    # Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    return(.Object)
  }
)

setGeneric(name = "FindMisprints",
  def = function(theObject, table, column_index, keys, values, missing)
    { 
      standardGeneric("FindMisprints")
    }
)

setMethod(f = "FindMisprints",
  signature = "Misprint",
  definition = function(theObject, table, column_index, keys, values, missing)
  { 
    misprint_row_ind <- 0
    c <- table[[column_index]]
    #missing <- as.numeric(missing)
    #c <- c[-missing]
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        missing <- append(missing, values = paste(i, column_index, sep = "."))
        cat("Missing value coordinates are ", missing, "\n")
      }
      next
      for(j in 1:length(values))
      {
        if (toupper(c[i]) == toupper(values[[j]][1]))
        {
          #which(toupper(file@table[[2]]) %in% toupper(sex@key[[1]][1]))
          found <- TRUE
          break
        }
      }
     
      if (found)
        next
      
      for(a in 1:length(keys))
      {
        for(b in 1:length(keys[j]))
        {
          if (toupper(c[i]) == toupper(keys[[a]][b]))
          {
              found <- TRUE
              #misprint_row_ind <-  i + theObject@row_header + theObject@row_symbol
              theObject@ind <- append(theObject@ind, values = paste(i, column_index, sep = ","))
              cat("Misprints coordinates are ",theObject@ind, "\n")
          }
          else
          {
            cat("Unsolved misprint coordinates are", paste(i, column_index, sep = "."), "\n")
          }
        }
      }
    }
    return(theObject)
  }       
)
