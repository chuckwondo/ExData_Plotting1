library(sqldf)

df <- read.csv.sql("household_power_consumption.txt", header = TRUE, sep = ';',
                   sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")

par(mfrow = c(1, 1), cex = 0.75)

with(df, hist(Global_active_power, main = "Global Active Power", col = "red",
              xlab = "Global Active Power (kilowatts)"))

dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off()
