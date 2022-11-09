# Tag 2

#1. Daten laden
data <- read.csv("R_Data.csv")


# ---- 2. Indizierung ---- 
x <- c(1, 2, 3, 4, 5)
#2.1. Speicher die ersten 3 Elemente von x in einem neuen Vektor
y <- x[1:3]


temp_list <- list(c(1,2,3), c(4,5,6), c(7,8,9))
#2.2. []Gib das erste und dritte Element der Liste als Liste aus
temp_list[c(1,3)]

#2.3. [[]]Gib das zweite Element der Liste als Vektor aus
temp_list[[2]]

#2.4. Gib die Größe der ersten 5 PatientInnen an
data$Height[1:5]
data[c(1,2,3,4,5),"Height"]


# ---- 3. Deskreptive Statistik ---- 

#3.1. Gib die durchschnittliche Größe sowie deren Standardabweichung und Varianz an 
mean(data$Height)
sd(data$Weight)
var(data$Weight)

#3.2. Wie oft kommen die verschiedenen Augenfarben vor?
table(data$Augenfarbe)

#3.3. Wie sehr sind Größe und Gewicht korreliert?
cor(data$Height, data$Weight)

#3.4. Gib das maximale Alter an. Was passiert?
max(data$Age)

#3.5. Teste ob NAs in der Spalte "Alter" vorhanden sind
anyNA(data$Age)
sum(is.na(data$Age))

#3.6. Gib das maximale Alter an. Ignoriere dabei NAs
max(data$Age, na.rm = TRUE)

#new_data <- na.omit(data)

# ---- 4. Konvertieren und Filtern ---- 

#4.1. Konvertiere Augenfarbe und Haarfarbe von Character zu Factor
data$Augenfarbe <- as.factor(data$Augenfarbe)
data$Haarfarbe <- as.factor(data$Haarfarbe)


#4.2. Vergleiche den durschnittlichen Bierkonsum (AufBier) von Patietent in Klinik 1 vs Klinik 2
max(data[data$Klinik == 1,]$AufBier)
max(data[data$Klinik == 2,]$AufBier)


#4.3. Erstelle speichere einen Datensatz mit allen blonden oder braunhaarigen PatientInnen
new_data <- data[data$Haarfarbe %in% c("blond", "braun"),]
new_data <- data[data$Haarfarbe == "blond" | data$Haarfarbe == "braun",]

#4.4. Wie viel Wein trinken Personen mit grünen Augen die älter sind als 50 im Durchschnitt?
mean(data[data$Age > 50 & data$Augenfarbe == "grün",]$AufWein)

#4.5. Durchschnittscholesterin (AufChol) von Patienten aus dem Jahr 1986 vs. aus dem Jahr 1987
mean(data[data$AufDat >= as.Date("1987-01-01", format = "%Y-%m-%d"),]$AufChol)
mean(data[data$AufDat < as.Date("1987-01-01", format = "%Y-%m-%d"),]$AufChol)


# ---- 5. Plots ---- 

#5.1. Erstelle einen Scatterplot vom Bierkonsum und Weinkosum
plot(data$AufBier, data$AufWein)

#5.2. Erstelle einen Boxplot für das Gewicht und einen Boxplot für Gewicht nach Geschlecht
boxplot(data$Weight) 
boxplot(data[data$Sex == 0,]$Weight, data[data$Sex == 1,]$Weight) 

#5.3. Erstelle ein Histogram mit oder ohne density Linie
#Ohne
hist(data$Weight) 
#Mit
hist(data$Weight, probability = T) 
lines(density(data$Weight))

#5.4. Erstelle einen Barplot für Augenfarbe oder Haarfarbe
barplot(table(data$Augenfarbe))

#5.5. Erstelle einen beliebigen Plot mit Beschriftung
plot(data$AufBier, data$AufWein, xlab = "Bier", ylab = "Wein", main = "Scatterplot")

