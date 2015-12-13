setwd("C:/Users/kh/Desktop/Coursera/exploratory-data-analysis/")

#Load Data

Original_Data <-"household_power_consumption.txt"

mydata <- read.csv(Original_Data, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)), na = "?") 

attach(mydata)

#Sort Data by Time Frame (2 Days)
mydata_sort_date <- mydata[Date == "1/2/2007" | Date == "2/2/2007",]

#Subset Data for plot_1

Global_Active_Power <- mydata_sort_date$Global_active_power

#Create Graphic as png
png(filename="plot1.png")

#Create Histogram 
hist(Global_Active_Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
