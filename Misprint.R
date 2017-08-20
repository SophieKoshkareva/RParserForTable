Misprint <- setClass("Misprint",
                     contains = "Error" 
)


setMethod(f = "initialize",
          signature = "Misprint",
          definition = function(.Object)
          { .Object@style <- "yellow1"
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
          { misprint_row_ind <- 0
            c <- table[[column_index]]
            
            for (i in length(c)){
              found <- FALSE
              
              print(c[i])
              for(j in 1:length(values)){
                for(k in 1:length(values[j])){
                    print("!!!!!!!!!!")
                    print(values[[j]][k])
                    
                    #misprint_row_ind <- which(c %in% values)
                    if (c[i] != values[[j]][k]){
                      #which(file@table[[2]] %in% sex@value[[2]])
                      found <- TRUE
                      print(found)
                      misprint_row_ind <-  i + theObject@row_header + theObject@row_symbol
                      print(misprint_row_ind)
                      theObject@ind <- append(theObject@ind, values = paste(misprint_row_ind, column_index, sep = "."))
                      print(theObject@ind)
                    }
                  }
              }
            }
            #misprint_row_ind <- which(c %in% values)
            #misprint_row_ind <- which(toupper(c) %in% toupper(dictionary_keys), arr.ind = T, useNames = F)
            #misprint_row_ind <- which(data_table[[i]] %in% dictionary_keys, arr.ind = T, useNames = F)
            #misprint_row_ind <- misprint_row_ind + theObject@row_header + theObject@row_symbol
            #theObject@ind <- append(theObject@ind, values = outer(misprint_row_ind, column_index, paste, sep = "."))
            #}
          return(theObject)
        }
)