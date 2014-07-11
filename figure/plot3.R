project1 <- read.table("household_power_consumption.txt",sep=";",
                       na.strings="?",nrows=2880,skip=66638)
date <- as.character(project1$V1)
time <- as.character(project1$V2)

date.time <- paste(date,time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

sub <- project1[ ,c("V7","V8","V9")]

png(file="plot3.png",height=480,width=480,units="px")

plot(date.time,sub$V7,type="l",ylab="Energy sub metering",xlab=" ")
lines(date.time,sub$V8, col="red")
lines(date.time,sub$V9,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

dev.off()

