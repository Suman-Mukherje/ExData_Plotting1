# Read the data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset the data for the specified dates
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date column to Date class
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# Combine Date and Time into Datetime
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Set up the plotting layout
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))

# Plot 1
with(data1, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
})

# Plot 2
with(data1, {
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage (volt)", xlab = "")
})

# Plot 3
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'red')
  lines(Sub_metering_3 ~ Datetime, col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Plot 4
with(data1, {
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")
})

# Save the plot as plot4.png
png("plot4.png", width = 800, height = 800)
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))
with(data1, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
})
with(data1, {
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage (volt)", xlab = "")
})
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'red')
  lines(Sub_metering_3 ~ Datetime, col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(data1, {
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")
})
dev.off()
