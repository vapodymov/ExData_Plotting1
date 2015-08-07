## Plot 4
big_table <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep=";", stringsAsFactors=FALSE)

sub_set <- big_table[big_table$Date %in% c("1/2/2007","2/2/2007"), ]

time_arr <- strptime(paste(sub_set$Date, sub_set$Time, 
                           sep=" "), "%d/%m/%Y %H:%M:%S") 

global_active_power <- as.numeric(sub_set$Global_active_power)
global_reactive_power <- as.numeric(sub_set$Global_reactive_power)

voltage <- as.numeric(sub_set$Voltage)

sub_metering_1 <- as.numeric(sub_set$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_set$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_set$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(time_arr, global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(time_arr, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(time_arr, sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(time_arr, sub_metering_2, type="l", col="red")
lines(time_arr, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(time_arr, global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()