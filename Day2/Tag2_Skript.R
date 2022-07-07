# Tag 2
# Laden die Daten

# Laden -------------------------------------------------------------------
#Strg + Shift + C um alle markierten Zeilen zu kommentieren
load("daten_erster_tag.RData")

data <- read.csv("daten_erster_2.csv")

data2 <- read.csv("daten_erster_1.csv", sep=";", dec=",")
?read.csv
str(data)

#SPSS Daten laden
install.packages("haven")
library("haven")
data3 <- read_spss("Spsskurs.sav")

#Erweiterung für rm()
rm(list = ls()) #löscht das komplette Environment

data <- read.csv("R_Data.csv")


#Indizierung ----
x <- 1:5
x[4]
x[c(1,3,5)]
x[-5]


temp_list <- list(c(1,2,3), c(4,5,6), c(7,8,9))

temp_list[c(1,3)]

#Bei Liste [[]]
temp_vektor <- temp_list[[1]]
temp_vektor[2]
temp_list[[1]][2]

data[1:10,c(1,2,3)]
data[,c("Age","Height")]
data$Age
data[,"Age"]

2:nrow(data)
ncol(data)

#Deskriptive Statistik ----

summary(data)
mean(data[,"Height"])
mean(data$Height)
sd(data$Height)
cor(data$Height, data$Weight)
table(data$Augenfarbe)
table(data$Augenfarbe,data$Haarfarbe)

max(data$Age)

?max
max(data$Age, na.rm = TRUE)

anyNA(data)
is.na(data)
sum(is.na(data))

#NAs entfernen
data2 <- na.omit(data)

#Konvertieren und Filtern ----
summary(data)

#Konvertieren
data$Augenfarbe <- as.factor(data$Augenfarbe)

#Bei konvertieren von Dates muss immer das Format mit angegeben werden z.b. #%d.%m.%Y 
data$AufDat <-  as.Date(data$AufDat, format = "%Y-%m-%d") 
summary(data)

# Filtern mit ==
frauen <- data[data$Sex == 1, c("Sex","Age")]
blonde <- data[data$Haarfarbe == "blond", ]

#Filtern mit %in%
blonde_oder_schwarz <- data[data$Haarfarbe %in% c("blond","schwarz"), ]
table(blonde_oder_schwarz$Haarfarbe)
table(data$Haarfarbe)

#Filtern mit subset
unter_50 <- subset(data, Age < 50)

maenner <- data[data$Sex == 0,]
schwarzhaarige_männer <- maenner[maenner$Haarfarbe == "schwarz",]

# Oder|
männer_und_alle_mit_schwarzen_haaren <- data[data$Sex == 0 | data$Haarfarbe == "schwarz",]

# Und &
schwarzhaarige_männer2<- data[data$Sex == 0 & data$Haarfarbe == "schwarz",]

leute_ohne_schwarze_haare <- data[data$Haarfarbe != "schwarz",]


#Plots ----
plot(data$Weight, data$Height)

boxplot(data$Height)
boxplot(data[data$Sex == 0,"Height"], data[data$Sex == 1,"Height"])

hist(data$Height)

hist(data$Height, probability = TRUE)
lines(density(data$Height))

table(data$Augenfarbe)
barplot(table(data$Augenfarbe))

#Kaplan-Meier
library(survival)
data_vet <- veteran
km_fit <- survfit(Surv(time, status) ~ 1, data=data_vet)
plot(km_fit)
library(survminer)
ggsurvplot(km_fit)
#By treatment
km_fit <- survfit(Surv(time, status) ~ trt, data=data_vet)
plot(km_fit)
ggsurvplot(km_fit)


  #xlim und ylim für Min und Max Axenwerte
barplot(table(data$Augenfarbe), ylim = c(0, 60))

plot(data$Weight, data$Height, xlab = "Gewicht", ylab = "Größe", main = "Größe-Gewicht-Scatterplot")


#Plots mit Befehlen speichern
png(filename = "Test.png", width = 480, height = 480)
barplot(table(data$Augenfarbe), ylim = c(0, 60))
dev.off()
