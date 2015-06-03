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

# Plot 2
gapData <- as.double(as.character(epc2days$Global_active_power))
timeData <- dmy_hms(paste(as.character(epc2days$Date), " ", as.character(epc2days$Time)))
plot(timeData, gapData, main = "", , ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "l")
fileNamePng <- "plot2.png";
dev.copy(png, filename = fileNamePng);
dev.off ();