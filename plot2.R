data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# Create the plot
with(data1, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
})

# Save the plot as plot2.png
png("plot2.png", width = 480, height = 480)
with(data1, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
})
dev.off()
