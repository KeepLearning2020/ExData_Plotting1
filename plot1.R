# Coursera Data Science : Exploratory Data Analysis
# Project 1: plot1

# load data
rm(list=ls())
consump <- read.table("household_power_consumption.txt",header = T, sep = ";", na.strings="?")

consump$Date <- as.Date(consump$Date, format="%d/%m/%Y")

#filtering out data for specified two days
filter <- subset(consump, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#add new column with Date+Time
filter$DateTime <- strptime(paste(filter$Date, filter$Time), "%Y-%m-%d %H:%M:%S")

#plot1
hist(filter$Global_active_power, main = "Global Active Power", xlab = "Gloable Active Power (kilowatts)", col = "Red")

#store figuer in file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()