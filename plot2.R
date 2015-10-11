library(sqldf)

df <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ';',
                   sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
df["Date_time"] <- list(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

par(mfrow = c(1, 1), cex = 0.75)

with(df, plot(Date_time, Global_active_power, type = "l", xlab = "",
              ylab = "Global Active Power (kilowatts)"))

dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()
