cchaos <-function()
{
  
  #Program used to create the chaos cycles for HP filter SP500 & NASDAQ indexes
  # Praba Siva
  # praba@umich.edu
  # @prabasiva
  
  
library(mFilter)
delta=60
opar <- par(no.readonly=TRUE)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
fspcom=read.table('fspcom.dat')
dat = fspcom[,5]
year=fspcom[,2]+1/12*fspcom[,3]
ldat=log(dat)
dat=ldat
dat.hp1 <- hpfilter(dat, freq=80,type="frequency",drift=FALSE)
a=dat.hp1$cycle
if (length(a)<=delta)
{
print('delta too big')
  return;
}
x=a[1:(length(a)-delta)]
a=dat.hp1$cycle
y=a[(delta+1):length(a)]
plot(x,y,type='l',lty=2,col='4',xlab='x(t)',ylab='x(t+T)',
     main="FSPComln SP 500 RAW HP Cycles for T=60")
#test gabor filter
gfilt = gabor(length(dat.hp1$cycle),50,1/12,8)
a = (convolve(dat,gfilt))
x=a[1:(length(a)-delta)]
y=a[(delta+1):length(a)]
plot(x,y,type='l',lty=2,col='4',xlab='x(t)',ylab='x(t+T)',
     main="FSPComln SP 500 Filtered SP500 for T=60")

plot(year,a,type='l')
gfilt = gabor(length(dat.hp1$cycle),50,1/12,8)
a = abs(convolve(dat.hp1$cycle,gfilt))
x=a[1:(length(a)-delta)]
y=a[(delta+1):length(a)]
plot(x,y,type='l',lty=2,col='4',xlab='x(t)',ylab='x(t+T)',
     main="FSPComln SP 500 Filtered HP Cycles for T=60")


#test gabor

opar <- par(no.readonly=TRUE)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
dat <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
year=dat[,1]+1/12*dat[,2]
dat=dat[,3]
ldat=log(dat)
dat=ldat
dat.hp1 <- hpfilter(dat, freq=80,type="frequency",drift=FALSE)
a=dat.hp1$cycle
if (length(a)<=delta)
{
  print('delta too big')
  return;
}
x=a[1:(length(a)-delta)]
a=dat.hp1$cycle
y=a[(delta+1):length(a)]
plot(x,y,type='l',lty=2,col='3',xlab='x(t)',ylab='x(t+T)',
     main="NASDAQln RAW HP Cycles for T=60")

}