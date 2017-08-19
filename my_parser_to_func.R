#install.packages("xlsx")
require(xlsx)

#file_in <- "D:/Diploma/r_project/data_CABG_PCI_2.csv"
file_in <- "D:/Diploma/r_project/data_GABR_PCI ред..csv"
file_out <- "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx"
sheet_out_name <- "data_CABG_PCI_2"
row_header <- 1
row_symbol <- 1

xlsx.createBook <- function(x, sheetName, file, missing_value = FALSE, mis_ind, outliers = FALSE, outliers_ind, startR = 1){
  
  wb <- createWorkbook(type = "xlsx")
  sheet <- createSheet(wb, sheetName)
 
  TABLE_COLNAMES_STYLE <- CellStyle(wb) +
                          Font(wb, isBold = TRUE) +
                          Alignment(wrapText = TRUE, horizontal = "ALIGN_CENTER") +
                          Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT")) 
  MISSING_VALUE_STYLE <- CellStyle(wb) +
                         Font(wb, isItalic = TRUE) +
                         Fill(foregroundColor = "lightgray") +
                         Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
  OUTLIERS_STYLE <- CellStyle(wb) +
                    Font(wb, isItalic = TRUE) +
                    Fill(foregroundColor = "tomato2") +
                    Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
  
  createRow(sheet, rowIndex = 1)
  addDataFrame(x, sheet,  row.names = FALSE, startRow = 2, startColumn = 1, colnamesStyle = TABLE_COLNAMES_STYLE)
  rows <- getRows(sheet, rowIndex = 1:nrow(x) + row_header + row_symbol)    
  cells <- getCells(rows, colIndex = 1:ncol(x)) 
  
  if (missing_value == TRUE){
    lapply(names(cells[mis_ind]), function(i) setCellStyle(cells[[i]], MISSING_VALUE_STYLE))
    xlsx.addSymbolTytle(sheet, colIndex = 1, title = "??????????? ????????", titleStyle = MISSING_VALUE_STYLE)
  }

  if (outliers == TRUE){
    print("HELOOOOO")
    lapply(names(cells[outliers_ind]), function(i) setCellStyle(cells[[i]], OUTLIERS_STYLE))
    xlsx.addSymbolTytle(sheet, colIndex = 2, title = "???????", titleStyle = OUTLIERS_STYLE)
  }
    
  autoSizeColumn(sheet, colIndex = c(1:ncol(x)))
# ?????????? ??????/?????? ? 1? ???????
    createFreezePane(sheet, rowSplit = 2, colSplit = 2, startRow = 1, startColumn = 1)
    saveWorkbook(wb, file)
    print("New workbook was created")
}

xlsx.findMissingValue <- function(x){
  ind <- which(is.na(x), arr.ind = TRUE, useNames = FALSE)
  print(ind)
 # ????? ????????? ????????????????? ???? ??? ??????? ??? ?????????, ???????? ? ????.??????? TRUE ?? FALSE
  if (is.null(ind) == TRUE) {
    xlsx.createBook(x, sheet_out_name, file_out)
  } else {
      ind[,1] <- ind[,1] + row_header + row_symbol
      print("??????????? ????????")
      
      mis_ind <- apply(ind, 1, paste, collapse = ".")
      print("??????????? ????????")
      print(mis_ind)
    xlsx.findOutliers(x, mis_ind)
    
  }  
}

xlsx.addSymbolTytle <- function(sheet, colIndex, title, titleStyle){
  rows <-getRows(sheet,rowIndex = 1)
  sheetTitle <-createCell(rows, colIndex)
  setCellValue(sheetTitle[[1,1]], title)
  setCellStyle(sheetTitle[[1,1]], titleStyle)
}

xlsx.findOutliers <- function(x, mis_ind){
  outliers <- c()
  outliers_row_ind <- c()
  outliers_ind <- c()
  num_levels_defaul <- 5
  for (i in 1:ncol(x)){
    if (is.numeric(x[[i]]) & length(unique(x[[i]])) > num_levels_defaul){
      outliers <- boxplot.stats(x[[i]])$out
      if (is.null(outliers) == TRUE) {
      xlsx.createBook(x, sheet_out_name, file_out)
      } else {
        outliers_row_ind <- which(x[[i]] %in% outliers, arr.ind = T, useNames = F)
        outliers_row_ind <- outliers_row_ind + row_header + row_symbol
        print("???????")
       
        outliers_ind <- append(outliers_ind, values = outer(outliers_row_ind, i, paste, sep = "."))
        print("???????")
        
        }
    }
  }
  
  xlsx.createBook(x, sheet_out_name, file_out, missing_value = TRUE, mis_ind, outliers = TRUE, outliers_ind)
}

source_table <- read.csv2(file_in, na.strings = c("", "NA"), stringsAsFactors = FALSE, check.names = FALSE)
xlsx.findMissingValue(source_table)



