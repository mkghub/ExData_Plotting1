Sys.setlocale('LC_TIME', 'C')  # To show weekdays etc.in English
ExData <- read.table("household_power_consumption.txt",sep =";",na.strings="?",header=TRUE)
ExData$Date <- as.Date(ExData$Date, "%d/%m/%Y")
ExData2 <- subset(ExData,(Date>="2007-02-01")&(Date<="2007-02-02"))
ExData2$Time <- strptime(paste(ExData2$Date,ExData2$Time),"%Y-%m-%d %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(ExData2,{
  plot(Time,Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(Time,Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",)
  lines(Time,Sub_metering_2,type="l",col="red")
  lines(Time,Sub_metering_3,type="l",col="blue")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),cex=1,bty='n')
  plot(Time,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",ylim=c(0,0.5));
})
#dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()