library(sqldf)

df <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ';',
                   sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
df["Date_time"] <- list(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(1, 1), cex = 0.75)

with(df, plot(Date_time, Sub_metering_1, type = "l", col = "black", xlab = "",
              ylab = "Energy sub metering"))
with(df, lines(Date_time, Sub_metering_2, col = "red"))
with(df, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = paste0("Sub_metering_", 1:3), lwd = 1,
       col = c("black", "red", "blue"))

dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()
