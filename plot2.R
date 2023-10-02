
#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")

#subset data to only include 2007-02-01 and 2007-02-02
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#create new variable that holds date and time
data$date_time <- paste(data$Date, data$Time, sep = " ")

#class the date_time variable as date and time
data$date_time <- strptime(data$date_time, format = "%d/%m/%Y %H:%M:%S")

#create line plot with date/time on bottom, global active power on side
png("plot2.png", width = 480, height = 480)
plot(data$date_time, data$Global_active_power, 
        ylab = "Global Active Power (kilowatts)", 
        type = "l", xlab = "")
dev.off()
