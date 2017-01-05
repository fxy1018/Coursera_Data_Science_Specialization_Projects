
# URL
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- getwd()
householdFile <- "./Data/household_power_consumption.txt"

if (!file.exists(householdFile)) {
  download.file(URL, downloadFile)
  unzip(downloadFile, overwrite = T, exdir = "./Data")
}


##load data
plotData <- read.table(householdFile, header=T, sep=";", na.strings="?")
str(plotData)

#get data from the dates 2007-02-01 and 2007-02-02

plotData$Date <- as.Date(plotData$Date, format="%d/%m/%Y")
data <-plotData[(plotData$Date=="2007-02-01") | (plotData$Date=="2007-02-02"),]

## Making Plots

## Generating Plot 1
png("plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off




