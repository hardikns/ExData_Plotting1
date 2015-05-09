source("./read_data.R")
plot4 <- function (data) {
    # There will be 4 plots in the output 2 x 2
    par(mfrow=c(2,2))
    
    # Plot top left - LineChart Global Active Power v/s DateTime
    plot(data$Datetime, data$Global_active_power, 
         type="l", 
         xlab="", 
         ylab="Global Active Power")
    
    # Plot top right - LineChart Voltage v/s DateTime
    plot(data$Datetime, data$Voltage, 
         type="l", 
         xlab="", 
         ylab="Voltage")

    # Plot bottom left - LineChart Sub metering v/s DateTime
    plot(data$Datetime, data$Sub_metering_1, 
         type="l", 
         xlab="", 
         ylab="Energy sub metering")
    lines(data$Datetime, data$Sub_metering_2, col="RED")
    lines(data$Datetime, data$Sub_metering_3, col="BLUE")
    legend("topright", legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"), col=c("BLACK", "RED", "BLUE"), lty=1, lwd=1, bty = "n")
    
    
    # Plot bottom right - LineChart Global Reactive Power v/s DateTime
    plot(data$Datetime, data$Global_reactive_power, 
         type="l", 
         xlab="", 
         ylab="Global Reactive Power",
         ylim=c(0.0,0.5))
    
}
if (!"hpc_data" %in% ls())
    hpc_data <- read_data()

png("plot4.png", width=480, height=480, units="px")
plot4(hpc_data)
dev.off()