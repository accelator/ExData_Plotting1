##First, we should automatically set the directory.
##Second,we should subset the necessary data from the given one.
data<-read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors=FALSE,sep=";",na.strings="?")
Date<-as.Date(data$Date,"%d/%m/%Y")
Datetime<-paste(Date,data$Time)
Datetime<-as.POSIXct(Datetime)
dataframe<-data.frame("Datetime"=Datetime,data[,3:9],stringsAsFactors=FALSE)
data1<-dataframe[(dataframe$Datetime>=as.POSIXct("2007-02-01"))&(dataframe$Datetime<as.POSIXct("2007-02-03 00:00:00")),]
##Then,we begin to make plottings.
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,4,2))
with(data1,{
  plot(Datetime,Global_active_power,xlab="",ylab="Global Active Power",type="l")
  plot(Datetime,Voltage,xlab="datetime",ylab="Voltage",type="l")
  plot(Datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(Datetime,Sub_metering_2,col="red")
  lines(Datetime,Sub_metering_3,col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,merge=TRUE,col=c("black","red","blue"),bty="n")
  plot(Datetime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
})
dev.off()