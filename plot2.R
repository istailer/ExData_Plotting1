#Exploratory data analysis
#Peer-graded Assignment: Course Project 1 = Week 1
#mygit = istailer
#Plot 2


#Read file
data_power_cons <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

#Select 2 days and as.Date
data_selected <- subset(data_power_cons, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format = "%d/%m/%Y")

date_time <- paste(as.Date(data_selected$Date), data_selected$Time)
data_selected$Datetime <- as.POSIXct(date_time)

#Graphic
with(data_selected, {
        plot(Global_active_power~Datetime, type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = "")
})

#PNG export
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()

##Sorry, Weekdays in Portuguese