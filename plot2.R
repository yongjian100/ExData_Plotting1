setwd("C:/Users/YJ/Desktop/Data Science specialization/C4/Project1")

data<- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)

names<- read.table("household_power_consumption.txt", sep=";", nrows=1)
names

names(data) <- c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3")

data2<-data

data2$Date <- strptime(as.character(data2$Date), "%d/%m/%Y")
data2<- within(data2, { timestamp=format(as.POSIXlt(paste(Date, Time)), "%d/%m/%Y %T") })
str(data2)

data2$timestamp <- strptime(data2$timestamp,"%d/%m/%Y %T")
str(data2)
head(data2)

png("plot2.png", height=480, width=480)

with(data2, plot(timestamp, Global_active_power, ylab="Global Active Power (kilowatts)", xlab=NA,pch=NA))
with(data2, lines(timestamp, Global_active_power, ylab="Global Active Power (kilowatts)"))
dev.off()

