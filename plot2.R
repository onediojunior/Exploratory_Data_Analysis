## Answer from Exercise 2
## Onedio Junior
## Created 09-15-2019 (Brazilian)
## qui- Thu  | sex - Fri   | sáb - SAT

##Load library
require("dplyr")

##remove the objects in enviroment
rm(list=ls())

##Get directory
getwd()

#Set directory
setwd("C:/Users/User/Documents/Coursera/Course_4/week1")

##Load Data from txt file
data_power <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")
##Show Data
head(data_power)

##Format Date+Time
data_power$Date <- as.Date(data_power$Date, format = "%d/%m/%Y")

##data_load$Time <- as.POSIXct(data_load$Time, format = "%H:%M:%s")

##Subset Data to date ranges provided
data_power_subset <-subset(data_power, data_power$Date >= "2007-02-01" & data_power$Date <= "2007-02-02")

##Combine Date + Time into new column
data_power_subset$TS <- as.POSIXct(paste(data_power_subset$Date, data_power_subset$Time, seperator = " "))

##Output Plot 2 to 480 x 480 png
png("plot2.png", height = 480, width = 480)
plot(data_power_subset$Global_active_power~data_power_subset$TS, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
