# Read the data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset the data for the specified dates
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date column to Date class
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# Combine Date and Time into Datetime
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Plot Global_active_power, Sub_metering_2, and Sub_metering_3 on the same plot
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Sub Metering (watt-hour)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'red')
  lines(Sub_metering_3 ~ Datetime, col = 'blue')
})

# Add legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save the plot as plot3.png
png("plot3.png", width = 480, height = 480)
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Sub Metering (watt-hour)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'red')
  lines(Sub_metering_3 ~ Datetime, col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
