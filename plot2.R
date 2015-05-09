source("./read_data.R")

plot2 <- function (data) {
    plot(data$Datetime, data$Global_active_power, 
         type="l", 
         xlab="", 
         ylab="Global Active Power (kilowatts)")
}

if (!"hpc_data" %in% ls())
    hpc_data <- read_data()

png("plot2.png", width=480, height=480, units="px")
plot2(hpc_data)
dev.off()