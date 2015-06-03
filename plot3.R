# setwd("E:/Users/Hal/Documents/GitHub/Exploratory Data Analysis/ExData_Plotting1")

# Load electric power consumption data
fileNameTxt <- "household_power_consumption.txt"
if (!file.exists(fileNameTxt))
{  urlTxt <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   zipNameTxt <- "exdata-data-household_power_consumption.zip"
   if (!file.exists(zipNameTxt))
   {  download.file(urlTxt, destfile = zipNameTxt)
   }
   unzip(zipNameTxt)
}
epcData <- read.csv(file=fileNameTxt, header=TRUE, sep=";")
tf <- dmy(epcData$Date) == ymd("2007-02-01") | dmy(epcData$Date) == ymd("2007-02-02")
epc2days <- epcData[tf,]
rm(epcData)
rm(tf)

# Plot 3
timeData <- dmy_hms(paste(as.character(epc2days$Date), " ", as.character(epc2days$Time)))
sm1Data <- as.double(as.character(epc2days$Sub_metering_1))
sm2Data <- as.double(as.character(epc2days$Sub_metering_2))
sm3Data <- as.double(as.character(epc2days$Sub_metering_3))
yMin = min(c(min(sm1Data), min(sm2Data), min(sm3Data)))
yMax = max(c(max(sm1Data), max(sm2Data), max(sm3Data)))
xLabTxt = ""
yLabTxt = "Energy sub metering"
plot(timeData, sm1Data, ylim = c(yMin, yMax), main = "", ylab = yLabTxt, xlab = xLabTxt, type = "l")
par(new = TRUE)
plot(timeData, sm2Data, ylim = c(yMin, yMax), ylab = yLabTxt, xlab = xLabTxt, type = "l",
     col = "red")
par(new = TRUE)
plot(timeData, sm3Data, ylim = c(yMin, yMax), ylab = yLabTxt, xlab = xLabTxt, type = "l",
     col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), col = c("black", "red", "blue"))
fileNamePng <- "plot3.png";
dev.copy(png, filename = fileNamePng);
dev.off ();