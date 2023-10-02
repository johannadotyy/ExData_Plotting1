
#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")

#subset data to only include 2007-02-01 and 2007-02-02
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#create new variable that holds date and time
data$date_time <- paste(data$Date, data$Time, sep = " ")

#class the date_time variable as date and time
data$date_time <- strptime(data$date_time, format = "%d/%m/%Y %H:%M:%S")

#create line plots sub metering, one color for each type 1,2,3
png("plot3.png", width = 480, height = 480)
with(data, plot(date_time, Sub_metering_1, main = "", type = "l", 
                ylab = "Energy Sub Metering", xlab = ""))
with(data, lines(date_time, Sub_metering_2, col = "red"))
with(data, lines(date_time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering3"))
dev.off()