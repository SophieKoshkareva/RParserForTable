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
           def = function(theObject, table, column_index, keys, values)
           { 
             standardGeneric("FindMisprints")
           }
)

setMethod(f = "FindMisprints",
  signature = "Misprint",
  definition = function(theObject, table, column_index, keys, values)
  { 
    c <- table[[column_index]]
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        globalMissing <<- append(globalMissing, values = paste(i, column_index, sep = "."))
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
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
        if (found)
          break
        for(b in 1:length(keys[[a]]))
        { 
          if (toupper(c[i]) == toupper(keys[[a]][b]))
          {
            found <- TRUE
            #misprint_row_ind <-  i + theObject@row_header + theObject@row_symbol
            globalMisprint <<- append(globalMisprint, values = paste(i, column_index, sep = "."))
            #theObject@indices <- append(theObject@indices, values = paste(i, column_index, sep = "."))
            cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
            break
          }
        }
        if ((!found) & (a == length(keys)))
        {
          globalUnsolvedMisprint <<- append(globalUnsolvedMisprint, values = paste(i, column_index, sep = "."))
          cat("Unsolved misprint coordinates are", paste(i, column_index, sep = "."), "\n")
          found <- TRUE
        }
      }
    }
    #return(theObject)
  }       
)

setGeneric(name = "FindMisprintsForNumeric",
           def = function(theObject, table, column_index)
           { 
             standardGeneric("FindMisprintsForNumeric")
           }
)

setMethod(f = "FindMisprintsForNumeric",
  signature = "Misprint",
  definition = function(theObject, table, column_index)
  { 
    c <- table[[column_index]]
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        globalMissing <<- append(globalMissing, values = paste(i, column_index, sep = "."))
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
      if (grepl("\\d", c[[i]]) == FALSE)
      {
        globalMisprint <<- append(globalMisprint, values = paste(i, column_index, sep = "."))
        #theObject@indices <- append(theObject@indices, values = paste(i, column_index, sep = "."))
        cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
    #return(theObject)
    } 
  }
)
