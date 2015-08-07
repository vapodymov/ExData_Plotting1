## Plot 2
big_table <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep=";", stringsAsFactors=FALSE)

sub_set <- big_table[big_table$Date %in% c("1/2/2007","2/2/2007"), ]

time_arr <- strptime(paste(sub_set$Date, sub_set$Time, 
                            sep=" "), "%d/%m/%Y %H:%M:%S") 

global_active_power <- as.numeric(sub_set$Global_active_power)

png("plot2.png", width=480, height=480)
plot(time_arr, global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()