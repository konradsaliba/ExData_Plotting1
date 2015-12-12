data <- read.table('household_power_consumption.txt', header = T, sep = ";", na.strings = "?")
data$Date <- strptime(data$Date, '%d/%m/%Y')

twoday_Data <- subset(data, as.Date(Date) >= as.Date("2007-02-01") & as.Date(Date) <= as.Date("2007-02-02"))
twoday_Data$fullDate <- strptime(paste(twoday_Data$Date, twoday_Data$Time), "%Y-%m-%d %H:%M:%S")

png(file = "plot1.png", width = 480, height = 480)

hist(twoday_Data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()