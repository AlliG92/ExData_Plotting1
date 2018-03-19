getwd()
setwd("C:/Users/agray/Documents/Coursera Data Science Course/Course Project 1 Exploratory Data Analysis")

datFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- datFile[datFile$Date %in% c('1/2/2007','2/2/2007'), ]

dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(dataSubset$Global_active_power)
grp <- as.numeric(dataSubset$Global_reactive_power)
volt <- as.numeric(dataSubset$Voltage)
subMetering1 <- as.numeric(dataSubset$Sub_metering_1)
subMetering2 <- as.numeric(dataSubset$Sub_metering_2)
subMetering3 <- as.numeric(dataSubset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dateTime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateTime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateTime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()