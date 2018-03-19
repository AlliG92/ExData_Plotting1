getwd()
setwd("C:/Users/agray/Documents/Coursera Data Science Course/Course Project 1 Exploratory Data Analysis")

datFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- datFile[datFile$Date %in% c('1/2/2007','2/2/2007'), ]

gap <- as.numeric(dataSubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

