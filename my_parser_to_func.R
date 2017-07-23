#install.packages("xlsx")
require(xlsx)

file_in <- "D:/Diploma/r_project/data_CABG_PCI_2.csv"
file_out <- "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx"
sheet_out_name <- "data_CABG_PCI_2"

xlsx.createBook <- function(x, sheetName, file, missing_value = FALSE, mis_ind, outliers = FALSE, outliers_ind, startR = 1){
  
  wb <- createWorkbook(type = "xlsx")
  sheet1 <- createSheet(wb, sheetName)
 
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
                    Fill(foregroundColor = "red") +
                    Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT"))
  
  addDataFrame(x, sheet1,  row.names = FALSE, startRow = startR, startColumn = 1, colnamesStyle = TABLE_COLNAMES_STYLE)
  
  rows <- getRows(sheet1, rowIndex = 1:nrow(x) + 2)    
  cells <- getCells(rows, colIndex = 1:ncol(x)) 
  
  if (missing_value == TRUE){
    #print(mis_ind)
    #print(names(cells[mis_ind])[1])
    #print(mis_ind)
   # print("---")
   # print(names(cells[mis_ind])[1])
   # print("/---")
    #print(cells[["53.29"]])
    tmp1 <- names(cells[mis_ind])[[1]]
    tmp2 <- cells[[mis_ind[1]]]
    setCellStyle(tmp2, MISSING_VALUE_STYLE)
    lapply(names(cells[mis_ind]), function(i) setCellStyle(cells[[i]], MISSING_VALUE_STYLE))
    xlsx.addSymbol(wb, tytle = "Пропущенные значения", style = MISSING_VALUE_STYLE)
  }

   if (outliers == TRUE){
      print("HELOOOOO")
     
     # for (i in length(outliers_ind)){
     #      setCellStyle(names(cells[outliers_ind]), OUTLIERS_STYLE)
     #   }
     #print(is.na(cells[outliers_ind]))
     print(outliers_ind)
     print(cells[outliers_ind])
    
    
     
     #lapply(names(cells[outliers_ind]), function(i) setCellStyle(cells[[i]], MISSING_VALUE_STYLE))
     #xlsx.addSymbol(wb, colIndex = 2, tytle = "Выбросы", style = OUTLIERS_STYLE)
    }
    autoSizeColumn(sheet1, colIndex = c(1:ncol(x)))
# закрепляем строку/строки и 1й столбец
    createFreezePane(sheet1, rowSplit = startR + 1, colSplit = 2, startRow = startR, startColumn = 1)
    saveWorkbook(wb, file)
    print("New workbook was created")
}

xlsx.findMissingValue <- function(x){
  ind <- which(is.na(x), arr.ind = TRUE, useNames = FALSE)
# чтобы проверить работоспособность кода для таблицы без пропусков, измените в след.условии TRUE на FALSE
  if (is.null(ind) == TRUE) {
    xlsx.createBook(x, sheet_out_name, file_out)
  } else {
    ind[,1] <- ind[,1] + 2
    mis_ind <- apply(ind, 1, paste, collapse = ".")
    
    xlsx.findOutliers(x, mis_ind)
    
  }  
}


xlsx.addSymbol <- function(wb, rowIndex = 1, colIndex = 1, tytle, style){
  sheets <- getSheets(wb)
  rows <- createRow(sheets[[1]], rowIndex)
  CellSymbol <- createCell(rows, colIndex)
  setCellValue(CellSymbol[[1]], tytle)
  setCellStyle(CellSymbol[[1]], style) 
}

xlsx.findOutliers <- function(x, mis_ind){
  outliers <- c()
  outliers_row_ind <- c()
  outliers_ind <- c()
  for (i in 1:ncol(x)){
    if (is.numeric(x[[i]]) & length(unique(x[[i]])) > 5){
      outliers <- boxplot.stats(x[[i]])$out
      outliers_row_ind <- which(x[[i]] %in% outliers, arr.ind = T, useNames = F)
      outliers_ind <- append(outliers_ind, values = outer(outliers_row_ind, i+2, paste, sep = "."))
      
    }
  }
  xlsx.createBook(x, sheet_out_name, file_out, missing_value = TRUE, mis_ind, outliers = TRUE, outliers_ind, startR = 2)
}

source_table <- read.csv2(file_in, na.strings = c("", "NA"), stringsAsFactors = FALSE, check.names = FALSE)
xlsx.findMissingValue(source_table)
