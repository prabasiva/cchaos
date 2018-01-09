hp_nasdaq <- function()
{
#Program used to create the HP filter for lambda 80 & 800 for NASDAQ index
# Praba Siva
# praba@umich.edu
# @prabasiva

  library(latex2exp)
library(mFilter)
opar <- par(no.readonly=TRUE)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
nasda <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
year=nasda[,1]+1/12*nasda[,2]
nasda=nasda[,3]
lnasda=log(nasda)
nasda=lnasda

nasda.hp1 <- hpfilter(nasda, freq=80,type="frequency",drift=FALSE)
nasda.hp2 <- hpfilter(nasda, freq=800,type="frequency",drift=FALSE)
par(mfrow=c(3,1),mar=c(3,3,2,1),cex=.8)

plot(year,nasda,  xlab="Year",ylab="log s(t)",ylim=range(nasda),
     main="NASDAQ Index ",
     col=2, type='l')
plot(year,nasda.hp1$trend,  xlab='Year', ylim=range(nasda.hp1$trend),
     main="HP filter of NASDAQ Index: Trend,Lambda=80 ",
     col=4, type='l')
plot(year,nasda.hp1$cycle,  ylim=range(nasda.hp1$cycle), xlab="Year", 
     main="HP filter of NASDAQ Index: Cycle,Lambda=80 ",
     col=3, type='l')
par(mfrow=c(3,1),mar=c(3,3,2,1),cex=.8)
plot(year,nasda,  ylim=range(nasda),
     main="NASDAQ Index ",
     col=2, ylab="log s(t)",type='l')
plot(year,nasda.hp2$trend,  ylim=range(nasda.hp1$trend),
     main="HP filter of NASDAQ Index: Trend,Lambda=800 ",
     col=4, xlab='Year', ylab="log(s(t))",type='l')
plot(year,nasda.hp1$cycle,  ylim=range(nasda.hp2$cycle),
     main="HP filter of NASDAQ Index: Cycle,Lambda=800 ",
     col=3, ylab="",type='l')
par(opar)

nasda.hp3 <- hpfilter(nasda, freq=1600,type="frequency",drift=FALSE)
nasda.hp4 <- hpfilter(nasda, freq=14400,type="frequency",drift=FALSE)
lambda=c(80,800,1600,14400);
c=1:4;

plot(year,nasda.hp1$trend,ylab='Log NASDAQ',main=TeX('NASDAQ Trend HP filter with different $\\lambda$'), col=c(1),type='l');
lines(year,nasda.hp2$trend,main=TeX('NASDAQ Trend HP filter with different $\\lambda$') ,col=c(2),type='l');
lines(year,nasda.hp3$trend,main=TeX('NASDAQ Trend HP filterwith different $\\lambda$'),col=c(3),type='l');
lines(year,nasda.hp4$trend,main=TeX('NASDAQ Trend HP filterwith different $\\lambda$'),col=c(4),type='l');
legend('topleft', legend=TeX(sprintf("$\\lambda = %d$", lambda)), lwd=1, col=c)


}
