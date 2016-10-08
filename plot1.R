##Plot 1 code
##set wd
setwd("C:/Users/jjack_000/Desktop/Data Science JH course/Exploratory Data Analysis")

#read in file
housePowerData <- read.table("./household_power_consumption.txt",header = T,sep = ";",stringsAsFactors = F)

#subset data for required year range
subHousePowerDataDay1 <- subset(housePowerData,housePowerData$Date=="1/2/2007")
subHousePowerDataDay2 <- subset(housePowerData,housePowerData$Date=="2/2/2007")

totalHousePowerData <- rbind(subHousePowerDataDay1,subHousePowerDataDay2)


##Specifics to Plot 1

numTotalHousePowerData <- as.numeric(totalHousePowerData$Global_active_power)

#rmv missing values
missingVals <- is.na(numTotalHousePowerData)

cleanHousePowerData <- numTotalHousePowerData[!missingVals]

#customise plot
hist(cleanHousePowerData,col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#save as png
dev.copy(png,'plot1.png')
dev.off()
