##Plot 2 code
##set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")

#read in file
housePowerData <- read.table("./household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)

#subset data for required year range
subHousePowerDataDay1 <- subset(housePowerData,housePowerData$Date=="1/2/2007")
subHousePowerDataDay2 <- subset(housePowerData,housePowerData$Date=="2/2/2007")

totalHousePowerData <- rbind(subHousePowerDataDay1,subHousePowerDataDay2)


##Specifics to Plot 2

#create new colum of data with date/time-stamp
totalHousePowerData$DateTimeStamp <- strptime(paste(totalHousePowerData$Date, totalHousePowerData$Time),format = "%d/%m/%Y %H:%M:%S")

plot(totalHousePowerData$DateTimeStamp,totalHousePowerData$Global_active_power,type = "l",xlab = NA,ylab = "Global Active Power (kilowatts)")

#save as png
dev.copy(png,'plot2.png')
dev.off()
