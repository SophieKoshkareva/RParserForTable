#install.packages("xlsx")
require(xlsx)
on.exit()
Sys.setenv(TZ = "Asia/Novosibirsk")
setOldClass("file")
source("D:/Diploma/r_project/File.R")
file <- new("File")
file <- setInputFilePath(file, "D:/Diploma/r_project/data_GABR_PCI ред1..csv") 
file <- setOutputFilePath(file, "D:/Diploma/r_project/data_CABG_PCI_2_coloring.xlsx")
file <- setSheetOutputName(file, "data_CABG_PCI_2")
file <- setFileReportDirectory(file, "D:/Diploma/r_project/")
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
source("D:/Diploma/r_project/DateMisprint.R")
dateMisprint <- new("DateMisprint")

#1
source("D:/Diploma/r_project/Column.R")
source("D:/Diploma/r_project/Discrete.R")
source("D:/Diploma/r_project/Binary.R")
patient <- new("Binary")
patient <- setColumnIndex(patient, 1)
patient<- setValue(patient, c("CABG", "PCI"))
FindErrors(patient, file, misprint)


#2
#!!!!!!!!!
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
#FindErrors(sex, file, misprint)

#3
source("D:/Diploma/r_project/Continuous.R")
age <- new("Continuous")
age <- setColumnIndex(age, 3)
FindErrors(age, file, outlier, misprint)

#4
source("D:/Diploma/r_project/Continuous.R")
weight <- new("Continuous")
weight <- setColumnIndex(weight, 4)
FindErrors(weight, file, outlier, misprint)

#!!!!!!!!
#5
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
FindErrors(diabetes, file, misprint)

#6
source("D:/Diploma/r_project/Discrete.R")
nyhaClass <- new("Discrete")
nyhaClass <- setColumnIndex(nyhaClass, 6)
nyhaClass <- setValue(nyhaClass, c(1, 2, 3, 4))
FindErrors(nyhaClass, file, misprint)

#7
source("D:/Diploma/r_project/Binary.R")
tiaAdcc <- new("Binary")
tiaAdcc <- setColumnIndex(tiaAdcc, 7)
FindErrors(tiaAdcc, file, misprint)

#8
source("D:/Diploma/r_project/Discrete.R")
arterialHypertensionStage <- new("Discrete")
arterialHypertensionStage <- setColumnIndex(arterialHypertensionStage, 8)
arterialHypertensionStage <- setValue(arterialHypertensionStage, c(0, 1, 2, 3))
FindErrors(arterialHypertensionStage, file, misprint)

#9
source("D:/Diploma/r_project/Binary.R")
chronicPulmonaryDisease <- new("Binary")
chronicPulmonaryDisease <- setColumnIndex(chronicPulmonaryDisease, 9)
FindErrors(chronicPulmonaryDisease, file, misprint)

#10
source("D:/Diploma/r_project/Binary.R")
arrhythmia <- new("Binary")
arrhythmia <- setColumnIndex(arrhythmia, 10)
FindErrors(arrhythmia, file, misprint)

#11
source("D:/Diploma/r_project/Binary.R")
previousIntervention <- new("Binary")
previousIntervention <- setColumnIndex(previousIntervention, 11)
FindErrors(previousIntervention, file, misprint)

#12
source("D:/Diploma/r_project/Continuous.R")
euroscore <- new("Continuous")
euroscore <- setColumnIndex(euroscore, 12)
FindErrors(euroscore, file, outlier, misprint)

#13
source("D:/Diploma/r_project/Continuous.R")
stsScore <- new("Continuous")
stsScore <- setColumnIndex(stsScore, 13)
FindErrors(stsScore, file, outlier, misprint)

#14
source("D:/Diploma/r_project/Continuous.R")
peakPressureGradient <- new("Continuous")
peakPressureGradient <- setColumnIndex(peakPressureGradient, 14)
FindErrors(peakPressureGradient, file, outlier, misprint)

#15
source("D:/Diploma/r_project/Continuous.R")
averagePressureGradient <- new("Continuous")
averagePressureGradient <- setColumnIndex(averagePressureGradient, 15)
FindErrors(averagePressureGradient, file, outlier, misprint)

#16
source("D:/Diploma/r_project/Continuous.R")
aorticValveStenosis <- new("Continuous")
aorticValveStenosis <- setColumnIndex(aorticValveStenosis, 16)
FindErrors(aorticValveStenosis, file, outlier, misprint)

#17
source("D:/Diploma/r_project/Discrete.R")
aorticRegurgitation <- new("Discrete")
aorticRegurgitation <- setColumnIndex(aorticRegurgitation, 17)
aorticRegurgitation <- setValue(aorticRegurgitation, c(0, 1, 2))
FindErrors(aorticRegurgitation, file, misprint)

#18
source("D:/Diploma/r_project/Discrete.R")
mitralRegurgitation <- new("Discrete")
mitralRegurgitation <- setColumnIndex(mitralRegurgitation, 18)
mitralRegurgitation <- setValue(mitralRegurgitation, c(0, 1, 2))
FindErrors(mitralRegurgitation, file, misprint)

#19
source("D:/Diploma/r_project/Continuous.R")
ejectionFraction <- new("Continuous")
ejectionFraction <- setColumnIndex(ejectionFraction, 19)
FindErrors(ejectionFraction, file, outlier, misprint)

#20
source("D:/Diploma/r_project/Discrete.R")
anteriorDescendingArtery <- new("Discrete")
anteriorDescendingArtery <- setColumnIndex(anteriorDescendingArtery, 20)
anteriorDescendingArtery <- setValue(anteriorDescendingArtery, c(0, 1, 2))
FindErrors(anteriorDescendingArtery, file, misprint)

#21
source("D:/Diploma/r_project/Discrete.R")
bypassArtery <- new("Discrete")
bypassArtery <- setColumnIndex(bypassArtery, 21)
bypassArtery <- setValue(bypassArtery, c(0, 1, 2))
FindErrors(bypassArtery, file, misprint)

#22
source("D:/Diploma/r_project/Discrete.R")
rightCoronaryArtery <- new("Discrete")
rightCoronaryArtery <- setColumnIndex(rightCoronaryArtery, 22)
rightCoronaryArtery <- setValue(rightCoronaryArtery, c(0, 1, 2))
FindErrors(rightCoronaryArtery, file, misprint)

#23
source("D:/Diploma/r_project/Discrete.R")
leftCoronaryArteryTrunk <- new("Discrete")
leftCoronaryArteryTrunk <- setColumnIndex(leftCoronaryArteryTrunk, 23)
leftCoronaryArteryTrunk <- setValue(leftCoronaryArteryTrunk, c(0, 1, 2))
FindErrors(leftCoronaryArteryTrunk, file, misprint)

#24
#date
source("D:/Diploma/r_project/Dates.R")
interventionDate <- new("Dates")
interventionDate <- setColumnIndex(interventionDate, 24)
#FindErrors(interventionDate, file, misprint)
result_list <- FindErrors(interventionDate, file, misprint, missingValue, unsolvedMisprint)
misprint <- result_list$misprint
missingValue <- result_list$missingValues
unsolvedMisprint <- result_list$unsolvedMisprint
file <- result_list$file

#25
source("D:/Diploma/r_project/Binary.R")
rossProcedure <- new("Binary")
rossProcedure <- setColumnIndex(rossProcedure, 25)
FindErrors(rossProcedure, file, misprint)

#26
source("D:/Diploma/r_project/Continuous.R")
artificialCirculationTime <- new("Continuous")
artificialCirculationTime <- setColumnIndex(artificialCirculationTime, 26)
FindErrors(artificialCirculationTime, file, outlier, misprint)

#27
source("D:/Diploma/r_project/Continuous.R")
peakPressureGradientRepeat <- new("Continuous")
peakPressureGradientRepeat <- setColumnIndex(peakPressureGradientRepeat, 27)
FindErrors(peakPressureGradientRepeat, file, outlier, misprint)

#28
source("D:/Diploma/r_project/Continuous.R")
averagePressureGradientRepeat <- new("Continuous")
averagePressureGradientRepeat <- setColumnIndex(averagePressureGradientRepeat, 28)
FindErrors(averagePressureGradientRepeat, file, outlier, misprint)

#29
source("D:/Diploma/r_project/Discrete.R")
aorticRegurgitationRepeat <- new("Discrete")
aorticRegurgitationRepeat <- setColumnIndex(aorticRegurgitationRepeat, 29)
aorticRegurgitationRepeat <- setValue(aorticRegurgitationRepeat, c(0, 1, 2))
FindErrors(aorticRegurgitationRepeat, file, misprint)

#30
source("D:/Diploma/r_project/Discrete.R")
mitralRegurgitationRepeat <- new("Discrete")
mitralRegurgitationRepeat <- setColumnIndex(mitralRegurgitationRepeat, 30)
mitralRegurgitationRepeat <- setValue(mitralRegurgitationRepeat, c(0, 1, 2))
FindErrors(mitralRegurgitationRepeat, file, misprint)

#31
source("D:/Diploma/r_project/Binary.R")
rhythmDisturbances <- new("Binary")
rhythmDisturbances <- setColumnIndex(rhythmDisturbances, 31)
FindErrors(rhythmDisturbances, file, misprint)

#32
source("D:/Diploma/r_project/Binary.R")
acuteMyocardialInfarction <- new("Binary")
acuteMyocardialInfarction <- setColumnIndex(acuteMyocardialInfarction, 32)
FindErrors(acuteMyocardialInfarction, file, misprint)

#33
source("D:/Diploma/r_project/Binary.R")
repeatedRevascularization <- new("Binary")
repeatedRevascularization <- setColumnIndex(repeatedRevascularization, 33)
FindErrors(repeatedRevascularization, file, misprint)

#34
source("D:/Diploma/r_project/Binary.R")
adcc <- new("Binary")
adcc <- setColumnIndex(adcc, 34)
FindErrors(adcc, file, misprint)

#35
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
FindErrors(death, file, misprint)

#36
source("D:/Diploma/r_project/Binary.R")
masse <- new("Binary")
masse <- setColumnIndex(masse, 36)
FindErrors(masse, file, misprint)

#37
source("D:/Diploma/r_project/Binary.R")
acuteKidneyInjury <- new("Binary")
acuteKidneyInjury <- setColumnIndex(masse, 37)
FindErrors(acuteKidneyInjury, file, misprint)

#38
source("D:/Diploma/r_project/Binary.R")
bleeding <- new("Binary")
bleeding <- setColumnIndex(bleeding, 38)
FindErrors(bleeding, file, misprint)

#39 Discrete or Continuous
source("D:/Diploma/r_project/Error.R")
source("D:/Diploma/r_project/Discrete.R")
shuntsNumber <- new("Discrete")
shuntsNumber <- setColumnIndex(shuntsNumber, 39)
shuntsNumber <- setValue(shuntsNumber, c(0, 1, 2, 3))
FindErrors(shuntsNumber, file, misprint)

#40
source("D:/Diploma/r_project/Binary.R")
stentType <- new("Binary")
stentType <- setColumnIndex(stentType, 40)
stentType <- setValue(stentType, c("bms", "des"))
FindErrors(stentType, file, misprint)

#41
source("D:/Diploma/r_project/Binary.R")
revascularization <- new("Binary")
revascularization <- setColumnIndex(revascularization, 41)
FindErrors(revascularization, file, misprint)

#42 date
source("D:/Diploma/r_project/Dates.R")
dischargeDate <- new("Dates")
dischargeDate <- setColumnIndex(dischargeDate, 42)
FindErrors(dischargeDate, file, misprint)
dateMisprint<- FindDateMisprints(dateMisprint, dischargeDate, interventionDate, file)
#other columns
#file@table_out[[24]] <- as.Date(file@table_out[[24]], format = "%d.%m.%Y", origin = "1899-12-30")
#file@table_out[[24]] <- DataFormat(file@table_out[[24]])
file <- CreateExcelWB(file)

#missingValue@indices <- globalMissing
SetColor(missingValue, file)
#misprint@indices <- globalMisprint
SetColor(misprint, file)
#unsolvedMisprint@indices <- globalUnsolvedMisprint
SetColor(unsolvedMisprint, file)
#outlier@indices <- globalOutlier
SetColor(outlier, file)
SetColor(dateMisprint, file)

file <- SaveExcelWB(file)
# which(sapply(as.Date(file@table_in[[42]], format = "%d.%m.%Y"), is.date), arr.ind = TRUE, useNames = FALSE)
