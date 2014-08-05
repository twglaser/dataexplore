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
png(filename = "plot2.png",
     width = 480, height = 480)
plot(df$datetime,df$Global_active_power, 
     type="l",
     xlab=" ",
     ylab="Global Active Power (kilowatts)",     
     ylim=c(0,7.5))
dev.off()