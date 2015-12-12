data <- read.table('household_power_consumption.txt', header = T, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, '%d/%m/%Y')

twoday_Data <- subset(data, as.Date(Date) >= as.Date("2007-02-01") & as.Date(Date) <= as.Date("2007-02-02"))
twoday_Data$fullDate <- strptime(paste(twoday_Data$Date, twoday_Data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(twoday_Data$fullDate, twoday_Data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(twoday_Data$fullDate, twoday_Data$Global_active_power)

plot(twoday_Data$fullDate, twoday_Data$Voltage, type = "n", xlab = "datetime", ylab = "Global Active Power (kilowatts)")
lines(twoday_Data$fullDate, twoday_Data$Voltage)

plot(twoday_Data$fullDate, twoday_Data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(twoday_Data$fullDate, twoday_Data$Sub_metering_1, col = "black")
lines(twoday_Data$fullDate, twoday_Data$Sub_metering_2, col = "red")
lines(twoday_Data$fullDate, twoday_Data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, col = c("black", "red", "blue"))

plot(twoday_Data$fullDate, twoday_Data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global Reactive Power")
lines(twoday_Data$fullDate, twoday_Data$Global_reactive_power)

dev.off()