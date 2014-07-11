project1 <- read.table("household_power_consumption.txt",sep=";",
                       na.strings="?",nrows=2880,skip=66638)

png(file="plot1.png",height=480,width=480,units="px")

hist(project1$V3,breaks=12,col="red",xlab="Global Active Power (Kilowatts)",
     main="Global Active Power",ylab="Frequency",ylim=c(0,1200))

dev.off()