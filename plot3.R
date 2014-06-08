
setwd("~/data/coursera/exploratory_data_analysis/week1/ExData_Plotting1")


plotData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")


plotset <- plotData[plotData$Date == "2007-02-01" | plotData$Date == "2007-02-02",]

plotset$weekday <- weekdays(plotset$Date)

plotset$Time <- strptime(paste(plotset$Date, plotset$Time), format = "%Y-%m-%d %H:%M:%S")

plotset$Sub_metering_1 <- as.numeric(as.character(plotset$Sub_metering_1))
plotset$Sub_metering_2 <- as.numeric(as.character(plotset$Sub_metering_2))
plotset$Sub_metering_3 <- as.numeric(as.character(plotset$Sub_metering_3))

png(file = "plot3.png", width = 480, height = 480, units = "px")

with(plotset, plot(Time, Sub_metering_1, ylab = "Energy sub metering",
                   xlab = "",
                   
                   type="l"))

with(subset(plotset), lines(Time, Sub_metering_2, col="red"))
with(subset(plotset), lines(Time, Sub_metering_3, col="blue"))

legend("topright", col = c("black", "red", "blue"), cex=.9, text.font=1, lty = c(1, 1, 1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px",  res=55)
dev.off()