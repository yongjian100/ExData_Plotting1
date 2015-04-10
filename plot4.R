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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,0.2,0))
with(data2,{

plot(timestamp, Global_active_power, ylab="Global Active Power", xlab=NA,pch=NA,
         lines(timestamp, Global_active_power))
plot(timestamp, Voltage, ylab="Voltage", xlab="datetime",pch=NA,
         lines(timestamp, Voltage))

with(data2, plot(timestamp, Sub_metering_1, ylab="Energy sub metering", xlab=NA,pch=NA))
with(data2, lines(timestamp, Sub_metering_1, col="black"))
with(data2, lines(timestamp, Sub_metering_2, col="red"))
with(data2, lines(timestamp, Sub_metering_3, col="blue"))
legend("top", lty=1, bty="n", cex=0.8, y.intersp=0.5,inset=0, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(timestamp, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",pch=NA,
     lines(timestamp, Global_reactive_power))
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

