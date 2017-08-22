#install.packages("xlsx")
require(xlsx)

file <- new("File")
file <- Open(file)

globalMissing <- character()
globalMisprint <- character()
globalOutlier <- character()
globalUnsolvedMisprint <- character()

sex <- new("Sex")
FindErrors(sex)
diabetes <- new("Diabetes")
FindErrors(diabetes)
age <- new("Age")
FindErrors(age)
#other columns


missingValue <- new("MissingValue")
missingValue@indices <- globalMissing
SetColor(missingValue, file)

misprint <- new("Misprint")
misprint@indices <- globalMisprint
SetColor(misprint, file)

outlier <- new("Outlier")
outlier@indices <- globalOutlier
SetColor(outlier, file)

