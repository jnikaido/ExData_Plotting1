## Plot2.R
## 

## Read in the data file, assuming it's in the current working directory
datafile <- read.table("household_power_consumption.txt", header=TRUE,
                       sep=";", na="?")

## only use the data from 2007-02-01 through 2007-02-02
filter <- Date == "1/2/2007" | Date == "2/2/2007"

dataset <- datafile[filter, ]

## convert the date and time values to make a single column
datetime <- paste(Date, Time)
dataset$DateTime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

## Draw the plot to plot2.png
png(filename = "plot2.png", width=480,height=480)
plot(DateTime, globalActivePower, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
