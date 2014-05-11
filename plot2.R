
setwd("~/data/coursera/exploratory_data_analysis/week1/ExData_Plotting1")


plotData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")

plotData$Time <- strptime(plotData$Time, format = "%H:%M:%S")

plotset <- plotData[plotData$Date == "2007-02-01",]
plotset <- rbind(plotset, plotData[plotData$Date == "2007-02-02",])

plotset$Global_active_power <- as.numeric(plotset$Global_active_power)

plot(plotset$Time, plotset$Global_active_power/1000,
ylab = "Global Active Power (kilowatts)",
xlab = "",
type="l"
)

dev.copy(png, file = "plot2.png")
dev.off()