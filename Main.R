#install.packages("xlsx")
require(xlsx)

source("File.R")
source("Error.R")
source("MissingValue.R")
source("Misprint.R")
source("UnsolvedMisprint.R")
source("Outlier.R")
source("Column.R")
source("Sex.R")
source("Age.R")
source("Weight.R")
source("Diabetes.R")


file <- new("File")
file <- Open(file)

globalMissing <- character()
globalMisprint <- character()
globalOutlier <- character()
globalUnsolvedMisprint <- character()

missingValue <- new("MissingValue")
misprint <- new("Misprint")
unsolvedMisprint <- new("UnsolvedMisprint")
outlier <- new("Outlier")

sex <- new("Sex")
FindErrors(sex)

age <- new("Age")
FindErrors(age)

weight <- new("Weight")
FindErrors(weight)

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
