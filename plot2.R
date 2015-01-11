filename <- "household_power_consumption.txt"
df <- read.table(filename, header = TRUE, sep = ";", na.strings = "?")
dataset <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
dataset$Date.Time <- as.POSIXct(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S")
dataset$Date = NULL; dataset$Time = NULL
dataset <- dataset[c(8, 1:7)]

png(filename="plot2.png", bg = "transparent")
with(dataset, plot(Date.Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))
dev.off()