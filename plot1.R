## Plot1.R
## 

## Read in the data file, assuming it's in the current working directory
datafile <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",
                     na.strings = "?", quote='\"')

## convert the date format in the data file
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

## only use the data from 2007-02-01 through 2007-02-02
dataset <- subset(datafile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## don't need the original file, so release from memory
rm(datafile)

## convert date and time formats
datetime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$datetime <- strptime(datetime, format="POSIXct")

## Plot 1 Output
hist(dataset$Global_active_power,main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Create PNG File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



