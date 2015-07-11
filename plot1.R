## Plot1.R
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

## Plot 1 Output


## Create PNG File
png(file="plot1.png",height=480,width=480)
hist(dataset$Global_active_power,main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()



