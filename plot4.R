a<-read.table("household_power_consumption.txt", header=T, sep = ";")  ##read the data from the file in my working directory
s<-split(a, a$Date)  ##split the data by Date to obtain data to each day
d1<-s["1/2/2007"]; d2<-s["2/2/2007"]  ## obtain only the data to February the first and second of 2007
d1 <- as.matrix(d1[[1]]) ; d2 <- as.matrix(d2[[1]])  ##convert data as a matrix
dcomp <- rbind(d1, d2); dcomp <-data.frame(dcomp)  ##put together both, 1/2/2007 and 2/2/2007 data in one object called dcomp as data frame
v1<-as.numeric(as.vector(dcomp$Global_active_power))
v2<-as.numeric(as.vector(dcomp$Voltage))
v3<-as.numeric(as.vector(dcomp$Global_reactive_power))
sm1<-as.numeric(as.vector(dcomp$Sub_metering_1))  ##subset the variable "Sub metering 1" from the data frame 
sm2<-as.numeric(as.vector(dcomp$Sub_metering_2))  ##subset the variable "Sub metering 2" from the data frame
sm3<-as.numeric(as.vector(dcomp$Sub_metering_3))  ##subset the variable "Sub metering 3" from the data frame
png(file="plot4.png", width = 480, height = 480, units = "px")  ##open de device of PNG format 
par(mfrow = c(2, 2))
plot(v1, pch= ".", ylab="Global Active Power", xaxt = "n", xlab='')
lines(v1)
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
plot(v2, pch= ".", ylab="Voltage", xaxt = "n", xlab='datetime')
lines(v2)
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
plot(sm1, pch= ".", ylab="Energy sub metering", xaxt = "n", xlab='')
lines(sm1)
points(sm2, col="red", pch=".")
lines(sm2, col="red")
points(sm3, col="blue", pch=".")
lines(sm3, col="blue")
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
legend("topright", lty= 1, bty="n", col=c("black","red", "blue"), legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(v3, pch= ".", ylab="Global_reactive_power", xaxt = "n", xlab='datetime')
lines(v3)
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat")
dev.off() ##close de png device
