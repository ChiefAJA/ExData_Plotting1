png(file = "plot2.png") #open file to write 

#load data
data <- tbl_df(read.table("Data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?","")))

#adjust Date and Time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$timetemp<- paste(data$Date, data$Time)
data$Time<- as.POSIXct(strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S"))

#select dates 2/1/2007-2/2/2007
plot2data<- filter(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#create a step type plot of time vs global active power with the appropriate axis labels 
with(plot2data, plot(Time,Global_active_power, 
          type = "s",
          ylab= "Global Active Power (kilowatts)",
          xlab = ""
          )
)

dev.off() # close file 