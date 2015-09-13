library(data.table)
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
    download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile="getdata-projectfiles-UCI HAR Dataset.zip",
                  method="curl")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")  
}

dat <- fread("household_power_consumption.txt")
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")
dat_sub <- dat[Date>="2007-02-01" & Date<="2007-02-02"]
dat_sub$Global_active_power <- as.numeric(dat_sub$Global_active_power)
dat_sub$Date_Time <- as.POSIXct(paste(dat_sub$Date, dat_sub$Time, sep=" "), 
                            format="%Y-%m-%d %H:%M:%S")

plot(dat_sub$Date_Time, 
     dat_sub$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.copy(png, file = "plot2.png", width=480, height=480) 
dev.off()

