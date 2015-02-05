tt<- read.table("household_power_consumption.txt", sep=";", header=TRUE)
dd<-tt[(1:1000),]
x<-paste(dd$Date, dd$Time)
x<-strptime(x, "%d/%m/%Y %H:%M:%S")
dd$Date_New<-x
dd$Date<-as.Date(dd$Date, "%d/%m/%Y")