##First, we should automatically set the directory.
##Second,we should subset the necessary data from the given one.
data<-read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";",na.strings="?")
Date<-as.Date(data$Date,"%d/%m/%Y")
Datetime<-paste(Date,data$Time)
Datetime<-as.POSIXct(Datetime)
dataframe<-data.frame("Datetime"=Datetime,data[,3:9],stringsAsFactors=FALSE)
data1<-dataframe[(dataframe$Datetime>=as.POSIXct("2007-02-01"))&(dataframe$Datetime<as.POSIXct("2007-02-03 00:00:00")),]
##Then,we begin to make plottings:
png(file="plot3.png",width=480,height=480)
x<-data1$Datetime
y1<-data1[,"Sub_metering_1"]
y2<-data1[,"Sub_metering_2"]
y3<-data1[,"Sub_metering_3"]
plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,merge=TRUE,col=c("black","red","blue"))
dev.off()