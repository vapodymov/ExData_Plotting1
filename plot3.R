## Plot 3
big_table <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep=";", stringsAsFactors=FALSE)

sub_set <- big_table[big_table$Date %in% c("1/2/2007","2/2/2007"), ]

time_arr <- strptime(paste(sub_set$Date, sub_set$Time, 
                           sep=" "), "%d/%m/%Y %H:%M:%S") 

global_active_power <- as.numeric(sub_set$Global_active_power)

sub_metering_1 <- as.numeric(sub_set$Sub_metering_1)
sub_metering_2 <- as.numeric(sub_set$Sub_metering_2)
sub_metering_3 <- as.numeric(sub_set$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(time_arr, sub_metering_1, type = "l", ylab="Energy Submetering", xlab = "")
lines(time_arr, sub_metering_2, type = "l", col="red")
lines(time_arr, sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()