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
png(filename="plot2.png")

#Create Plot
plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (killowatts)")

dev.off()
