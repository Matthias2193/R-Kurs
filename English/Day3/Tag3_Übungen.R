#Daten laden
data <- read.csv("R_Data.csv")
data <- data[,1:11]
data$AufDat <- NULL


#1. Statistische Tests ----

#1.1 Benutze einen t-Test um zu prüfen, ob das Durchschnittsalter der PatientInnen größer als 52 ist


#1.2 Prüfe mit einem t-Test ob es einen Unterschied in der Größe zwischen Männern und Frauen gibt


#1.3 Benutze den Chi-Quadrat Test um zu prüfen ob es einen Zusammenhang zwischen Klinik und Geschlecht gibt


#2. Regressionsanalysen ----

#2.1 Führe eine lineare Regression für Größe abhängig von Gewicht, Alter und Klinik durch. Lass dir das Ergebnis anzeigen


#2.2 Erstelle einen Scatterplot mit Gewicht als x und Größe als y und füge die Regressionslinie ein. 
#Tip: Erstelle ein neues Model für die Regressionslinie


#2.3 Die folgende Zeile erstellt eine neue Spalte, die angibt ob ein/e PatientIn Bier trinkt.
#Führe eine logistische Regression für diese neue Spalte abhängig von allen Variablen durch.
data$Bier <- data$AufBier > 0
data$AufBier <- NULL


#2.4 Führe eine ANOVA nach Wahl durch

#3. Packages ----
#3.1 Installiere und lade das Paket "ggplot2"
