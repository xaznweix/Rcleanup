Autosettlement <- read.csv("AutoSettlements_Messy.csv", na.strings=c(""))
which(Autosettlement$AGE >=60 & Autosettlement$GENDER == 1)
AutoSettBackup <- Autosettlement
Autosettlement$SETTNUM <- factor(Autosettlement$SETTNUM)
Autosettlement[!complete.cases(Autosettlement),]
Autosettlement[Autosettlement$SETTNUM == "21", "GENDER"]<- 2
Autosettlement[Autosettlement$SETTNUM == "47", "GENDER"]<- 2
Autosettlement[Autosettlement$SETTNUM == "1128", "GENDER"]<- 1
Autosettlement[Autosettlement$SETTNUM == "2018", "GENDER"]<- 1
Autosettlement[Autosettlement$SETTNUM == "2756", "GENDER"]<- 2
AutosettlementSB.Median<- median(Autosettlement$SEATBELT, na.rm = T)
Autosettlement[is.na(Autosettlement$SEATBELT), "SEATBELT"] <- AutosettlementSB.Median
Engineering <- Autosettlement[Autosettlement$Occupation == "Engineering",]
mean(Engineering$AGE, na.rm = T)
Engineering.Mean <- mean(Engineering$AGE,na.rm = TRUE)
Engineering.Mean
Engineering[Engineering$SETTNUM == "25", "AGE"] <- Engineering.Mean
Autosettlement[Autosettlement$Occupation == "Engineering" & is.na(Autosettlement$Age)]<- Engineering.Mean
Health <- Autosettlement[Autosettlement$Occupation == "Health",]
HealthAge.Mean <- mean(Health$AGE, na.rm = TRUE)
HealthAge.Mean

Autosettlement[Autosettlement$Occupation == "Health" & is.na(Autosettlement$AGE), "AGE"] <- HealthAge.Mean

Insurance <- Autosettlement[Autosettlement$Occupation == "Insurance",]
Insurance.Mean <- mean(Insurance$AGE, na.rm=T)
Insurance.Mean
Autosettlement[Autosettlement$Occupation == "Health", "Age"] <- Insurance.Mean

Banking <-Autosettlement[Autosettlement$Occupation == "Banking", ]
Banking.Mean <- mean(Banking$Age, na.rm = T)
Banking.Mean
Construction <- AutoSett[AutoSett$Occupation == "Construction",]
Construction

ConstructionAge.Mean <- mean(Construction$AGE, na.rm = TRUE)
ConstructionAge.Mean

AutoSett[AutoSett$Occupation == "Construction" & is.na(AutoSett$AGE),
         "AGE"] <- ConstructionAge.Mean
Autosettlement$SETTLEMENT<- gsub("\\$", "", Autosettlement$SETTLEMENT)
Autosettlement$SETTLEMENT<- gsub("dollars", "", Autosettlement$SETTLEMENT)
Autosettlement$SETTLEMENT<- gsub("\\-", "", Autosettlement$SETTLEMENT)

