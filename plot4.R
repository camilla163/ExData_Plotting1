
##Data File household_power_consumption.txt in Working Directory ##

##Read Data Into R and Subset for the dates 2007-02-01 and 2007-02-02 ##
#date is in month, day, year
data<-read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE) #Read in text file in home directory
data$Date<- as.Date(data$Date, format = "%d/%m/%Y") # convert Date column to date class
subset.data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) # subset based off of the Date
subset.data$Date.Time <-paste(subset.data$Date, subset.data$Time, sep = " ") # Add column with date and time combined
subset.data$Date.Time<- strptime(subset.data$Date.Time,"%Y-%m-%d %H:%M:%S") # Re-format Date.Time as POSIXlt POSIXt class
subset.data$Global_active_power <- as.numeric(subset.data$Global_active_power) # Make sure Global_active_power is numeric
subset.data$Sub_metering_1 <- as.numeric(subset.data$Sub_metering_1) # Make sure Global_active_power is numeric
subset.data$Sub_metering_2 <- as.numeric(subset.data$Sub_metering_2) # Make sure Global_active_power is numeric
subset.data$Sub_metering_3 <- as.numeric(subset.data$Sub_metering_3) # Make sure Global_active_power is numeric

## Create Plot 4 and write to PNG##
png("plot4.png", width=480, height=480, type="quartz") # dev.copy clips the legend, use this instead
par(mfcol = c(2,2), mar=c(5,5,2,2), bg ="lightgrey")
with(subset.data, 
     {xrange <- range(subset.data$Date.Time) #establish ranges
     yrange <- range(subset.data$Global_active_power)
     plot(xrange, yrange, type = "n",
          ylab = "Global Active Power (kilowatts)",
          xlab = NA)
     lines(subset.data$Date.Time,subset.data$Global_active_power) # use lines to avoid point data
     
       xrange <- range(subset.data$Date.Time) #establish ranges
       yrange <- range(subset.data$Sub_metering_1) # base range off of largest values
       plot(xrange, yrange, type = "n",
            ylab = "Energy sub metering",
            xlab = NA)
       lines(subset.data$Date.Time,subset.data$Sub_metering_1)
       lines(subset.data$Date.Time,subset.data$Sub_metering_2, col = "red")
       lines(subset.data$Date.Time,subset.data$Sub_metering_3, col = "blue")
       legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
              lty =(c(1,1,1)), col = c("black","red", "blue"), cex=0.75)
       
       xrange <- range(subset.data$Date.Time) #establish ranges
       yrange <- range(subset.data$Voltage)
       plot(xrange, yrange, type = "n",
            ylab = "Voltage",
            xlab = NA)
       lines(subset.data$Date.Time,subset.data$Voltage) # use lines to avoid point data
       
       xrange <- range(subset.data$Date.Time) #establish ranges
       yrange <- range(subset.data$Global_reactive_power)
       plot(xrange, yrange, type = "n",
            ylab = "Global Reactive Power (kilowatts)",
            xlab = NA)
       lines(subset.data$Date.Time,subset.data$Global_reactive_power) # use lines to avoid point data
      }
     )

dev.off()




