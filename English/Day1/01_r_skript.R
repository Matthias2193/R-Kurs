x <- 3.1415
b <- 4
B = 5
d <- factorial(5)
y <- 3,1415

d

statistikIstToll <- 3.14159265
statistik ist schoen <- 3
statistik_ist_schoen <- 3

?rm
rm(B, b)
B


a <- "Hallo"
b <- 3.1415
d <- as.factor("treatment")
e <- Sys.Date()
f <- TRUE

is.numeric(a)
is.character(a)
is.numeric(b)
is.factor(d)
is.character(d)
d
a
e

is.logical(f)
f

erster_vektor <- c(3.1415, 2, 4, -7)
zweiter_vektor <- c("Hallo", "ich", "bin")
dritter_vektor <- c(erster_vektor, -1)

erste_matrix <- matrix( c(1,2,3,4), nrow = 2, byrow = TRUE)
x <- c(10, 11)
y <- c(12, 13)
neue_erste_matrix <- cbind(erste_matrix, x)
superneue_erste_matrix <- rbind(neue_erste_matrix, y)
y_neu <- c(12, 13, 14)
super_neue_erste_matrix <- rbind(neue_erste_matrix, y_neu)

colnames(erste_matrix)
rownames(super_neue_erste_matrix)
colnames(super_neue_erste_matrix)

unname(super_neue_erste_matrix)

c(3.1415, 5, 1, 2/3) * seq(1, 8, 2)

grosse_liste = list(super_neue_erste_matrix, zweiter_vektor, e)
neue_grosse_liste = c(grosse_liste, list(erster_vektor, dritter_vektor))

erste_dataframe <- data.frame(matrix( c(1,2,3,4), nrow = 2, byrow = TRUE))
zweiter_dataframe <- data.frame(Gruppe = c("c", "t", "t", "c"), Outcome = c(0, 3.48581, 4, 1), Raucher = c(FALSE, TRUE, FALSE, TRUE))
zweiter_dataframe

save(file = "daten_erster_tag.RData", grosse_liste, zweiter_dataframe, zweiter_vektor)


?write.csv
write.table(zweiter_dataframe, file = "daten_erster_1.csv", sep = ";", dec = ",")
write.table(zweiter_dataframe, file = "daten_erster_2.csv", sep = ",", dec = ".", row.names = FALSE)
