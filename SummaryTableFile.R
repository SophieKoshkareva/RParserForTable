require("plyr")
SummaryTableFile <- setClass("SummaryTableFile",
  contains = "FileOut"
)

setGeneric(name = "ColumnsValuesSummaryTable", 
  def = function(theObject, myfile)
  {
    standardGeneric("ColumnsValuesSummaryTable")
  }
)
setMethod(f = "ColumnsValuesSummaryTable",
  signature = "SummaryTableFile",
  definition = function(theObject, myfile)
  { 
    table_in_names <- colnames(myfile@table_in)
    for (i in 1:ncol(myfile@table_in))
    {
      tmp <- table(myfile@table_in[[i]])
      unique_sum <- length(tmp)
      tmp <- as.data.frame(tmp)
      tmp <- t.data.frame(tmp)
      tmp <- as.data.frame.matrix(tmp, stringsAsFactors = FALSE)
      if (unique_sum > 10) tmp <- tmp[,1:10]
      theObject@table_out <- rbind.fill(theObject@table_out,tmp)
    }
    
    theObject@table_out[1, ] <- c("Only first ten values", rep(NA, ncol(theObject@table_out)-1))
    for(j in 1:length(table_in_names))
    {
      for (i in seq(2, nrow(theObject@table_out) + length(table_in_names), by=3))
      { 
        #print(theObject@table_out[seq(i+1,nrow(theObject@table_out)+1),])
        theObject@table_out[seq(i + 1,nrow(theObject@table_out) + 1),] <- theObject@table_out[seq(i,nrow(theObject@table_out)),]
        theObject@table_out[i,] <- c(table_in_names[j], rep(NA, ncol(theObject@table_out) - 1))
        j <- j + 1
      }
      break
    }
    
    theObject <- CreateExcelWB(theObject, colnames = FALSE, startRow = 1)  
    
    ALL_CELLS_STYLE <- CellStyle(theObject@wb) +
                       Border(position = c("BOTTOM", "LEFT", "TOP", "RIGHT")) +
                       Alignment(wrapText = TRUE, horizontal = "ALIGN_CENTER") 
    
    TITLE_STYLE <- ALL_CELLS_STYLE +
                   Font(theObject@wb, isBold = TRUE) 
    
    allrows <- getRows(theObject@sheet, rowIndex = 1:nrow(theObject@table_out))
    allcells <- getCells(allrows, colIndex = 1:ncol(theObject@table_out))
    title_rows <- allrows[seq(2, length(allrows), 3)]
    title_cells <- getCells(title_rows, colIndex = 1:ncol(theObject@table_out))
    
    
    for (i in 1:length(allcells))
    {
      setCellStyle(allcells[[i]], ALL_CELLS_STYLE)
    }
    
    addMergedRegion(theObject@sheet, 1, 1, 1, 10)
    for (i in seq(2, nrow(theObject@table_out), 3))
    {
      addMergedRegion(theObject@sheet, i, i, 1, 10)
    }
    
    for(i in 1:length(title_cells))
    {
      setCellStyle(title_cells[[i]], TITLE_STYLE)
    }
    
    theObject <- SaveExcelWB(theObject)      
    return(theObject)
  }
)