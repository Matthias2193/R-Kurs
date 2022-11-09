# Tag 2

#1. Daten laden
data <- read.csv("R_Data.csv")



# ---- 2. Indizierung ----
x <- c(1, 2, 3, 4, 5)
#2.1. Speicher die ersten 3 Elemente von x in einem neuen Vektor
neuer_vektor <- x[c(1,2,3)]

temp_list <- list(c(1,2,3), c(4,5,6), c(7,8,9))
#2.2. Gib das erste und dritte Element der Liste als neue Liste aus []
neue_liste <- temp_list[c(1,2)]

#2.3. Gib das zweite Element der Liste als Vektor aus [[]]
temp_list[[2]]

#2.4. Gib die Größe der ersten 5 PatientInnen an
data[1:5,"Height"]




# ---- 3. Deskreptive Statistik ----

#3.1. Gib die durchschnittliche Größe sowie deren Standardabweichung und Varianz an 
mean(data$Height)
sd(data$Height)
var(data$Height)

#3.2. Wie oft kommen die verschiedenen Augenfarben vor?
table(data$Augenfarbe)

#3.3. Wie sehr sind Größe und Gewicht korreliert?
cor(data$Height, data$Weight)

#3.4. Gib das maximale Alter an. Was passiert?


#3.5. Teste ob NAs in der Spalte "Alter" vorhanden sind


#3.6. Gib das maximale Alter an. Ignoriere dabei NAs




# ---- 4. Konvertieren und Filtern ----

#4.1. Konvertiere Augenfarbe und Haarfarbe von Character zu Factor
data$Haarfarbe <- as.factor(data$Haarfarbe)

#4.2. Vergleiche den durschnittlichen Bierkonsum (AufBier) von Patietent in Klinik 1 vs Klinik 2
mean(data[data$Klinik == 1,]$AufBier)
mean(data[data$Klinik == 2,"AufBier"])
#4.3. Erstelle und speichere einen Datensatz mit allen blonden oder braunhaarigen PatientInnen



#4.4. Wie viel Wein trinken Personen mit grünen Augen die älter sind als 50 im Durchschnitt?





# ---- 5. Plots ----

#5.1. Erstelle einen Scatterplot vom Bierkonsum und Weinkosum


#5.2. Erstelle einen Boxplot für das Gewicht und einen Boxplot für Gewicht nach Geschlecht


#5.3. Erstelle ein Histogram mit oder ohne denisty line


#5.4. Erstelle einen Barplot für Augenfarbe oder Haarfarbe


#5.5. Erstelle einen beliebigen Plot mit Beschriftung


