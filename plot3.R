dat <- fread("household_power_consumption.txt")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat_sub <- dat[Date>="2007-02-01" & Date<="2007-02-02"]
dat_sub$Sub_metering_1 <- as.numeric(dat_sub$Sub_metering_1)
dat_sub$Sub_metering_2 <- as.numeric(dat_sub$Sub_metering_2)
dat_sub$Sub_metering_3 <- as.numeric(dat_sub$Sub_metering_3)
dat_sub$Date_Time <- as.POSIXct(paste(dat_sub$Date, dat_sub$Time, sep=" "), 
                                format="%Y-%m-%d %H:%M:%S")

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
dev.copy(png, file = "plot3.png", width=480, height=480) 
dev.off()
