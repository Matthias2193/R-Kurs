#Daten laden
data <- read.csv("R_Data.csv")

hist(data$Age)

hist(data$Age, probability = T)
lines(density(data$Age, na.rm =T))

#Ein-Stichprobenfall
t.test(data$Age)

t.test(data$Age, mu = 52, alternative = "greater")

#Zwei-Stichproben
t.test(data[data$Klinik == 1, "Age"], data[data$Klinik == 2, "Age"])

table(data[,c("Augenfarbe","Haarfarbe")])


chisq.test(data$Augenfarbe, data$Haarfarbe)


?fisher.test

#Lineare Regression
model <- lm(Weight~Age + Sex + Height + Klinik, data = data)
model <- lm(as.formula("Weight~Age + Sex + Height + Klinik"), data = data)
summary(model)
summary(lm(Weight~Age + Sex + Height + Klinik, data = data))

#Ohne Intercept
summary(lm(Weight~0 + Age + Sex + Height + Klinik, data = data))

#Quadratische Variable und Interaktionen
model <- lm(Weight~Age + Sex*Height + I(Height^2) + Klinik, data = data)
summary(model)

model <- lm(Weight~Age + Sex:Height + I(Height^2) + Klinik, data = data)
summary(model)

?formula


#Regressionsplot
plot(data$Height, data$Weight)
plot_model <- lm(Weight~Height, data = data)
abline(plot_model)

#Logistische Regression
data$AufDat <- NULL
logistic_model <- glm(Sex~., data = data[,2:10], family = binomial)
summary(logistic_model)


#ANOVA
#One-Way
one_way <- aov(Height~Haarfarbe, data = data)
summary(one_way)

#Two-Way
two_way <- aov(Height~Haarfarbe + Augenfarbe, data = data)
summary(two_way)

#Interaction
interaction_model <- aov(Height~Haarfarbe*Augenfarbe, data = data)
summary(interaction_model)

interaction_model <- aov(Height~Haarfarbe:Augenfarbe, data = data)
summary(interaction_model)

#Eta-Squared Berechnung
install.packages("lsr")
library("lsr")
etaSquared(one_way)

#Stepwise 
#Wird benutzt zur Variableselektion 
?step
#Nur Spalten 2 bis 10
data <- data[,2:10]
#Entferne NAs
data <- na.omit(data)

model <- lm(Weight~Age + Sex + Height + Klinik, data = data)
step(model, direction = "backward")


step(model, direction = "both")


#Pakete installieren
install.packages("haven")
temp_data <- read_spss("spsskurs.sav")

library("haven")
help(package = "haven")
temp_data <- read_spss("spsskurs.sav")


#Mehrere Funktionen mit dem selben Namen aus verschiedenen Paketen
library(tidyverse)
?filter
#Paketname::Funktionsname um Funktion aus einem bestimmten Paket zu verwenden
stats::filter()

