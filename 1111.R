require(xlsx)
cols <- sample(c(1:5), 1) # number of columns to vary to mimic this unknown
label <- rep(paste0("label ", seq(from=1, to=10)))
mydata <- data.frame(label)
for (i in 1:cols) {
  mydata[,i+1] <- sample(c(1:10), 10)
}
# exporting data.frame to excel is easy with xlsx package
sheetname <- "mysheet"
write.xlsx(mydata, "mydata.xlsx", sheetName=sheetname)
file <- "mydata.xlsx"
# but we want to highlight cells if value greater than or equal to 5
wb <- loadWorkbook(file)              # load workbook
fo <- Fill(foregroundColor="yellow")  # create fill object
cs <- CellStyle(wb, fill=fo)          # create cell style
sheets <- getSheets(wb)               # get all sheets
sheet <- sheets[[sheetname]]          # get specific sheet
rows <- getRows(sheet, rowIndex=2:(nrow(mydata)+1))     
               
cells <- getCells(rows, colIndex = 3:(cols+3)) 

                # in the wb I import with loadWorkbook, numeric data starts in column 3
                # and the first two columns are row number and label number
                
values <- lapply(cells, getCellValue) 

                
                highlight <- "test"
                for (i in names(values)) {
                  x <- as.numeric(values[i])
                  if (x >=5 & !is.na(x)) {
                    highlight <- c(highlight, i)
                  }    
                }
                highlight <- highlight[-1]
                
                lapply(names(cells[highlight]),
                       function(ii)setCellStyle(cells[[ii]],cs))
                
                saveWorkbook(wb, file)