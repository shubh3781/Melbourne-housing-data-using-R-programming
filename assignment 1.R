d<-read.csv( file = 'C:\\Users\\shubh\\Downloads\\melbourne_data.csv', header=TRUE)
str(housing.dataset)
install.packages("tidyverse")
install.packages("plotly")
install.packages("psych")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggthemes")
library(psych)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(plotly)
library(dplyr)


 c<-data.frame(d)
a<- is.na.data.frame(d)
housing.dataset
#View(housing.dataset)
clean <- housing.dataset
housing.dataset <- na.omit(housing.dataset)
#summary(housing.dataset)

#2
table(housing.dataset$Type)
type <- c(6628,726,1541)
labels <- c("H", "T", "U")
pie(type,labels, main = 'House Types',col = c("green", "blue", "red"))


barplot(housing.dataset$Car, xlab = 'car', ylab = 'number of cars', main = 'barchart of cars in one house')



hist(housing.dataset$Price, xlab = 'Price', main = 'histogram of price')



#table(housing.dataset$Price)
#table(housing.dataset$YearBuilt)

input <- housing.dataset[,c( 'Rooms','Bathroom')]
# Give the chart file a name.
png(file = "scatterplotRoomvsBathroom.png")
# Plot the chart
plot(x = input$Rooms,y = input$Bathroom,xlab = "Rooms",ylab = "Bathroom",xlim = c(1,12),ylim = c(1,9),main = "Rooms VS Bathrooms")
# Save the file.
dev.off()

#3A
hist(housing.dataset$Price, xlab = 'price', ylab = 'value', main = 'histogram of price')

mean(housing.dataset$Price)

median(housing.dataset$Price)

var(housing.dataset$Price)

#summary(housing.dataset$Price)


#3b
table(housing.dataset$Price)
summary(housing.dataset$Price)
pricelow <- 640500
pricemed <- 1092524
lowprice <- subset(housing.dataset,Price <= pricelow)
medprice <- subset(housing.dataset,Price <= pricemed)
highprice <- subset(housing.dataset,Price > pricemed)
summary(lowprice)
summary(medprice)
summary(highprice)


#3C
boxplot(housing.dataset$Price~housing.dataset$Type, xlab = 'Price', ylab = 'Type', main = 'Price of diffrent house type')


#3D
hdpc<-data.frame(housing.dataset$Price,housing.dataset$Landsize,housing.dataset$Rooms)
cor(hdpc)



#4
table(housing.dataset$Type)

summary(housing.dataset$Price)
summary(housing.dataset$Landsize)
summary(housing.dataset$Type)

plot(x=housing.dataset$Price, y = housing.dataset$Landsize)


ggplot(housing.dataset, aes(Price, Landsize, color=Price)) + 
  geom_point(size=2)+ theme_classic()

tp <-ggplot(housing.dataset, aes(Type, Price, color=Price)) + 
  geom_point(size=2)+ theme_linedraw()
