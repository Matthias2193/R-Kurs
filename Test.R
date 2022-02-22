# data <- data.frame(sex = c(rep("m",500), rep("w",500)))
# data$height <- c(rnorm(500, 180,5), rnorm(500, 166, 5))
# data$weight <- c(rnorm(500, 88,5), rnorm(500, 166, 5))
# temp_data <- rbind(data.frame(mvrnorm(500,c(180,88), Sigma = matrix(c(25,12,12,25),nrow=2))),
#                    data.frame(mvrnorm(500,c(166,71), Sigma = matrix(c(25,12,12,25),nrow=2))))
# plot(temp_data$X1, temp_data$X2)
# data$height <- temp_data$X1
# data$weight <- temp_data$X2
# data$age <- round(runif(1000, 25, 80),0)
# data$hair_color <- sample(c("blonde", "black", "brown"), 1000, replace = T)
# data$smoker <- rbinom(1000,1,.2)
# data$smoker <- ifelse(data$smoker == 1, TRUE, FALSE)
# data$no_cigarettes <- 0
# data[data$smoker == T,]$no_cigarettes <- round(rnorm(sum(data$smoker == T),7,2),0)
# data$bmi = data$weight/(data$height/100)^2
# get_hypertension <- function(x){
#   #typeof(x["smoker"])
#   chance <- (as.numeric(x["age"])/360 + as.logical(x["smoker"])*0.30 + 
#                as.numeric(x["no_cigarettes"])*0.035 + (x["sex"] == "m") * 0.35 +
#                as.numeric(x["bmi"])/30 - 1.4)
#   if(chance > 1){
#     chance <- 1
#   } else if(chance < 0){
#     chance <- 0
#   }
#   return(rbinom(1,1,chance))
# }
# data$hypertension <- apply(data, get_hypertension, MARGIN = 1)
# mean(data$hypertension)
# model <- glm(hypertension~., data = data, family = "binomial")
# summary(model)
# 
# model <- lm(weight~., data = data)
# summary(model)
# cor(data$weight, data$height)
# save(data, file = "data.RData")
# write.csv(data, file = "data.csv")


# Day 1

#spss_data <- read_sav("Spsskurs.sav")
data <- read.csv("SPSS_Data.csv")


library(mvtnorm)
library(tidyverse)
data("iris")
data <- data.frame(Numeric = seq(1,100))
data$Factor <- as.factor(rep(c("a","b","c","d"), 25))
data$Character <- rep(c("e","f","g","h","i"), 20)
data$Logical <- rep(c(T, F),50)
data$Date <- seq(as.Date("01/01/2022",format = "%d/%m/%Y"), as.Date("01/01/2022",format = "%d/%m/%Y")+99, by=1)
summary(data)
data
head(data)

table(data[, c("Factor", "Character")])
quantile(data$Numeric,0.1)

temp_list <- list(c(1,2,3),c("a", "b", "c"))
temp_list[[1]]

#Plots

norm_sample <- data.frame(rmvnorm(n=100, mean=c(1,1), sigma = matrix(c(1,.5,.5,1), nrow = 2)))

plot(data$AufKGr, data$AufKGew)

boxplot(AufKGr ~ VAR0003, data) 

hist(data$AufKGew) 

hist(data$AufKGew, probability = T) 
lines(density(data$AufKGew))


#data <- data %>% group_by(Spalte2) %>% summarise(Spalte1 = sum(Spalte1))
barplot(summary(as.factor(data$Klinik)))

plot(data$AufKGr, data$AufKGew, xlab = "Größe", ylab = "Gewicht", main = "Scatterplot")

#Statistical Tests
?t.test
t.test(rnorm(100, 0.5))
t.test(rnorm(200, 0.5),rnorm(200, 0.3), alternative = "greater")


?chisq.test
x <- sample(c("red","black","blue"), 200, replace = TRUE)
y <- sample(c("Sportscar", "SUV", "Sedan"), 200, replace = TRUE)

data <- data.frame(color = x, car = y)
table(data)
chisq.test(data$color,data$car)


?aov
data <- data.frame(top_speed = c(rnorm(100, 330, 20), rnorm (100, 200, 20), rnorm(100, 240, 20)))
data$car_type <- c(rep("Sportscar", 100), rep("SUV", 100), rep("Sedan", 100))
data$color <- sample(c("red","black","blue"), 300, replace = T)

one.way <- aov(top_speed ~ car_type, data = data)
summary(one.way)

two.way <- aov(top_speed~., data = data)
summary(two.way)

interaction <- aov(top_speed~ car_type*color, data = data)
summary(interaction)

#Regression

linear_data <- data.frame(x = seq(0,100,by = 4))
linear_data$y <- 2*linear_data$x + rnorm(26, mean = 0, sd = 10)
model <- glm(y~., data = linear_data)
plot(linear_data$x, linear_data$y)
abline(model)
summary(model)


logistic_data <- data.frame(x = runif(200, min = 0, max = 1))
logistic_data$y <- 1/(1+exp(.1*logistic_data$x))+rnorm(200,mean = 0, sd = 0.0035)
logistic_data$y <- (logistic_data$y - min(logistic_data$y))/max(logistic_data$y)
logistic_data$y <- logistic_data$y + 0.5 - mean(logistic_data$y)
logistic_data$y <- round(logistic_data$y)
model <- glm(y~., data = logistic_data, family = binomial)

summary(model)

newdat <- data.frame(x=seq(min(logistic_data$x), max(logistic_data$x),len=100))
newdat$y = predict(model, newdata=newdat, type="response")
plot(y~x, data=logistic_data)
lines(y ~ x, newdat)


#Apply

data <- matrix(seq(1,16,1),ncol = 4)
apply(data, 1, sum)
apply(data, 2, sum)

lapply(c("A","B","C"), tolower)

sapply(c(-1, 2, -3), abs)
l <- list(a = 1:10, b = 1:20) 
sapply(l, mean)

data <- data.frame(Sex = as.factor(c(rep("M",100), rep("W",100))))
data$Height <- c(rnorm(100,180,5),rnorm(100,166,4))
tapply(data$Height, data$Sex, mean)
