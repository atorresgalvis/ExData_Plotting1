a<-read.table("household_power_consumption.txt", header=T, sep = ";")  ##read the data from the file in my working directory
s<-split(a, a$Date)  ##split the data by Date to obtain data to each day
d1<-s["1/2/2007"]; d2<-s["2/2/2007"]  ## obtain only the data to February the first and second of 2007
d1 <- as.matrix(d1[[1]]) ; d2 <- as.matrix(d2[[1]])  ##convert data as a matrix
dcomp <- rbind(d1, d2); dcomp <-data.frame(dcomp)  ##put together both, 1/2/2007 and 2/2/2007 data in one object called dcomp as data frame
v1<-as.numeric(as.vector(dcomp$Global_active_power))  ##subset the variable "Global Active Power" from the data frame 
png(file="plot1.png", width = 480, height = 480, units = "px")  ##open de device of PNG format
hist(v1, main="Global Active Power", xlab= "Global Active Power (kilowatts)", col="red")  ##build a histogram with the specifications
dev.off() ##close de png device
