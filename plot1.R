dd<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
x<-paste(dd$Date, dd$Time)
x<-strptime(x, "%d/%m/%Y %H:%M:%S")
#x<-strptime(x, "%Y-%m-%d %H:%M:%S")
dd$Date_New<-x
dd$Date<-as.Date(dd$Date, "%d/%m/%Y")
dd$Global_active_power<-as.numeric(dd$Global_active_power)
tt<-subset(dd, dd$Date == as.Date("2007-02-02") | dd$Date == as.Date("2007-02-01") )
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

hist(tt$Global_active_power, main="Global Active Power", breaks=12, xlab="Global Active Power (kilowatts)", col="red")
dev.off()