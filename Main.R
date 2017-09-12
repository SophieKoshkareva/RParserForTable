#install.packages("xlsx")
require(xlsx)
Sys.setenv(TZ = "Asia/Novosibirsk")

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

#1
source("D:/Diploma/r_project/Column.R")
source("D:/Diploma/r_project/Binary.R")
patient <- new("Binary")
patient <- setColumnIndex(patient, 1)
patient<- setValue(patient, c("CABG", "PCI"))
FindErrors(patient)

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
                    "m")),
              add = FALSE)
FindErrors(sex)

#3
source("D:/Diploma/r_project/Continuous.R")
age <- new("Continuous")
age <- setColumnIndex(age, 3)
FindErrors(age)

#4
source("D:/Diploma/r_project/Continuous.R")
weight <- new("Continuous")
weight <- setColumnIndex(weight, 4)
FindErrors(weight)

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
FindErrors(diabetes)

#6
source("D:/Diploma/r_project/Discrete.R")
nyhaClass <- new("Discrete")
nyhaClass <- setColumnIndex(nyhaClass, 6)
nyhaClass <- setValue(nyhaClass, c(1, 2, 3, 4))
FindErrors(nyhaClass)

#7
source("D:/Diploma/r_project/Binary.R")
tiaAdcc <- new("Binary")
tiaAdcc <- setColumnIndex(tiaAdcc, 7)
FindErrors(tiaAdcc)

#8
source("D:/Diploma/r_project/Discrete.R")
arterialHypertensionStage <- new("Discrete")
arterialHypertensionStage <- setColumnIndex(arterialHypertensionStage, 8)
arterialHypertensionStage <- setValue(arterialHypertensionStage, c(0, 1, 2, 3))
FindErrors(arterialHypertensionStage)

#9
source("D:/Diploma/r_project/Binary.R")
chronicPulmonaryDisease <- new("Binary")
chronicPulmonaryDisease <- setColumnIndex(chronicPulmonaryDisease, 9)
FindErrors(chronicPulmonaryDisease)

#10
source("D:/Diploma/r_project/Binary.R")
arrhythmia <- new("Binary")
arrhythmia <- setColumnIndex(arrhythmia, 10)
FindErrors(arrhythmia)

#11
source("D:/Diploma/r_project/Binary.R")
previousIntervention <- new("Binary")
previousIntervention <- setColumnIndex(previousIntervention, 11)
FindErrors(previousIntervention)

#12
source("D:/Diploma/r_project/Continuous.R")
euroscore <- new("Continuous")
euroscore <- setColumnIndex(euroscore, 12)
FindErrors(euroscore)

#13
source("D:/Diploma/r_project/Continuous.R")
stsScore <- new("Continuous")
stsScore <- setColumnIndex(stsScore, 13)
FindErrors(stsScore)

#14
source("D:/Diploma/r_project/Continuous.R")
peakPressureGradient <- new("Continuous")
peakPressureGradient <- setColumnIndex(peakPressureGradient, 14)
FindErrors(peakPressureGradient)

#15
source("D:/Diploma/r_project/Continuous.R")
averagePressureGradient <- new("Continuous")
averagePressureGradient <- setColumnIndex(averagePressureGradient, 15)
FindErrors(averagePressureGradient)

#16
source("D:/Diploma/r_project/Continuous.R")
aorticValveStenosis <- new("Continuous")
aorticValveStenosis <- setColumnIndex(aorticValveStenosis, 16)
FindErrors(aorticValveStenosis)

#17
source("D:/Diploma/r_project/Discrete.R")
aorticRegurgitation <- new("Discrete")
aorticRegurgitation <- setColumnIndex(aorticRegurgitation, 17)
aorticRegurgitation <- setValue(aorticRegurgitation, c(0, 1, 2))
FindErrors(aorticRegurgitation)

#18
source("D:/Diploma/r_project/Discrete.R")
mitralRegurgitation <- new("Discrete")
mitralRegurgitation <- setColumnIndex(mitralRegurgitation, 18)
mitralRegurgitation <- setValue(mitralRegurgitation, c(0, 1, 2))
FindErrors(mitralRegurgitation)

#19
source("D:/Diploma/r_project/Continuous.R")
ejectionFraction <- new("Continuous")
ejectionFraction <- setColumnIndex(ejectionFraction, 19)
FindErrors(ejectionFraction)

#20
source("D:/Diploma/r_project/Discrete.R")
anteriorDescendingArtery <- new("Discrete")
anteriorDescendingArtery <- setColumnIndex(anteriorDescendingArtery, 20)
anteriorDescendingArtery <- setValue(anteriorDescendingArtery, c(0, 1, 2))
FindErrors(anteriorDescendingArtery)

#21
source("D:/Diploma/r_project/Discrete.R")
bypassArtery <- new("Discrete")
bypassArtery <- setColumnIndex(bypassArtery, 21)
bypassArtery <- setValue(bypassArtery, c(0, 1, 2))
FindErrors(bypassArtery)

#22
source("D:/Diploma/r_project/Discrete.R")
rightCoronaryArtery <- new("Discrete")
rightCoronaryArtery <- setColumnIndex(rightCoronaryArtery, 22)
rightCoronaryArtery <- setValue(rightCoronaryArtery, c(0, 1, 2))
FindErrors(rightCoronaryArtery)

#23
source("D:/Diploma/r_project/Discrete.R")
leftCoronaryArteryTrunk <- new("Discrete")
leftCoronaryArteryTrunk <- setColumnIndex(leftCoronaryArteryTrunk, 23)
leftCoronaryArteryTrunk <- setValue(leftCoronaryArteryTrunk, c(0, 1, 2))
FindErrors(leftCoronaryArteryTrunk)

#24
#date
source("D:/Diploma/r_project/Dates.R")
interventionDate <- new("Dates")
interventionDate <- setColumnIndex(interventionDate, 24)
FindErrors(interventionDate)

#25
source("D:/Diploma/r_project/Binary.R")
rossProcedure <- new("Binary")
rossProcedure <- setColumnIndex(rossProcedure, 25)
FindErrors(rossProcedure)

#26
source("D:/Diploma/r_project/Continuous.R")
artificialCirculationTime <- new("Continuous")
artificialCirculationTime <- setColumnIndex(artificialCirculationTime, 26)
FindErrors(artificialCirculationTime)

#27
source("D:/Diploma/r_project/Continuous.R")
peakPressureGradientRepeat <- new("Continuous")
peakPressureGradientRepeat <- setColumnIndex(peakPressureGradientRepeat, 27)
FindErrors(peakPressureGradientRepeat)

#28
source("D:/Diploma/r_project/Continuous.R")
averagePressureGradientRepeat <- new("Continuous")
averagePressureGradientRepeat <- setColumnIndex(averagePressureGradientRepeat, 28)
FindErrors(averagePressureGradientRepeat)

#29
source("D:/Diploma/r_project/Discrete.R")
aorticRegurgitationRepeat <- new("Discrete")
aorticRegurgitationRepeat <- setColumnIndex(aorticRegurgitationRepeat, 29)
aorticRegurgitationRepeat <- setValue(aorticRegurgitationRepeat, c(0, 1, 2))
FindErrors(aorticRegurgitationRepeat)

#30
source("D:/Diploma/r_project/Discrete.R")
mitralRegurgitationRepeat <- new("Discrete")
mitralRegurgitationRepeat <- setColumnIndex(mitralRegurgitationRepeat, 30)
mitralRegurgitationRepeat <- setValue(mitralRegurgitationRepeat, c(0, 1, 2))
FindErrors(mitralRegurgitationRepeat)

#31
source("D:/Diploma/r_project/Binary.R")
rhythmDisturbances <- new("Binary")
rhythmDisturbances <- setColumnIndex(rhythmDisturbances, 31)
FindErrors(rhythmDisturbances)

#32
source("D:/Diploma/r_project/Binary.R")
acuteMyocardialInfarction <- new("Binary")
acuteMyocardialInfarction <- setColumnIndex(acuteMyocardialInfarction, 32)
FindErrors(acuteMyocardialInfarction)

#33
source("D:/Diploma/r_project/Binary.R")
repeatedRevascularization <- new("Binary")
repeatedRevascularization <- setColumnIndex(repeatedRevascularization, 33)
FindErrors(repeatedRevascularization)

#34
source("D:/Diploma/r_project/Binary.R")
adcc <- new("Binary")
adcc <- setColumnIndex(adcc, 34)
FindErrors(adcc)

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
FindErrors(death)

#36
source("D:/Diploma/r_project/Binary.R")
masse <- new("Binary")
masse <- setColumnIndex(masse, 36)
FindErrors(masse)

#37
source("D:/Diploma/r_project/Binary.R")
acuteKidneyInjury <- new("Binary")
acuteKidneyInjury <- setColumnIndex(masse, 37)
FindErrors(acuteKidneyInjury)

#38
source("D:/Diploma/r_project/Binary.R")
bleeding <- new("Binary")
bleeding <- setColumnIndex(bleeding, 38)
FindErrors(bleeding)

#39 Discrete or Continuous
source("D:/Diploma/r_project/Error.R")
source("D:/Diploma/r_project/Discrete.R")
shuntsNumber <- new("Discrete")
shuntsNumber <- setColumnIndex(shuntsNumber, 39)
shuntsNumber <- setValue(shuntsNumber, c(0, 1, 2, 3))
FindErrors(shuntsNumber)

#40
source("D:/Diploma/r_project/Binary.R")
stentType <- new("Binary")
stentType <- setColumnIndex(stentType, 40)
stentType <- setValue(stentType, c("bms", "des"))
FindErrors(stentType)

#41
source("D:/Diploma/r_project/Binary.R")
revascularization <- new("Binary")
revascularization <- setColumnIndex(revascularization, 41)
FindErrors(revascularization)

#42 date
source("D:/Diploma/r_project/Dates.R")
dischargeDate <- new("Dates")
dischargeDate <- setColumnIndex(dischargeDate, 42)
FindErrors(dischargeDate)
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
# which(sapply(as.Date(file@table_in[[42]], format = "%d.%m.%Y"), is.date), arr.ind = TRUE, useNames = FALSE)
