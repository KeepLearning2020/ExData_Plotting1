# Coursera Data Science : Exploratory Data Analysis
# Project 1: plot2

# load data
rm(list=ls())
consump <- read.table("household_power_consumption.txt",header = T, sep = ";", na.strings="?")

consump$Date <- as.Date(consump$Date, format="%d/%m/%Y")

#filtering out data for specified two days
filter <- subset(consump, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#add new column with Date+Time
filter$DateTime <- strptime(paste(filter$Date, filter$Time), "%Y-%m-%d %H:%M:%S")
filter$DateTime <- as.POSIXct(filter$DateTime)

#plot2
plot(Global_active_power~DateTime, data = filter, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#store figuer in file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()