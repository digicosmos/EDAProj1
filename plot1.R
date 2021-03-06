filename <- "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?")
dataset <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
dataset$Date.Time <- as.POSIXct(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")
dataset$Date = NULL; dataset$Time = NULL
dataset <- dataset[c(8, 1:7)]

png(filename="plot1.png", bg = "transparent")
hist(dataset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")
dev.off()

png(filename="plot2.png", bg = "transparent")
with(dataset, plot(Date.Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.off()

png(filename="plot3.png", bg = "transparent")
with(dataset, {plot(Date.Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", col = "black")
               points(Date.Time, Sub_metering_2, type = "l",  col = "red")
               points(Date.Time, Sub_metering_3, type = "l",  col = "blue")
               legend("topright", names(dataset[,6:8]), col=c("black", "red", "blue"), lty = c(1,1,1))
})
dev.off()

png(filename="plot4.png", bg = "transparent")
par(mfrow = c(2,2))
with(dataset, plot(Date.Time, Global_active_power, type = "l", ylab = "Global Active Power"))
with(dataset, plot(Date.Time, Voltage, type = "l", xlab = "datetime"))
with(dataset, {plot(Date.Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", col = "black")
               points(Date.Time, Sub_metering_2, type = "l",  col = "red")
               points(Date.Time, Sub_metering_3, type = "l",  col = "blue")
               legend("topright", names(dataset[,6:8]), col=c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
})
with(dataset, plot(Date.Time, Global_reactive_power, type = "l"))
dev.off()
