setwd("/Users/tomglaser/Desktop/Coursera/Data Science - Johns Hopkins/Data Exploration")
df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactor=FALSE)
df<-subset(df,subset=(Date=="1/2/2007" | Date=="2/2/2007"))
df$Date<-as.Date(df$Date,format="%d/%m/%Y")
df$WeekDay<-format(df$Date,"%a")
df$YY<-format(df$Date,"%Y")
df$MM<-format(df$Date,"%m")
df$DD<-format(df$Date,"%d")
df$hh<-as.POSIXlt(df$Time, format="%H:%M:%S")$hour
df$mm<-as.POSIXlt(df$Time, format="%H:%M:%S")$min
df$datetime <- with(df, ISOdatetime(YY,MM,DD,hh,mm,0))
df[,3]<-as.numeric(df[,3])
df[,4]<-as.numeric(df[,4])
df[,5]<-as.numeric(df[,5])
df[,6]<-as.numeric(df[,6])
df[,7]<-as.numeric(df[,7])
df[,8]<-as.numeric(df[,8])
png(filename = "plot3.png",
    width = 480, height = 480)
plot(df$datetime,df$Sub_metering_1,    
     xlab=" ",
     ylab="Energy sub metering",
     type="n")
lines(df$datetime,df$Sub_metering_1,
      col="black")
lines(df$datetime,df$Sub_metering_2,
     col="red")
lines(df$datetime,df$Sub_metering_3,
      col="blue")
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5))
dev.off()