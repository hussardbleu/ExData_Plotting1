
library(data.table)
dat <- fread("household_power_consumption.txt")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat_sub <- dat[Date>="2007-02-01" & Date<="2007-02-02"]
dat_sub$Global_active_power <- as.numeric(dat_sub$Global_active_power)
hist(dat_sub$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     main="Global Active Power", 
     ylim = c(0,1200))