  c <- data.frame()
  data.frame.names <- names(file@table_in)
  for (i in 1:ncol(file@table_in))
  {
    a <-table(file@table_in[[i]])
    unique_sum <-length(a)
    a <- as.data.frame(a)
    a <- t.data.frame(a)
    a <-as.data.frame.matrix(a, stringsAsFactors = FALSE)
    if (unique_sum > 10) a<- a[,1:10]
    c <- rbind.fill(c,a)
  }

  for(j in 1:length(data.frame.names))
  {
    for (i in seq(1, nrow(c)+length(data.frame.names), by=3))
    { 
      print(c[seq(i+1,nrow(c)+1),])
      c[seq(i+1,nrow(c)+1),] <- c[seq(i,nrow(c)),]
      c[i,] <- c(data.frame.names[j], rep(NA, ncol(c)-1))
      j <- j+1
    }
  break
  }

  for(i in 1:ncol(c))
  {
    ind <- which(grepl("^(\\d)+([,.](\\d)+)?$", c[[i]]), arr.ind = T, useNames = F)
    c[[i]] <- gsub("[,]|[-/]", ".", c[[i]])
    c[[i]][ind]<- as.numeric(c[[i]][ind])
  }

require("xlsx")
wb <- createWorkbook(type = "xlsx")
sheet <- createSheet(wb, "sheet1")

ALL_CELLS_STYLE <- CellStyle(wb) +
   Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT")) +
  Alignment(wrapText = TRUE, horizontal = "ALIGN_CENTER") 
TITLE_STYLE <- ALL_CELLS_STYLE +
  Font(wb, isBold = TRUE) 

addDataFrame(c,
             sheet,
             row.names = FALSE,
             startRow = 1,
             startColumn = 1, col.names = FALSE)

allrows <- getRows(sheet, rowIndex = 1:nrow(c))
allcells <- getCells(allrows, colIndex = 1:ncol(c))
title_rows <- allrows[seq(1, length(allrows), 3)]
title_cells <- getCells(title_rows, colIndex = 1:ncol(c))

for (i in 1:length(allcells))
{
  setCellStyle(allcells[[i]], ALL_CELLS_STYLE)
}

for (i in seq(1, nrow(c), 3))
{
  addMergedRegion(sheet, i, i, 1, 10)
}
for(i in 1:length(title_cells))
{
  setCellStyle(title_cells[[i]], TITLE_STYLE)
}
  autoSizeColumn(sheet, colIndex = c(1:ncol(c)))
  saveWorkbook(wb, "D:/Diploma/r_project/1.xlsx" )
