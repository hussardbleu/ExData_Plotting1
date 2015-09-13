
library(data.table)
if (!file.exists("data.zip")) {
    download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile="data.zip",
                  method="curl")
    unzip("data.zip")  
}
dat <- fread("household_power_consumption.txt")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat_sub <- dat[Date>="2007-02-01" & Date<="2007-02-02"]
dat_sub$Global_active_power <- as.numeric(dat_sub$Global_active_power)
hist(dat_sub$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     main="Global Active Power", 
     ylim = c(0,1200))
dev.copy(png, file = "plot1.png") 
dev.off()