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
           def = function(theObject, missing_values, unsolved_misprints,  myfile_in, myfile_out, myfile_report, column_class)
           { 
             standardGeneric("FindMisprints")
           }
)

setMethod(f = "FindMisprints",
  signature = c("Misprint", "MissingValue", "UnsolvedMisprint", "FileIn", "FileOut", "FileReport", "Discrete"),
  definition = function(theObject, missing_values, unsolved_misprints,  myfile_in, myfile_out, myfile_report, column_class)
  { 
    c <- myfile_in@table_in[[column_class@column_index]]
    misprints_row_ind <- c()
    misprints_new_row_ind <- c()
    
    for (i in 1:length(c))
    { 
      found <- FALSE
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        missing_values@indices <- append(missing_values@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(missing_values, myfile_report, misprints_new_row_ind, column_class@column_index, colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
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
              misprints_row_ind <- i
              misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
              theObject@indices <- append(theObject@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
              PrintReport(theObject, myfile_report, misprints_new_row_ind, column_class@column_index,  colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
              cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
              myfile_out@table_out[[column_class@column_index]][i] <- unlist(column_class@value[[a]], use.names = FALSE)
              break
            }
          }
          if ((!found) & (a == length(column_class@key)))
          {
            misprints_row_ind <- i
            misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
            unsolved_misprints@indices <- append(unsolved_misprints@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
            PrintReport(unsolved_misprints, myfile_report, misprints_new_row_ind, column_class@column_index, colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
            cat("Unsolved misprint coordinates are", paste(i, column_class@column_index, sep = "."), "\n")
            found <- TRUE
          }
        }
      }
      if (!found)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        unsolved_misprints@indices <- append(unsolved_misprints@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(unsolved_misprints, myfile_report, misprints_new_row_ind, column_class@column_index,  colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
        cat("Unsolved misprint coordinates are", paste(i, column_class@column_index, sep = "."), "\n")
        found <- TRUE
      }
    }
    output_list <- list("misprint" = theObject, "missingValues" = missing_values , "unsolvedMisprint" = unsolved_misprints, "file" = myfile_out)
    return(output_list)
  }       
)

setMethod(f = "FindMisprints",
  signature = c("Misprint", "MissingValue", "UnsolvedMisprint", "FileIn", "FileOut", "FileReport", "Continuous"),
  definition = function(theObject, missing_values, unsolved_misprints, myfile_in, myfile_out, myfile_report, column_class)
  {
    misprints_row_ind <- c()
    misprints_new_row_ind <- c()
    unsolved_number <- 0
    c <- myfile_in@table_in[[column_class@column_index]]
    pattern <- "^((\\d)+)[,.]|([[:space:]])?(\\d)+)?$"
    for (i in 1:length(c))
    {
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        missing_values@indices <- append(missing_values@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(missing_values, myfile_report, misprints_new_row_ind, column_class@column_index,  colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
        cat("Missing value coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      }

      if (grepl(pattern, c[[i]]) == FALSE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        unsolved_misprints@indices <- append(unsolved_misprints@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(unsolved_misprints, myfile_report, misprints_new_row_ind, column_class@column_index, colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
        cat("Unsolved misprint coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        unsolved_number <- unsolved_number + 1
        next
      } else if (grepl("[[:space:]]", c[[i]]) == TRUE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        theObject@indices <- append(theObject@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(theObject, myfile_report, misprints_new_row_ind, column_class@column_index,  colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
        cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        myfile_out@table_out[[column_class@column_index]][i] <- gsub("[[:space:]]", "", myfile_in@table_in[[column_class@column_index]][i])
      } else if (is.character(c[[i]]) && (grepl("[.]", c[[i]]) == TRUE))
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        theObject@indices <- append(theObject@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(theObject, myfile_report, misprints_new_row_ind, column_class@column_index,  colnames(myfile_in@table_in[column_class@column_index]), c[misprints_row_ind])
        cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        myfile_out@table_out[[column_class@column_index]][i] <- gsub("[.]", ",", myfile_in@table_in[[column_class@column_index]][i])
      }
      # if (unsolved_number == 0)
      #   file@table_out[[column_class@column_index]][i] <<- as.numeric(file@table_out[[column_class@column_index]][i])
    }
    output_list <- list("misprint" = theObject, "missingValues" = missing_values , "unsolvedMisprint" = unsolved_misprints, "file" = myfile_out, "unsolved_number" = unsolved_number)
    return(output_list)
  }
)

setMethod(f = "FindMisprints",
  signature = c("Misprint", "MissingValue", "UnsolvedMisprint", "FileIn", "FileOut", "FileReport", "Dates"),
  definition = function(theObject, missing_values, unsolved_misprints, myfile_in, myfile_out, myfile_report, column_class)
  {
    misprints_row_ind <- c()
    misprints_new_row_ind <- c()
    c <- myfile_in@table_in[[column_class@column_index]]
    pattern <- "^((\\d){2})([,.]|[-/])(\\d{2})([,.]|[-/])((\\d){2}|(\\d){4})$"

    for (i in 1:length(c))
    {
      if (is.na(c[i]) == TRUE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        missing_values@indices <- append(missing_values@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(missing_values, myfile_report, misprints_new_row_ind, column_class@column_index, colnames(myfile_in@table_in[[column_class@column_index]]), c[misprints_row_ind])
        cat("Missing value coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      }

      if (grepl(pattern, c[[i]]) == FALSE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        unsolved_misprints@indices <- append(unsolved_misprints@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(unsolved_misprints, myfile_report, misprints_new_row_ind, column_class@column_index, colnames(myfile_in@table_in[[column_class@column_index]]), c[misprints_row_ind])
        cat("Unsolved misprint coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        next
      } else if (grepl("[,]|[-/]", c[[i]]) == TRUE)
      {
        misprints_row_ind <- i
        misprints_new_row_ind <- misprints_row_ind + myfile_out@row_header + myfile_out@row_table_legend
        theObject@indices <- append(theObject@indices, values = paste(misprints_new_row_ind, column_class@column_index, sep = "."))
        PrintReport(theObject, myfile_report, misprints_new_row_ind, column_class@column_index, colnames(myfile_in@table_in[[column_class@column_index]]), c[misprints_row_ind])
        cat("Misprints coordinates are ", paste(i, column_class@column_index, sep = "."), "\n")
        myfile_out@table_out[[column_class@column_index]][i] <- gsub("([,]|[-/])", ".", myfile_in@table_in[[column_class@column_index]][i])
      }
         
    }
    output_list <- list("misprint" = theObject, "missingValues" = missing_values , "unsolvedMisprint" = unsolved_misprints, "file" = myfile_out)
    return(output_list)
  }
)