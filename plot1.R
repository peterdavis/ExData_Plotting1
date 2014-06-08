
setwd("~/data/coursera/exploratory_data_analysis/week1/ExData_Plotting1")

# load data
plotData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")

#create subset
plotset <- plotData[plotData$Date == "2007-02-01" | plotData$Date == "2007-02-02",]

# transform active power
plotset$Global_active_power <- as.numeric(as.character(plotset$Global_active_power))

#write to file directly to avoid copy issues
png(file = "figure/plot1.png", width = 480, height = 480, units = "px")

#create plot
hist(plotset$Global_active_power,
xlab = "Global Active Power (kilowatts)",
col = "red",
main = "Global Active Power"
)

# dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

dev.off()