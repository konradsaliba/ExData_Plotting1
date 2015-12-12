data <- read.table('household_power_consumption.txt', header = T, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, '%d/%m/%Y')

twoday_Data <- subset(data, as.Date(Date) >= as.Date("2007-02-01") & as.Date(Date) <= as.Date("2007-02-02"))
twoday_Data$fullDate <- strptime(paste(twoday_Data$Date, twoday_Data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)

plot(twoday_Data$fullDate, twoday_Data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(twoday_Data$fullDate, twoday_Data$Global_active_power)

dev.off()