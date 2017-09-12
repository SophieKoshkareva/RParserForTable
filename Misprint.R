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
    return(.Object)
  }
)

setGeneric(name = "FindMisprints",
           def = function(theObject, table_in, column_index, keys, values, row_header, row_table_legend)
           { 
             standardGeneric("FindMisprints")
           }
)

setMethod(f = "FindMisprints",
  signature = "Misprint",
  definition = function(theObject, table_in, column_index, keys, values, row_header, row_table_legend)
  { 
    c <- table_in[[column_index]]
    misprints_row_ind <- c()
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        #PrintReport(missingValue, file@path_report, misprints_row_ind, column_index)
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
      for(j in 1:length(values))
      {
        if (found)
          break
        for(k in 1:length(values[[j]]))
        { 
          if (toupper(c[i]) == toupper(values[[j]][k]))
          {
            found <- TRUE
            break
          }
        }
      }
      if (found)
        next
      if (length(keys) != 0)
      {
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
              misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
              PrintReport(theObject, file@path_report, misprints_row_ind, column_index)
              cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
              file@table_out[[column_index]][i] <<- unlist(values[[a]], use.names = FALSE)
              break
            }
          }
          if ((!found) & (a == length(keys)))
          {
            misprints_row_ind <- i + row_header + row_table_legend
            unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
            PrintReport(unsolvedMisprint, file@path_report, misprints_row_ind, column_index)
            cat("Unsolved misprint coordinates are", paste(i, column_index, sep = "."), "\n")
            found <- TRUE
          }
        }
      }
      if (!found)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(unsolvedMisprint, file@path_report, misprints_row_ind, column_index)
        cat("Unsolved misprint coordinates are", paste(i, column_index, sep = "."), "\n")
        found <- TRUE
      }
    }
    #return(theObject)
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
    pattern <- "^((\\d){2})[[:punct:]]|([[:space:]])?(\\d)+)?$"
    for (i in 1:length(c))
    { 
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(missingValue, file@path_report, misprints_row_ind, column_index)
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
      
      if (grepl(pattern, c[[i]]) == FALSE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(unsolvedMisprint, file@path_report, misprints_row_ind, column_index)
        cat("Unsolved misprint coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      } else if (grepl("[[:space:]]", c[[i]]) == TRUE)
      {
          misprints_row_ind <- i + row_header + row_table_legend
          misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
          PrintReport(theObject, file@path_report, misprints_row_ind, column_index)
          cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
          file@table_out[[column_index]][i] <<- gsub("[[:space:]]", "", file@table_in[[column_index]][i])
      } else if (is.character(c[[i]]) && (grepl("[.]", c[[i]]) == TRUE))
      {
        misprints_row_ind <- i + row_header + row_table_legend
        misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(theObject, file@path_report, misprints_row_ind, column_index)
        cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
        file@table_out[[column_index]][i] <<- gsub("[.]", ",", file@table_in[[column_index]][i])
        
      }
    } 
  }
)

setGeneric(name = "FindMisprintsForDates",
  def = function(theObject, table_in, column_index, row_header, row_table_legend)
  { 
    standardGeneric("FindMisprintsForDates")
  }
)
setMethod(f = "FindMisprintsForDates",
  signature = "Misprint",
  definition = function(theObject, table_in, column_index, row_header, row_table_legend)
  { 
    misprints_row_ind <- c()
    c <- table_in[[column_index]]
    pattern <- "^((\\d){2})([,.]|[-/])(\\d{2})([,.]|[-/])((\\d){2}|(\\d){4})$"
    
    for (i in 1:length(c))
    { 
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(missingValue, file@path_report, misprints_row_ind, column_index)
        cat("Missing value coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      }
  
      if (grepl(pattern, c[[i]]) == FALSE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(unsolvedMisprint, file@path_report, misprints_row_ind, column_index)
        cat("Unsolved misprint coordinates are ", paste(i, column_index, sep = "."), "\n")
        next
      } else if (grepl("[,]|[-/]", c[[i]]) == TRUE)
      {
        misprints_row_ind <- i + row_header + row_table_legend
        misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_index, sep = "."))
        PrintReport(theObject, file@path_report, misprints_row_ind, column_index)
        cat("Misprints coordinates are ", paste(i, column_index, sep = "."), "\n")
        file@table_out[[column_index]][i] <<- gsub("[,]|[-/]", ".", file@table_out[[column_index]][i])
      }
    }
  }
)