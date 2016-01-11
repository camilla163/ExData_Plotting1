working.dir<- "/Users/chall/Coursera/ExploratoryDataAnalysis/Week1/Data"
setwd(working.dir)
getwd()

##Data File household_power_consumption.txt in Working Directory ##

##Read Data Into R and Subset for the dates 2007-02-01 and 2007-02-02 ##
#date is in month, day, year
data<-read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE) #Read in text file in home directory
data$Date<- as.Date(data$Date, format = "%d/%m/%Y") # convert Date column to date class
subset.data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) # subset based off of the Date
subset.data$Date.Time <-paste(subset.data$Date, subset.data$Time, sep = " ") # Add column with date and time combined
subset.data$Date.Time<- strptime(subset.data$Date.Time,"%Y-%m-%d %H:%M:%S") # Re-format Date.Time as POSIXlt POSIXt class
subset.data$Global_active_power <- as.numeric(subset.data$Global_active_power) # Make sure Global_active_power is numeric
#class(subset.data$Date.Time)

## Create Plot 2 ##
par(mar = c(4,4,4,2), bg = "lightgrey") # adjust margins & background color
xrange <- range(subset.data$Date.Time) #establish ranges
yrange <- range(subset.data$Global_active_power)
plot(xrange, yrange, type = "n",
        ylab = "Global Active Power (kilowatts)",
        xlab = NA)
lines(subset.data$Date.Time,subset.data$Global_active_power) # use lines to avoid point data

## Copy Plot 2 to PNG File##
dev.copy(png,file = "plot2.png")
dev.off()


