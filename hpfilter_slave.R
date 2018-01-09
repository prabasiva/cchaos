
hpfilt <- function()
{
  #Program used to create the HP filter for lambda 80 & 800 for S&P 500 index
  #Load the file and invoke hpfilt()
  #Filename: hpfilter_slave.R
  # Praba Siva;praba@umich.edu; @prabasiva
library(mFilter)
library(latex2exp)
opar <- par(no.readonly=TRUE)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
fspcom=read.table('fspcom.dat')
dat = fspcom[,5]
syear=fspcom[,2]+1/12*fspcom[,3]
ldat=log(dat)
dat=ldat
dat.hp1 <- hpfilter(dat, freq=80,type="frequency",drift=FALSE)
dat.hp2 <- hpfilter(dat, freq=800,type="frequency",drift=FALSE)
par(mfrow=c(3,1),mar=c(3,3,2,1),cex=.8)
plot(syear,dat,  ylim=range(dat),
     main="S&P 500 Index ",
     col=2, ylab="",type='l',cex.axis=1.1,cex.lab=1.3,lwd=2.2)
plot(syear,dat.hp1$trend,  ylim=range(dat.hp1$trend),
     main="HP filter of S&P 500 Index: Trend,Lambda=80 ",
     col=4, xlab='praba siva', ylab="log(s(t))",type='l',cex.axis=1.1,cex.lab=1.3,lwd=2.2)
plot(syear,dat.hp1$cycle,  ylim=range(dat.hp1$cycle),
     main="HP filter of S&P 500 Index: Cycle,Lambda=80 ",
     col=3, ylab="",type='l',cex.axis=1.1,cex.lab=1.3,lwd=2.2)
par(mfrow=c(3,1),mar=c(3,3,2,1),cex=.8)
plot(syear,dat,  ylim=range(dat),
     main="S&P 500 Index ",
     col=2, ylab="",type='l',cex.axis=1.1,cex.lab=1.3,lwd=2.2)
plot(syear,dat.hp2$trend,  ylim=range(dat.hp1$trend),
     main="HP filter of S&P 500 Index: Trend,Lambda=800 ",
     col=4, xlab='praba siva', ylab="log(s(t))",type='l',cex.axis=1.1,cex.lab=1.3,lwd=2.2)
plot(syear,dat.hp1$cycle,  ylim=range(dat.hp2$cycle),
     main="HP filter of S&P 500 Index: Cycle,Lambda=800 ",
     col=3, ylab="",type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
par(opar)
opar <- par(no.readonly=TRUE)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
nasda <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
nyear=nasda[,1]+1/12*nasda[,2]
nasda=nasda[,3]
lnasda=log(nasda)
nasda=lnasda
nasda.hp1 <- hpfilter(nasda, freq=80,type="frequency",drift=FALSE)
nasda.hp2 <- hpfilter(nasda, freq=800,type="frequency",drift=FALSE)
par(mfrow=c(3,1),mar=c(3,3,2,1),cex=.8)
plot(nyear,nasda,  xlab="Year",ylab="log s(t)",ylim=range(nasda),
     main="NASDAQ Index ",
     col=2, type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
plot(nyear,nasda.hp1$trend,  xlab='Year', ylim=range(nasda.hp1$trend),
     main="HP filter of NASDAQ Index: Trend,Lambda=80 ",
     col=4, type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
plot(nyear,nasda.hp1$cycle,  ylim=range(nasda.hp1$cycle), xlab="Year", 
     main="HP filter of NASDAQ Index: Cycle,Lambda=80 ",
     col=3, type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
par(mfrow=c(3,1),mar=c(3,3,2,1),cex=.8)
plot(nyear,nasda,  ylim=range(nasda),
     main="NASDAQ Index ",
     col=2, ylab="log s(t)",type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
plot(nyear,nasda.hp2$trend,  ylim=range(nasda.hp1$trend),
     main="HP filter of NASDAQ Index: Trend,Lambda=800 ",
     col=4, xlab='Year', ylab="log(s(t))",type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
plot(nyear,nasda.hp1$cycle,  ylim=range(nasda.hp2$cycle),
     main="HP filter of NASDAQ Index: Cycle,Lambda=800 ",
     col=3, ylab="",type='l',cex.axis=1.1,cex.lab=1.5,lwd=2.2)
par(opar)
nasda.hp3 <- hpfilter(nasda, freq=1600,type="frequency",drift=FALSE)
nasda.hp4 <- hpfilter(nasda, freq=14400,type="frequency",drift=FALSE)
lambda=c(80,800,1600,14400);
c=1:4;
layout(matrix(c(1,1,2,2), 2, 2, byrow = TRUE))
plot(nyear,nasda.hp1$trend,ylab='Log NASDAQ',
     main=TeX('NASDAQ Trend HP filter with different $\\lambda$'),
     xlab='Year',col=c(1),type='l',cex.axis=1,cex.lab=1.3,lwd=2.2);
lines(nyear,nasda.hp2$trend,main=TeX('NASDAQ Trend HP filter with different $\\lambda$') ,
      col=c(2),type='l',cex.axis=1,cex.lab=1.1,lwd=2.2);
lines(nyear,nasda.hp3$trend,main=TeX('NASDAQ Trend HP filterwith different $\\lambda$'),
      col=c(3),type='l',cex.axis=1,cex.lab=1.1,lwd=2.2);
lines(nyear,nasda.hp4$trend,main=TeX('NASDAQ Trend HP filterwith different $\\lambda$'),
      col=c(4),type='l',cex.axis=1,cex.lab=1.1,lwd=2.2);
legend('topleft', legend=TeX(sprintf("$\\lambda = %d$", lambda)), lwd=1, col=c)
dat.hp3 <- hpfilter(dat, freq=1600,type="frequency",drift=FALSE)
dat.hp4 <- hpfilter(dat, freq=14400,type="frequency",drift=FALSE)
lambda=c(80,800,1600,14400);
c=1:4;
plot(syear,dat.hp1$trend,ylab='Log SP500',main=TeX('SP500 Trend HP filter with different $\\lambda$'),
     xlab='Year',col=c(1),type='l',cex.axis=1,cex.lab=1.3,lwd=2.2);
lines(syear,dat.hp2$trend,main=TeX('SP500 Trend HP filter with different $\\lambda$') ,
      col=c(2),type='l',cex.axis=1.1,cex.lab=1,lwd=2.2);
lines(syear,dat.hp3$trend,main=TeX('SP500 Trend HP filterwith different $\\lambda$'),
      col=c(3),type='l',cex.axis=1.1,cex.lab=1,lwd=2.2);
lines(syear,dat.hp4$trend,main=TeX('SP500 Trend HP filterwith different $\\lambda$'),
      col=c(4),type='l',cex.axis=1.1,cex.lab=1,lwd=2.2);
legend('topleft', legend=TeX(sprintf("$\\lambda = %d$", lambda)), lwd=1, col=c)

#Statistics of the HP Detrending
print('SP500 ')
print('HP Filter with Lambda = 80')
sprintf("Mean = %5f",mean(dat.hp1$cycle))
sprintf("SD = %5f",sd(dat.hp1$cycle))
sprintf("Variance = %5f",var(dat.hp1$cycle))
print('HP Filter with Lambda = 800')
sprintf("Mean = %5f",mean(dat.hp2$cycle))
sprintf("SD = %5f",sd(dat.hp2$cycle))
sprintf("Variance = %5f",var(dat.hp2$cycle))
print('HP Filter with Lambda = 1600')
sprintf("Mean = %5f",mean(dat.hp3$cycle))
sprintf("SD = %5f",sd(dat.hp3$cycle))
sprintf("Variance = %5f",var(dat.hp3$cycle))
print('HP Filter with Lambda = 14400')
sprintf("Mean = %5f",mean(dat.hp4$cycle))
sprintf("SD = %5f",sd(dat.hp4$cycle))
sprintf("Variance = %5f",var(dat.hp4$cycle))

print('NASDAQ ')
print('HP Filter with Lambda = 80')
xm=sprintf("Mean = %5f",mean(nasda.hp1$cycle))
xs=sprintf("SD = %5f",sd(nasda.hp1$cycle))
xv=sprintf("Variance = %5f",var(nasda.hp1$cycle))

print('HP Filter with Lambda = 800')
sprintf("Mean = %5f",mean(nasda.hp2$cycle))
sprintf("SD = %5f",sd(nasda.hp2$cycle))
sprintf("Variance = %5f",var(nasda.hp2$cycle))

print('HP Filter with Lambda = 1600')
sprintf("Mean = %5f",mean(nasda.hp3$cycle))
sprintf("SD = %5f",sd(nasda.hp3$cycle))
sprintf("Variance = %5f",var(nasda.hp3$cycle))

print('HP Filter with Lambda = 14400')
sprintf("Mean = %5f",mean(nasda.hp4$cycle))
sprintf("SD = %5f",sd(nasda.hp4$cycle))
sprintf("Variance = %5f",var(nasda.hp4$cycle))

}