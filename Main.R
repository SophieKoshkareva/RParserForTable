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

#1
source("D:/Diploma/r_project/Binary.R")
patient <- new("Binary")
patient <- setColumnIndex(patient, 1)
patient<- setValue(patient, c("CABG", "PCI"))
FindErrors(patient)

#2
source("D:/Diploma/r_project/Column.R")
source("D:/Diploma/r_project/Sex.R")
sex <- new("Sex")
sex <- setColumnIndex(sex, 2)
FindErrors(sex)

#3
source("D:/Diploma/r_project/Age.R")
age <- new("Age")
age <- setColumnIndex(age, 3)
FindErrors(age)

#4
source("D:/Diploma/r_project/Weight.R")
weight <- new("Weight")
weight <- setColumnIndex(weight, 4)
FindErrors(weight)

#5
source("D:/Diploma/r_project/Diabetes.R")
diabetes <- new("Diabetes")
diabetes <- setColumnIndex(diabetes, 5)
FindErrors(diabetes)

#6
source("D:/Diploma/r_project/NyhaClass.R")
nyhaClass <- new("NyhaClass")
nyhaClass <- setColumnIndex(nyhaClass, 6)
FindErrors(nyhaClass)

#7
source("D:/Diploma/r_project/Binary.R")
tiaAdcc <- new("Binary")
tiaAdcc <- setColumnIndex(tiaAdcc, 7)
FindErrors(tiaAdcc)

#8
source("D:/Diploma/r_project/ArterialHypertensionStage.R")
arterialHypertensionStage <- new("ArterialHypertensionStage")
arterialHypertensionStage <- setColumnIndex(arterialHypertensionStage, 8)
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
source("D:/Diploma/r_project/Euroscore.R")
euroscore <- new("Euroscore")
euroscore <- setColumnIndex(euroscore, 12)
FindErrors(euroscore)

#13
source("D:/Diploma/r_project/StsScore.R")
stsScore <- new("StsScore")
stsScore <- setColumnIndex(stsScore, 13)
FindErrors(stsScore)

#14
source("D:/Diploma/r_project/PeakPressureGradient.R")
peakPressureGradient <- new("PeakPressureGradient")
peakPressureGradient <- setColumnIndex(peakPressureGradient, 14)
FindErrors(peakPressureGradient)

#15
source("D:/Diploma/r_project/AveragePressureGradient.R")
averagePressureGradient <- new("AveragePressureGradient")
averagePressureGradient <- setColumnIndex(averagePressureGradient, 15)
FindErrors(averagePressureGradient)

#16
source("D:/Diploma/r_project/AorticValveStenosis.R")
aorticValveStenosis <- new("AorticValveStenosis")
aorticValveStenosis <- setColumnIndex(aorticValveStenosis, 16)
FindErrors(aorticValveStenosis)

#17

#18

#19
source("D:/Diploma/r_project/EjectionFraction.R")
ejectionFraction <- new("EjectionFraction")
ejectionFraction <- setColumnIndex(ejectionFraction, 19)
FindErrors(ejectionFraction)

#20

#21

#22

#23

#24

#25

#26
source("D:/Diploma/r_project/ArtificialCirculationTime.R")
artificialCirculationTime <- new("ArtificialCirculationTime")
artificialCirculationTime <- setColumnIndex(artificialCirculationTime, 26)
FindErrors(artificialCirculationTime)

#27
source("D:/Diploma/r_project/PeakPressureGradientRepeat.R")
peakPressureGradientRepeat <- new("PeakPressureGradientRepeat")
peakPressureGradientRepeat <- setColumnIndex(peakPressureGradientRepeat, 27)
FindErrors(peakPressureGradientRepeat)

#28
source("D:/Diploma/r_project/AveragePressureGradientRepeat.R")
averagePressureGradientRepeat <- new("AveragePressureGradientRepeat")
averagePressureGradientRepeat <- setColumnIndex(averagePressureGradientRepeat, 28)
FindErrors(averagePressureGradientRepeat)

#29

#30

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

#41
source("D:/Diploma/r_project/Binary.R")
revascularization <- new("Binary")
revascularization <- setColumnIndex(revascularization, 41)
FindErrors(revascularization)


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
