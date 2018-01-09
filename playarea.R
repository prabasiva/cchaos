
#Program used to create the HP filter for lambda 80 & 800 for S&P 500 index
#Load the file and invoke hpfilt()
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
m=-.2
b=2
x=seq(-5,4.9,.1)
y=sin(x)*rnorm(length(x))
dat=diff(dat)
syear=syear[1:length(dat)];
#dat=y
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