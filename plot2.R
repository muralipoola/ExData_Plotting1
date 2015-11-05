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
png("plot2.png", width=480, height=480)

# Plot graph
plot(subSetData$DateTime, subSetData$Global_active_power, 
     type="l", 
     ylab='Global Active Power (kilowatts)')

# Close device
dev.off()