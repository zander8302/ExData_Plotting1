project1 <- read.table("household_power_consumption.txt",sep=";",
                       na.strings="?",nrows=2880,skip=66638)
date <- as.character(project1$V1)
time <- as.character(project1$V2)
date.time <- paste(date,time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

png(file="plot4.png",height=480,width=480,units="px")

par(mfrow=c(2,2))

#Top Left Plot
plot(date.time, project1$V3, type='l',xlab = " ",ylab="Global Active Power (kilowatts)")

sub <- project1[ ,c("V7","V8","V9")]
# Bottom Left Plot
plot(date.time,project1$V5,type="l",xlab="datetime",ylab="Voltage")

# Top Right Plot
plot(date.time,sub$V7,type="l",ylab="Energy sub metering",xlab=" ")
lines(date.time,sub$V8, col="red")
lines(date.time,sub$V9,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

# Bottom Right Plot
plot(date.time,project1$V4,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
