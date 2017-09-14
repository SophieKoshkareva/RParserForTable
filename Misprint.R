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
           def = function(theObject, myfile, column_class)
           { 
             standardGeneric("FindMisprints")
           }
)

setMethod(f = "FindMisprints",
  signature = c("Misprint", "File", "Discrete"),
  definition = function(theObject, myfile, column_class)
  { 
    c <- myfile@table_in[[column_class@column_index]]
    misprints_row_ind <- c()
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(missingValue, myfile, misprints_row_ind, column_class@column_index)
        cat("Missing value coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      }
      for(j in 1:length(column_class@value))
      {
        if (found)
          break
        for(k in 1:length(column_class@value[[j]]))
        { 
          if (toupper(c[i]) == toupper(column_class@value[[j]][k]))
          {
            found <- TRUE
            break
          }
        }
      }
      if (found)
        next
      if (length(column_class@key) != 0)
      {
        for(a in 1:length(column_class@key))
        { 
          if (found)
            break
          for(b in 1:length(column_class@key[[a]]))
          { 
            if (toupper(c[i]) == toupper(column_class@key[[a]][b]))
            {
              found <- TRUE
              misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
              misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
              PrintReport(theObject, myfile, misprints_row_ind, column_class@column_index)
              cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
              file@table_out[[column_class@column_index]][i] <<- unlist(column_class@value[[a]], use.names = FALSE)
              break
            }
          }
          if ((!found) & (a == length(column_class@key)))
          {
            misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
            unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
            PrintReport(unsolvedMisprint, myfile, misprints_row_ind, column_class@column_index)
            cat("Unsolved misprint coordinates are", paste(i, column_class@column_index, sep = "."), "\n")
            found <- TRUE
          }
        }
      }
      if (!found)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(unsolvedMisprint, myfile, misprints_row_ind, column_class@column_index)
        cat("Unsolved misprint coordinates are", paste(i, column_class@column_index, sep = "."), "\n")
        found <- TRUE
      }
    }
    #return(theObject)
  }       
)

# setGeneric(name = "FindMisprints",
#            def = function(theObject, myfile, column_class)
#            { 
#              standardGeneric("FindMisprints")
#            }
# )

setMethod(f = "FindMisprints",
  signature = c("Misprint", "File", "Continuous"),
  definition = function(theObject, myfile, column_class)
  { 
    misprints_row_ind <- c()
    c <- myfile@table_in[[column_class@column_index]]
    pattern <- "^((\\d){2})[[:punct:]]|([[:space:]])?(\\d)+)?$"
    for (i in 1:length(c))
    { 
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(missingValue, myfile, misprints_row_ind, column_class@column_index)
        cat("Missing value coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      }
      
      if (grepl(pattern, c[[i]]) == FALSE)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(unsolvedMisprint, myfile, misprints_row_ind, column_class@column_index)
        cat("Unsolved misprint coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      } else if (grepl("[[:space:]]", c[[i]]) == TRUE)
      {
          misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
          misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
          PrintReport(theObject, myfile, misprints_row_ind, column_class@column_index)
          cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
          file@table_out[[column_class@column_index]][i] <<- gsub("[[:space:]]", "", myfile@table_in[[column_class@column_index]][i])
      } else if (is.character(c[[i]]) && (grepl("[.]", c[[i]]) == TRUE))
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(theObject, myfile, misprints_row_ind, column_class@column_index)
        cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        file@table_out[[column_class@column_index]][i] <<- gsub("[.]", ",", myfile@table_in[[column_class@column_index]][i])
        
      }
    } 
  }
)

# setGeneric(name = "FindMisprints",
#   def = function(theObject, myfile, column_class)
#   { 
#     standardGeneric("FindMisprints")
#   }
# )
setMethod(f = "FindMisprints",
  signature = c("Misprint", "File", "Dates"),
  definition = function(theObject, myfile, column_class)
  { 
    misprints_row_ind <- c()
    c <- myfile@table_in[[column_class@column_index]]
    pattern <- "^((\\d){2})([,.]|[-/])(\\d{2})([,.]|[-/])((\\d){2}|(\\d){4})$"
    
    for (i in 1:length(c))
    { 
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        missingValue@indices <<- append(missingValue@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(missingValue, myfile, misprints_row_ind, column_class@column_index)
        cat("Missing value coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      }
  
      if (grepl(pattern, c[[i]]) == FALSE)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        unsolvedMisprint@indices <<- append(unsolvedMisprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(unsolvedMisprint, myfile, misprints_row_ind, column_class@column_index)
        cat("Unsolved misprint coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      } else if (grepl("[,]|[-/]", c[[i]]) == TRUE)
      {
        misprints_row_ind <- i + myfile@row_header + myfile@row_table_legend
        misprint@indices <<- append(misprint@indices, values = paste(misprints_row_ind, column_class@column_index, sep = "."))
        PrintReport(theObject, myfile, misprints_row_ind, column_class@column_index)
        cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        file@table_out[[column_class@column_index]][i] <<- gsub("[,]|[-/]", ".", myfile@table_out[[column_class@column_index]][i])
      }
    }
  }
)