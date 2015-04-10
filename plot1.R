
setwd("C:/Users/YJ/Desktop/Data Science specialization/C4/Project1")

data<- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)

names(data) <- c("Date", "Time", "Global_active_power","Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2" ,"Sub_metering_3")
head(data)

png("plot1.png", height=480, width=480)
hist(data$Global_active_power, col="red", main ="Global Active Power",  xlab="Global Active Power (kilowatts)")
dev.off()

