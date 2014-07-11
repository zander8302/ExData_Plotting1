project1 <- read.table("household_power_consumption.txt",sep=";",
                       na.strings="?",nrows=2880,skip=66638)
date <- as.character(project1$V1)
time <- as.character(project1$V2)
date.time <- paste(date,time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")
png(file="plot2.png",height=480,width=480,units="px")
plot(date.time, project1$V3, type='l',xlab = " ",ylab="Global Active Power (kilowatts)")
dev.off()