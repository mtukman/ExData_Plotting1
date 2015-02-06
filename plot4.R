dd<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

x<-paste(dd$Date, dd$Time)

x<-strptime(x, "%d/%m/%Y %H:%M:%S")

dd$Date_New<-x
dd$Date<-as.Date(dd$Date, "%d/%m/%Y")
dd$Global_active_power<-as.numeric(dd$Global_active_power)
dd$Sub_metering_1<-as.numeric(dd$Sub_metering_1)
dd$Sub_metering_2<-as.numeric(dd$Sub_metering_2)
dd$Sub_metering_3<-as.numeric(dd$Sub_metering_3)

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

par(mfrow=c(2,2))

tt<-subset(dd, dd$Date == as.Date("2007-02-02") | dd$Date == as.Date("2007-02-01") )
sub1<-subset(tt, !is.na(tt$Sub_metering_1))
sub2<-subset(tt, !is.na(tt$Sub_metering_2))
sub3<-subset(tt, !is.na(tt$Sub_metering_3))
sub4<-subset(tt, !is.na(tt$Voltage))
sub5<-subset(tt, !is.na(tt$Global_reactive_power))

plot(tt1$Date_New, tt1$Global_active_power, ylab="Global Active Power (Kilowatts)", xlab="", type ="l")
plot(sub4$Date_New, sub4$Voltage, ylab="Voltage", xlab="datetime", type ="l")
plot(sub1$Date_New, sub1$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type ="n")
points(sub1$Date_New, sub1$Sub_metering_1, type="l")
points(sub2$Date_New, sub2$Sub_metering_2, type="l", col="red")
points(sub3$Date_New, sub3$Sub_metering_3, type="l", col="blue")

tt1<-subset(tt, !is.na(tt$Global_active_power))



plot(sub5$Date_New, sub4$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type ="l")

dev.off()

