a<-read.table("household_power_consumption.txt", header=T, sep = ";")  ##read the data from the file in my working directory
s<-split(a, a$Date)  ##split the data by Date to obtain data to each day
d1<-s["1/2/2007"]; d2<-s["2/2/2007"]  ## obtain only the data to February the first and second of 2007
d1 <- as.matrix(d1[[1]]) ; d2 <- as.matrix(d2[[1]])  ##convert data as a matrix
dcomp <- rbind(d1, d2); dcomp <-data.frame(dcomp)  ##put together both, 1/2/2007 and 2/2/2007 data in one object called dcomp as data frame
v1<-as.numeric(as.vector(dcomp$Sub_metering_1))  ##subset the variable "Sub metering 1" from the data frame 
v2<-as.numeric(as.vector(dcomp$Sub_metering_2))  ##subset the variable "Sub metering 2" from the data frame
v3<-as.numeric(as.vector(dcomp$Sub_metering_3))  ##subset the variable "Sub metering 3" from the data frame 
png(file="plot3.png", width = 480, height = 480, units = "px")  ##open de device of PNG format
plot(v1, type = "l", ylab="Energy sub metering", xaxt = "n", xlab='') ##build a plot type lines
lines(v2, col="red") ##add lines of sub metering 2 in red
lines(v3, col="blue") ##add lines of sub metering 3 in blue
axis(1, at=1, labels= "Thu"); axis(1, at=1440, labels= "Fri"); axis(1, at=2880, labels= "Sat") ##put the labels in the axis X
legend("topright", lty= 1, col=c("black","red", "blue"), legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")) ##Put the corresponding legend on the plot
dev.off() ##close de png device
