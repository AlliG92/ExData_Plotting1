getwd()
setwd("C:/Users/agray/Documents/Coursera Data Science Course/Course Project 1 Exploratory Data Analysis")

datFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- datFile[datFile$Date %in% c('1/2/2007','2/2/2007'), ]

dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(dataSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
