#Exploratory data analysis
#Peer-graded Assignment: Course Project 1 = Week 1
#mygit = istailer
#Plot 1


#Read file
data_power_cons <- read.csv("household_power_consumption.txt", header = TRUE, sep =';', na.strings = "?")

#Select 2 days and as.Date
data_selected <- subset(data_power_cons, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format = "%d/%m/%Y")

#Graphic
hist(data_selected$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

#PNG export
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

