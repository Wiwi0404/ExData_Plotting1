df_raw <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

df <- subset(df_raw, Date=="1/2/2007" | Date=="2/2/2007")

df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%OS")

df$Date <- as.Date(df$Date, "%d/%m/%Y")

df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

png(filename = "plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# First plot
plot(df$DateTime, df$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(df$DateTime, df$Global_active_power)

# Second plot
plot(df$DateTime, df$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(df$DateTime, df$Voltage)

# Third plot
plot(df$DateTime, df$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_1, col="black")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

# Fourth plot
plot(df$DateTime, df$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(df$DateTime, df$Global_reactive_power)

dev.off()