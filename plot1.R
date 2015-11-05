# Read data from input file
inputFile <- './data/household_power_consumption.txt'
data<-read.table(inputFile, header=TRUE, sep=";", na.strings='?', stringsAsFactors=FALSE, dec='.')

# Filter data as per requirement
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Open device for output
png("plot1.png", width=480, height=480)

# Plot graph
hist(subSetData$Global_active_power, col='red', 
     xlab='Global Active Power (kilowatts)', 
     ylab='Frequency', 
     main='Global Active Power')

# Close device
dev.off()
