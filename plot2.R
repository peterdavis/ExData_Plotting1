

setwd("~/data/coursera/exploratory_data_analysis/week1/ExData_Plotting1")


plotData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")


plotset <- plotData[plotData$Date == "2007-02-01" | plotData$Date == "2007-02-02",]

plotset$weekday <- weekdays(plotset$Date)

plotset$Time <- strptime(paste(plotset$Date, plotset$Time), format = "%Y-%m-%d %H:%M:%S")


plotset$Global_active_power <- as.numeric(as.character(plotset$Global_active_power))



png(file = "plot2.png", width = 480, height = 480, units = "px")


plot(plotset$Time, plotset$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type="l"
)

#dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()