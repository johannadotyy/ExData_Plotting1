
#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?")

#subset data to only include 2007-02-01 and 2007-02-02
data <- subset(data, Date %in% c("01/02/2007", "02/02/2007"))

#create histogram, in red, of global active power
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", 
        xlab = "Global Active Power (kilowatts)", 
        main = "Global Active Power")
dev.off()
