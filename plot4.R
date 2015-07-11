## Plot3.R
##

## Read in the data file, assuming it's in the current working directory
datafile <- read.table("household_power_consumption.txt", header=TRUE,
                       sep=";", na="?")

## only use the data from 2007-02-01 through 2007-02-02
filter <- datafile$Date == "1/2/2007" | datafile$Date == "2/2/2007"

dataset <- datafile[filter, ]

## convert the date and time values to make a single column
datetime <- paste(dataset$Date, dataset$Time)
dataset$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Draw the plot to plot4.png



png(filename = "plot4.png", width=480,height=480)
par(mfrow = c(2,2))

plot(dataset$DateTime, dataset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

plot(dataset$DateTime, dataset$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")

plot(dataset$DateTime, dataset$Sub_metering_1, type="l", col="black", 
     xlab="", ylab="Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2, col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1)

plot(dataset$DateTime, dataset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()