#install.packages("xlsx")
require(xlsx)

source("File.R")
file <- new("File")
file <- Open(file)

source("Error.R")
# globalMissing <- character()
# globalMisprint <- character()
# globalOutlier <- character()
# globalUnsolvedMisprint <- character()

source("Column.R")
source("MissingValue.R")
missingValue <- new("MissingValue")
source("Misprint.R")
misprint <- new("Misprint")
source("UnsolvedMisprint.R")
unsolvedMisprint <- new("UnsolvedMisprint")
source("Outlier.R")
outlier <- new("Outlier")

source("Sex.R")
sex <- new("Sex")
FindErrors(sex)

source("Age.R")
age <- new("Age")
FindErrors(age)

source("Weight.R")
weight <- new("Weight")
FindErrors(weight)

source("Diabetes.R")
diabetes <- new("Diabetes")
FindErrors(diabetes)
#other columns

file <- CreateExcelWB(file)

#missingValue@indices <- globalMissing
SetColor(missingValue, file)

#misprint@indices <- globalMisprint
SetColor(misprint, file)

#unsolvedMisprint@indices <- globalUnsolvedMisprint
SetColor(unsolvedMisprint, file)

#outlier@indices <- globalOutlier
SetColor(outlier, file)

file <- SaveExcelWB(file)
