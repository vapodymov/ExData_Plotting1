## Plot 1
big_table <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep=";", stringsAsFactors=FALSE)

sub_set <- big_table[big_table$Date %in% c("1/2/2007","2/2/2007"), ]

global_active_power <- as.numeric(sub_set$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()