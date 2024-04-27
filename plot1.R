# Read Data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")      
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")

# make subset data as per date

subset_data <- data[data$Date >= start_date & data$Date <= end_date, ]

# creating plot

library(ggplot2)
global_active_power <- subset_data$Global_active_power
png("plot1.png", width = 480, height = 480)
histogram <- hist(global_active_power, breaks = 30, col = "red", xlab = "Global Active Power (kilowatt)", ylab = "Frequency", main = "Global Active Power")
dev.off()

