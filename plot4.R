setwd("C:/Users/kh/Desktop/Coursera/exploratory-data-analysis/")

#Load Data

Original_Data <-"household_power_consumption.txt"

mydata <- read.csv(Original_Data, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?") 

attach(mydata)

#Convert Date and Time Variables

mydata$Date_Time <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")

#Sort Data by Time Frame (2 Days)
mydata_sort_date <- mydata[Date == "1/2/2007" | Date == "2/2/2007",]

attach(mydata_sort_date)

#Create Graphic as png
png(filename="plot4.png")

#Create 4 Plots per Window
par(mfrow = c(2, 2))

#Plot 1
plot(Date_Time, Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power") 

#Plot 2
plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage") 

#Plot 3
plot(Date_Time, Sub_metering_1,  type = "l", xlab = "", ylab = "Energy sub metering") 

#Add Lines for Sub_metering 1 & 2 to plot 3

lines(Date_Time, Sub_metering_2, col = "red") 
lines(Date_Time, Sub_metering_3, col = "blue") 

#Add Legend to plot 3

legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1) 

plot(DateTime, Global_reactive_power,  type = "l", xlab = "datetime", ylab = colnames(mydata_sort_date)[4]) 

dev.off()
