library(sqldf)

df <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ';',
                   sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
df["Date_time"] <- list(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(2, 2), cex = 0.65)

with(df, {
  plot(Date_time, Global_active_power, type = "l", xlab = "",
       ylab = "Global Active Power")
  plot(Date_time, Voltage, type = "l", xlab = "datetime")
  plot(Date_time, Sub_metering_1, type = "l", col = "black", xlab = "",
       ylab = "Energy sub metering")
  lines(Date_time, Sub_metering_2, col = "red")
  lines(Date_time, Sub_metering_3, col = "blue")
  legend("topright", legend = paste0("Sub_metering_", 1:3), lwd = 1,
         col = c("black", "red", "blue"), bty = "n")
  plot(Date_time, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()
