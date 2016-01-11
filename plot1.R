
##Data File household_power_consumption.txt in Working Directory ##
##Read Data Into R and Subset for the dates 2007-02-01 and 2007-02-02 ##
#date is in month, day, year
data<-read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE) #Read in text file in home directory
class(data$Date)
date <- as.Date(data$Date, format = "%d/%m/%Y") # convert Date column to date class
data<-cbind(date,data) # add date class to dataset
subset.data<- subset(data, date == as.Date("2007-02-01") | date == as.Date("2007-02-02"), select = -Date) # subset based off of the date and remove Date that is a factor
subset.data$Global_active_power <- as.numeric(subset.data$Global_active_power) # for histogram must be numeric class
#class(subset.data$Global_active_power)

## Create Plot 1 ##
par(mar=c(5,5,5,2), bg = "lightgrey") # adjust margins
hist(subset.data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")
## Copy Plot 1 to PNG File##
dev.copy(png,file = "plot1.png")
dev.off()





