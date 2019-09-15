## Answer from Exercise 4
## Onedio Junior
## Created 09-15-2019 (Brazilian)
## qui- Thu  | sex - Fri   | sáb - SAT

## Load library
require("dplyr")

## Remove the objects in enviroment
rm(list=ls())

##Get directory
getwd()

## Set directory
setwd("C:/Users/User/Documents/Coursera/Course_4/week1")

## Load Data from txt file
data_power <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")
## Show Data
head(data_power)

##Format Date+Time
data_power$Date <- as.Date(data_power$Date, format = "%d/%m/%Y")

## Subset Data to date ranges provided
data_power_subset <-subset(data_power, data_power$Date >= "2007-02-01" & data_power$Date <= "2007-02-02")

## Combine Date + Time into new column
data_power_subset$TS <- as.POSIXct(paste(data_power_subset$Date, data_power_subset$Time, seperator = " "))

## Output Plot 4 to 480 x 480 png
png("plot4.png", height = 480, width = 480)

## OutPut Plot4 2 columns and 2 rows
par(mfrow = c(2, 2))

## created Graph
with(data_load_subset, {
    plot(data_power_subset$Global_active_power~data_power_subset$TS, type = "l", ylab = "Global Active Power", xlab = "")
    plot(data_power_subset$Voltage~data_power_subset$TS, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(data_power_subset$Sub_metering_1~data_power_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(data_power_subset$TS, data_power_subset$Sub_metering_2, col = "red")
    lines(data_power_subset$TS, data_power_subset$Sub_metering_3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
    plot(data_power_subset$Global_reactive_power~data_power_subset$TS, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
    
})

dev.off()
