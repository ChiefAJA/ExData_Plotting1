png(file = "plot4.png") #open file

#load data for household power consumption 
data <- tbl_df(read.table("Data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?","")))

#adjust Date and Time variables to more usable class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$timetemp<- paste(data$Date, data$Time)
data$Time<- as.POSIXct(strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S"))

#select data for desired dates 
plot4data<- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#prepare for creation of 4 plots in 2x2 arrangement 
par(mfcol = c(2,2))

## creates top left plot
with(plot4data, plot(Time,Global_active_power, 
                     type = "s",
                     ylab= "Global Active Power (kilowatts)",
                     xlab = ""
)
)

## creates bottom left plot
with(plot4data, plot(Time, Sub_metering_1, ylab= "Energy sub meeting", xlab = "", type = "n"))
with(plot4data, points(Time, Sub_metering_1, type = "s"))
with(plot4data, points(Time, Sub_metering_2, type = "s", col = "red"))
with(plot4data, points(Time, Sub_metering_3, type = "s", col = "blue"))

legend ("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## create top right plot
with(plot4data, plot(Time, Voltage, ylab= "Voltage", xlab = "datetime", type = "s"))

## create bottom right plot 
with(plot4data, plot(Time, Global_reactive_power, ylab= "Global_reactive_power", xlab = "datetime", type = "s"))


dev.off() #close file 