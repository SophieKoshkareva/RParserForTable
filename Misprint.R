Misprint <- setClass("Misprint",
                     contains = "Error" 
)

setMethod(f = "initialize",
  signature = "Misprint",
  definition = function(.Object)
  { 
    .Object@title <- c("Исправления")
    .Object@col_index_legend <- 2
    .Object@style<- c("misprint")
    # .Object@style <- CellStyle(file@wb) +
    #   Font(file@wb, isItalic = TRUE) +
    #   Fill(foregroundColor = "lightyellow") +
    #   Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
    return(.Object)
  }
)

setGeneric(name = "FindMisprints",
           def = function(theObject, table_in, table_out, column_index, keys, values, row_header, row_table_legend)
           { 
             standardGeneric("FindMisprints")
           }
)

setMethod(f = "FindMisprints",
  signature = "Misprint",
  definition = function(theObject, table_in, table_out, column_index, keys, values, row_header, row_table_legend)
  { 
    c <- table_in[[column_index]]
    misprints_row_ind <- c()
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        globalMissing <<- append(globalMissing, values = paste(misprints_row_ind, column_index, sep = "."))
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
      for(j in 1:length(values))
      {
        if (toupper(c[i]) == toupper(values[[j]][1]))
        {
          #which(toupper(file@table_in[[2]]) %in% toupper(sex@key[[1]][1]))
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
            misprints_row_ind <- i + row_header + row_table_legend
            globalMisprint <<- append(globalMisprint, values = paste(misprints_row_ind, column_index, sep = "."))
            cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
            file@table_out[[column_index]][i] <<- unlist(values[[a]], use.names = FALSE)
            break
          }
        }
        if ((!found) & (a == length(keys)))
        {
          misprints_row_ind <- i + row_header + row_table_legend
          globalUnsolvedMisprint <<- append(globalUnsolvedMisprint, values = paste(misprints_row_ind, column_index, sep = "."))
          cat("Unsolved misprint coordinates are", paste(i, column_index, sep = "."), "\n")
          found <- TRUE
        }
      }
    }
    return(table_out)
  }       
)

setGeneric(name = "FindMisprintsForNumeric",
           def = function(theObject, table_in, column_index, row_header, row_table_legend)
           { 
             standardGeneric("FindMisprintsForNumeric")
           }
)

setMethod(f = "FindMisprintsForNumeric",
  signature = "Misprint",
  definition = function(theObject, table_in, column_index, row_header, row_table_legend)
  { 
    misprints_row_ind <- c()
    c <- table_in[[column_index]]
    
    for (i in 1:length(c))
    { 
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        globalMissing <<- append(globalMissing, values = paste(misprints_row_ind, column_index, sep = "."))
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
      if (grepl("\\d", c[[i]]) == FALSE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        globalUnsolvedMisprint <<- append(globalUnsolvedMisprint, values = paste(misprints_row_ind, column_index, sep = "."))
        cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
    #return(theObject)
    } 
  }
)
