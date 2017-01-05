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
head(plotData$Date)
data <-plotData[(plotData$Date=="2007-02-01") | (plotData$Date=="2007-02-02"),]

SetTime <-strptime(paste(data$Date, data$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S")
final_data <- cbind(SetTime, data)
final_data$Sub_metering_1 <- as.numeric(as.character(final_data$Sub_metering_1))
final_data$Sub_metering_2 <- as.numeric(as.character(final_data$Sub_metering_2))
final_data$Sub_metering_3 <- as.numeric(as.character(final_data$Sub_metering_3))

## Making Plots

## Generating Plot 2
png("plot3.png")
plot(final_data$SetTime, final_data$Sub_metering_1,type = "l", xlab="", ylab="Energy sub metering")
lines(final_data$SetTime, final_data$Sub_metering_2,col="red")
lines(final_data$SetTime, final_data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off





