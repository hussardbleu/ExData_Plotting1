dat <- fread("household_power_consumption.txt")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat_sub <- dat[Date>="2007-02-01" & Date<="2007-02-02"]
dat_sub$Global_active_power <- as.numeric(dat_sub$Global_active_power)
dat_sub$Sub_metering_1 <- as.numeric(dat_sub$Sub_metering_1)
dat_sub$Sub_metering_2 <- as.numeric(dat_sub$Sub_metering_2)
dat_sub$Sub_metering_3 <- as.numeric(dat_sub$Sub_metering_3)
dat_sub$Voltage <- as.numeric(dat_sub$Voltage)
dat_sub$Global_reactive_power <- as.numeric(dat_sub$Global_reactive_power)
dat_sub$Date_Time <- as.POSIXct(paste(dat_sub$Date, dat_sub$Time, sep=" "), 
                                format="%Y-%m-%d %H:%M:%S")


par(mfrow = c(2, 2)) 

with(dat_sub, {
    plot(Date_Time, Global_active_power,  type="l",
         col="black", ylab="Global Active Power")
    plot(Date_Time, Voltage, xlab="datetime" , type="l",
         col="black",  ylab="Voltage")
    plot(Date_Time, 
         Sub_metering_1, 
         type="l",
         col="black", 
         ylab="Energy sub metering")
    lines(dat_sub$Date_Time, dat_sub$Sub_metering_2, col="red")
    lines(dat_sub$Date_Time, dat_sub$Sub_metering_3, col="blue")
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lwd=1, lty=1)
    plot(Date_Time, Global_reactive_power,  type="l",
         col="black", xlab="datetime", ylab="Global_reactive_power")
})


plot(dat_sub$Date_Time, 
     dat_sub$Sub_metering_1, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="")
lines(dat_sub$Date_Time, dat_sub$Sub_metering_2, col="red")
lines(dat_sub$Date_Time, dat_sub$Sub_metering_3, col="blue")
legend("topright", 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1, lty=1)
dev.copy(png, file = "plot4.png", width=480, height=480) 
dev.off()
