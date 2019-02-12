#Set Working Directory
#setwd("Coursera/EDA/Project1")

#Read Data
household_power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert date format
household_power$Date <- as.Date(household_power$Date, format="%d/%m/%Y")

#Subset data to 02/01/2007 and 02/02/2007
power <- household_power[(household_power$Date =="2007-02-01") | (household_power$Date == "2007-02-02"), ]

# Convert to Date/Time class
power$dateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#Open Plot file
png("plot2.png", width=480, height=480)

#Create Graph
plot(power$dateTime, as.numeric(as.character(power$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close Plot file
dev.off()