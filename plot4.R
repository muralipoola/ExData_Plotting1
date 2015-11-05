# Read data from input file
inputFile <- './data/household_power_consumption.txt'
data<-read.table(inputFile, header=TRUE, sep=";", na.strings='?', stringsAsFactors=FALSE, dec='.')

# Filter data as per requirement
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Add DateTime column, required for plotting graph
subSetData <- cbind(subSetData,
                    DateTime= strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                                       "%d/%m/%Y %H:%M:%S") )

# Open device for output
png("plot4.png", width=480, height=480)

# Plot graph
par(mfrow=c(2,2))
with(subSetData, {
    plot(DateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power')
    plot(DateTime, Voltage, type='l', xlab='datetime', ylab='Voltage')
    
    plot(DateTime, Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering')
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend("topright", lty=1, col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(DateTime, Global_reactive_power, type='l', xlab='datetime', ylab = 'Global_reactive_power')
})

# Close device
dev.off()