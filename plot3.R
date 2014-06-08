
setwd("~/data/coursera/exploratory_data_analysis/week1/ExData_Plotting1")

# load data
plotData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")

# create subset
plotset <- plotData[plotData$Date == "2007-02-01" | plotData$Date == "2007-02-02",]

# add weekdays
plotset$weekday <- weekdays(plotset$Date)

# conform Time and metering
plotset$Time <- strptime(paste(plotset$Date, plotset$Time), format = "%Y-%m-%d %H:%M:%S")

plotset$Sub_metering_1 <- as.numeric(as.character(plotset$Sub_metering_1))
plotset$Sub_metering_2 <- as.numeric(as.character(plotset$Sub_metering_2))
plotset$Sub_metering_3 <- as.numeric(as.character(plotset$Sub_metering_3))

# write plot directly to file
png(file = "figure/plot3.png", width = 480, height = 480, units = "px")

# create base line plot
with(plotset, plot(Time, Sub_metering_1, ylab = "Energy sub metering",
                   xlab = "",
                   
                   type="l"))

# add lines
with(subset(plotset), lines(Time, Sub_metering_2, col="red"))
with(subset(plotset), lines(Time, Sub_metering_3, col="blue"))

# add legend
legend("topright", col = c("black", "red", "blue"), cex=.9, text.font=1, lty = c(1, 1, 1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px",  res=55)
dev.off()