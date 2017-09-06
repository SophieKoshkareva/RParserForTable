#install.packages("xlsx")
require(xlsx)

source("D:/Diploma/r_project/File.R")
file <- new("File")
file <- Open(file)


# globalMissing <- character()
# globalMisprint <- character()
# globalOutlier <- character()
# globalUnsolvedMisprint <- character()

source("D:/Diploma/r_project/Error.R")
source("D:/Diploma/r_project/MissingValue.R")
missingValue <- new("MissingValue")
source("D:/Diploma/r_project/Misprint.R")
misprint <- new("Misprint")
source("D:/Diploma/r_project/UnsolvedMisprint.R")
unsolvedMisprint <- new("UnsolvedMisprint")
source("D:/Diploma/r_project/Outlier.R")
outlier <- new("Outlier")

source("D:/Diploma/r_project/Column.R")
source("D:/Diploma/r_project/Sex.R")
sex <- new("Sex")
FindErrors(sex)

source("D:/Diploma/r_project/Age.R")
age <- new("Age")
FindErrors(age)

source("D:/Diploma/r_project/Weight.R")
weight <- new("Weight")
FindErrors(weight)

source("D:/Diploma/r_project/Diabetes.R")
diabetes <- new("Diabetes")
FindErrors(diabetes)


source("D:/Diploma/r_project/Euroscore.R")
euroscore <- new("Euroscore")
FindErrors(euroscore)
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