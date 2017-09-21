#install.packages("xlsx")
#require(xlsx)
#on.exit()
Sys.setenv(TZ = "Asia/Novosibirsk")
setOldClass("file")
source("D:/Diploma/r_project/File1.R")
source("D:/Diploma/r_project/FileIn.R")
file_in <- new("FileIn")
file_in <- setFilePath(file_in, "D:/Diploma/r_project/data_GABR_PCI ред1..csv") 
file_in <- ReadFileIn(file_in)

source("D:/Diploma/r_project/FileOut.R")
file_out <- new("FileOut")
file_out <- setTableOut(file_out, file_in)
file_out <- setFilePath(file_out, "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx")
file_out <- setExcelSheetName(file_out, "data_CABG_PCI_2")

source("D:/Diploma/r_project/FileReport.R")
file_report <- new("FileReport")
file_report <- setFileReportDirectory(file_report, "D:/Diploma/r_project/")
file_report <- OpenFileReport(file_report)

source("D:/Diploma/r_project/Error.R")
source("D:/Diploma/r_project/MissingValue.R")
missingValue <- new("MissingValue")

source("D:/Diploma/r_project/Misprint.R")
misprint <- new("Misprint")

source("D:/Diploma/r_project/UnsolvedMisprint.R")
unsolvedMisprint <- new("UnsolvedMisprint")

source("D:/Diploma/r_project/Outlier.R")
outlier <- new("Outlier")

source("D:/Diploma/r_project/DateMisprint.R")
dateMisprint <- new("DateMisprint")

#1
source("D:/Diploma/r_project/Column.R")
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
patient <- new("Binary")
patient <- setColumnIndex(patient, 1)
patient<- setValue(patient, c("CABG", "PCI"))
result_list <- FindErrors(patient, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#2
#!!!!!!!!!
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
sex <- new("Binary")
sex <- setColumnIndex(sex, 2)
sex<- setKey(sex,
             list(c("ж",
                    "жен",
                    "женщина",
                    "женский",
                    "female",
                    "f"),
                  c("м",
                    "муж",
                    "мужчина",
                    "мужской",
                    "male",
                    "m")))
result_list <- FindErrors(sex, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file
#!!!!!!!!!!!!!!!!!!!!!!!!
#3
source("D:/Diploma/r_project/Continuous.R")
age <- new("Continuous")
age <- setColumnIndex(age, 3)
result_list <- FindErrors(age, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#4
source("D:/Diploma/r_project/Continuous.R")
weight <- new("Continuous")
weight <- setColumnIndex(weight, 4)
result_list <- FindErrors(weight, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#!!!!!!!!
#5
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
diabetes <- new("Binary")
diabetes <- setColumnIndex(diabetes, 5)
diabetes <- setKey(diabetes,
                   list(c("нет"),
                        c("1 тип",
                          "1тип",
                          "первый",
                          "2 тип",
                          "2тип",
                          "второй",
                          "2")),
                   add = FALSE)
result_list <- FindErrors(diabetes, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#6
source("D:/Diploma/r_project/Discrete.R")
nyhaClass <- new("Discrete")
nyhaClass <- setColumnIndex(nyhaClass, 6)
nyhaClass <- setValue(nyhaClass, c(1, 2, 3, 4))
result_list <- FindErrors(nyhaClass, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#7
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
tiaAdcc <- new("Binary")
tiaAdcc <- setColumnIndex(tiaAdcc, 7)
result_list <- FindErrors(tiaAdcc, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#8
source("D:/Diploma/r_project/Discrete.R")
arterialHypertensionStage <- new("Discrete")
arterialHypertensionStage <- setColumnIndex(arterialHypertensionStage, 8)
arterialHypertensionStage <- setValue(arterialHypertensionStage, c(0, 1, 2, 3))
result_list <- FindErrors(arterialHypertensionStage, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#9
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
chronicPulmonaryDisease <- new("Binary")
chronicPulmonaryDisease <- setColumnIndex(chronicPulmonaryDisease, 9)
result_list <- FindErrors(chronicPulmonaryDisease, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#10
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
arrhythmia <- new("Binary")
arrhythmia <- setColumnIndex(arrhythmia, 10)
result_list <- FindErrors(arrhythmia, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#11
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
previousIntervention <- new("Binary")
previousIntervention <- setColumnIndex(previousIntervention, 11)
result_list <- FindErrors(previousIntervention, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#12
source("D:/Diploma/r_project/Continuous.R")
euroscore <- new("Continuous")
euroscore <- setColumnIndex(euroscore, 12)
result_list <- FindErrors(euroscore, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#13
source("D:/Diploma/r_project/Continuous.R")
stsScore <- new("Continuous")
stsScore <- setColumnIndex(stsScore, 13)
result_list <- FindErrors(stsScore, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#14
source("D:/Diploma/r_project/Continuous.R")
peakPressureGradient <- new("Continuous")
peakPressureGradient <- setColumnIndex(peakPressureGradient, 14)
result_list <- FindErrors(peakPressureGradient, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#15
source("D:/Diploma/r_project/Continuous.R")
averagePressureGradient <- new("Continuous")
averagePressureGradient <- setColumnIndex(averagePressureGradient, 15)
result_list <- FindErrors(averagePressureGradient, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#16
source("D:/Diploma/r_project/Continuous.R")
aorticValveStenosis <- new("Continuous")
aorticValveStenosis <- setColumnIndex(aorticValveStenosis, 16)
result_list <- FindErrors(aorticValveStenosis, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#17
source("D:/Diploma/r_project/Discrete.R")
aorticRegurgitation <- new("Discrete")
aorticRegurgitation <- setColumnIndex(aorticRegurgitation, 17)
aorticRegurgitation <- setValue(aorticRegurgitation, c(0, 1, 2))
result_list <- FindErrors(aorticRegurgitation, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#18
source("D:/Diploma/r_project/Discrete.R")
mitralRegurgitation <- new("Discrete")
mitralRegurgitation <- setColumnIndex(mitralRegurgitation, 18)
mitralRegurgitation <- setValue(mitralRegurgitation, c(0, 1, 2))
result_list <- FindErrors(mitralRegurgitation, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#19
source("D:/Diploma/r_project/Continuous.R")
ejectionFraction <- new("Continuous")
ejectionFraction <- setColumnIndex(ejectionFraction, 19)
result_list <- FindErrors(ejectionFraction, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#20
source("D:/Diploma/r_project/Discrete.R")
anteriorDescendingArtery <- new("Discrete")
anteriorDescendingArtery <- setColumnIndex(anteriorDescendingArtery, 20)
anteriorDescendingArtery <- setValue(anteriorDescendingArtery, c(0, 1, 2))
result_list <- FindErrors(anteriorDescendingArtery, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file
#21
source("D:/Diploma/r_project/Discrete.R")
bypassArtery <- new("Discrete")
bypassArtery <- setColumnIndex(bypassArtery, 21)
bypassArtery <- setValue(bypassArtery, c(0, 1, 2))
result_list <- FindErrors(bypassArtery, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#22
source("D:/Diploma/r_project/Discrete.R")
rightCoronaryArtery <- new("Discrete")
rightCoronaryArtery <- setColumnIndex(rightCoronaryArtery, 22)
rightCoronaryArtery <- setValue(rightCoronaryArtery, c(0, 1, 2))
result_list <- FindErrors(rightCoronaryArtery, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#23
source("D:/Diploma/r_project/Discrete.R")
leftCoronaryArteryTrunk <- new("Discrete")
leftCoronaryArteryTrunk <- setColumnIndex(leftCoronaryArteryTrunk, 23)
leftCoronaryArteryTrunk <- setValue(leftCoronaryArteryTrunk, c(0, 1, 2))
result_list <- FindErrors(leftCoronaryArteryTrunk, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#24
#date
source("D:/Diploma/r_project/Dates.R")
interventionDate <- new("Dates")
interventionDate <- setColumnIndex(interventionDate, 24)
#FindErrors(interventionDate, file, misprint)
result_list <- FindErrors(interventionDate, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#25
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
rossProcedure <- new("Binary")
rossProcedure <- setColumnIndex(rossProcedure, 25)
result_list <- FindErrors(rossProcedure, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#26
source("D:/Diploma/r_project/Continuous.R")
artificialCirculationTime <- new("Continuous")
artificialCirculationTime <- setColumnIndex(artificialCirculationTime, 26)
result_list <- FindErrors(artificialCirculationTime, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#27
source("D:/Diploma/r_project/Continuous.R")
peakPressureGradientRepeat <- new("Continuous")
peakPressureGradientRepeat <- setColumnIndex(peakPressureGradientRepeat, 27)
result_list <- FindErrors(peakPressureGradientRepeat, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#28
source("D:/Diploma/r_project/Continuous.R")
averagePressureGradientRepeat <- new("Continuous")
averagePressureGradientRepeat <- setColumnIndex(averagePressureGradientRepeat, 28)
result_list <- FindErrors(averagePressureGradientRepeat, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint, outlier)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
outlier <- result_list$outliers
file_out <- result_list$file

#29
source("D:/Diploma/r_project/Discrete.R")
aorticRegurgitationRepeat <- new("Discrete")
aorticRegurgitationRepeat <- setColumnIndex(aorticRegurgitationRepeat, 29)
aorticRegurgitationRepeat <- setValue(aorticRegurgitationRepeat, c(0, 1, 2))
result_list <- FindErrors(aorticRegurgitationRepeat, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#30
source("D:/Diploma/r_project/Discrete.R")
mitralRegurgitationRepeat <- new("Discrete")
mitralRegurgitationRepeat <- setColumnIndex(mitralRegurgitationRepeat, 30)
mitralRegurgitationRepeat <- setValue(mitralRegurgitationRepeat, c(0, 1, 2))
result_list <- FindErrors(mitralRegurgitationRepeat, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#31
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
rhythmDisturbances <- new("Binary")
rhythmDisturbances <- setColumnIndex(rhythmDisturbances, 31)
result_list <- FindErrors(rhythmDisturbances, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#32
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
acuteMyocardialInfarction <- new("Binary")
acuteMyocardialInfarction <- setColumnIndex(acuteMyocardialInfarction, 32)
result_list <- FindErrors(acuteMyocardialInfarction, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#33
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
repeatedRevascularization <- new("Binary")
repeatedRevascularization <- setColumnIndex(repeatedRevascularization, 33)
result_list <- FindErrors(repeatedRevascularization, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#34
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
adcc <- new("Binary")
adcc <- setColumnIndex(adcc, 34)
result_list <- FindErrors(adcc, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#35
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
death <- new("Binary")
death <- setColumnIndex(death, 35)
death <- setKey(death,
                list(c("ок",
                       "нет"),
                     c("лет",
                       "2",
                       "да")),
                add = FALSE)
result_list <- FindErrors(death, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#36
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
masse <- new("Binary")
masse <- setColumnIndex(masse, 36)
result_list <- FindErrors(masse, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#37
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
acuteKidneyInjury <- new("Binary")
acuteKidneyInjury <- setColumnIndex(masse, 37)
result_list <- FindErrors(acuteKidneyInjury, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#38
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
bleeding <- new("Binary")
bleeding <- setColumnIndex(bleeding, 38)
result_list <- FindErrors(bleeding, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#39 Discrete or Continuous
#source("D:/Diploma/r_project/Error.R")
source("D:/Diploma/r_project/Discrete.R")
shuntsNumber <- new("Discrete")
shuntsNumber <- setColumnIndex(shuntsNumber, 39)
shuntsNumber <- setValue(shuntsNumber, c(0, 1, 2, 3))
result_list <- FindErrors(shuntsNumber, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#40
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
stentType <- new("Binary")
stentType <- setColumnIndex(stentType, 40)
stentType <- setValue(stentType, c("bms", "des"))
result_list <- FindErrors(stentType, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#41
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
revascularization <- new("Binary")
revascularization <- setColumnIndex(revascularization, 41)
result_list <- FindErrors(revascularization, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file_out <- result_list$file

#42 date
source("D:/Diploma/r_project/Dates.R")
dischargeDate <- new("Dates")
dischargeDate <- setColumnIndex(dischargeDate, 42)
result_list <- FindErrors(dischargeDate, file_in, file_out, file_report, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file <- result_list$file
dateMisprint<- FindDateMisprints(dateMisprint, dischargeDate, interventionDate, file_out, file_report)

CloseFileReport(file_report)

file_out <- CreateExcelWB(file_out, startRow = 2)

#missingValue@indices <- globalMissing
SetColor(missingValue, file_out)
#misprint@indices <- globalMisprint
SetColor(misprint, file_out)
#unsolvedMisprint@indices <- globalUnsolvedMisprint
SetColor(unsolvedMisprint, file_out)
#outlier@indices <- globalOutlier
SetColor(outlier, file_out)
SetColor(dateMisprint, file_out)

file_out <- SaveExcelWB(file_out, freeze = TRUE)

source("D:/Diploma/r_project/SummaryTableFile.R")
sum <- new("SummaryTableFile")
sum <- setFilePath(sum, "D:/Diploma/r_project/sum.xlsx")
sum <- setExcelSheetName(sum, "sum") 
sum <- ColumnsValuesSummaryTable(sum, file_in, only = 10)
# which(sapply(as.Date(file@table_in[[42]], format = "%d.%m.%Y"), is.date), arr.ind = TRUE, useNames = FALSE)
