# Coursera Data Science : Exploratory Data Analysis
# Project 1: plot3

# load data
rm(list=ls())
consump <- read.table("household_power_consumption.txt",header = T, sep = ";", na.strings="?")

consump$Date <- as.Date(consump$Date, format="%d/%m/%Y")

#filtering out data for specified two days
filter <- subset(consump, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#add new column with Date+Time
filter$DateTime <- strptime(paste(filter$Date, filter$Time), "%Y-%m-%d %H:%M:%S")
filter$DateTime <- as.POSIXct(filter$DateTime)

#plot3
plot(Sub_metering_1 ~ DateTime, data = filter, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ DateTime, data = filter, col = "Red")
lines(Sub_metering_3 ~ DateTime, data = filter, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#store figuer in file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()