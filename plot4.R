#Exploratory data analysis
#Peer-graded Assignment: Course Project 1 = Week 1
#mygit = istailer
#Plot 4


#Read file
data_power_cons <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

#Select 2 days and as.Date
data_selected <- subset(data_power_cons, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format = "%d/%m/%Y")

date_time <- paste(as.Date(data_selected$Date), data_selected$Time)
data_selected$Datetime <- as.POSIXct(date_time)

#Graphic
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data_selected, {
        plot(Global_active_power ~ Datetime, type = "l", 
             ylab = "Global Active Power (Kw)", xlab = "")
        plot(Voltage ~ Datetime, type = "l", 
             ylab = "Voltage (volt)", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ Datetime,col = "red")
        lines(Sub_metering_3 ~ Datetime,col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty ="n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l", 
             ylab = "Global Reactive Power", xlab = "datetime")
})

#PNG export
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()

##Sorry, Weekdays in Portuguese