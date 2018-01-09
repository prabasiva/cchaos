
pra<-function()
{
  library(mFilter);
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
fspcom=read.table('fspcom.dat')
dat = (fspcom[,5])
mort=log(dat)

le=length(dat)
x=dat[2:le]
y=dat[1:le-1]
diffxy=x-y
#plot(diffxy,type='l')
#plot((log(x)-log(y)),type='l')
hpd=hpfilter(diffxy,freq=12)
hpf=hpfilter(mort,freq=12)
acf(hpf$cycle)
ac1=acf(hpf$cycle, ci.type = "ma")
bc1=acf(hpd$cycle,ci.type="ma")
plot(ac1,main='Autocorrelation of log SP500 HP Cycles',xlab='Lag',ylab='AC(1)')
lines(ac1$lag,ac1$acf,main='Autocorrelation of log SP500 HP Cycles',xlab='Lag',ylab='AC(1)',type='l',col='red',lwd=2)
plot(bc1,main='Autocorrelation of log SP500 FD ',xlab='Lag',ylab='AC(1)')
lines(bc1$lag,bc1$acf,main='Autocorrelation of log SP500 FD',xlab='Lag',ylab='AC(1)',type='l',col='red',lwd=2)

setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
dat <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
year=dat[,1]+1/12*dat[,2]
dat=dat[,3]

mort=log(dat)

le=length(dat)
x=dat[2:le]
y=dat[1:le-1]
diffxy=x-y
#plot(diffxy,type='l')
#plot((log(x)-log(y)),type='l')
hpd=hpfilter(diffxy,freq=12)
hpf=hpfilter(mort,freq=12)
acf(hpf$cycle)
ac1=acf(hpf$cycle, ci.type = "ma")
bc1=acf(hpd$cycle,ci.type="ma")
plot(ac1,main='Autocorrelation of log NASDAQ HP Cycles',xlab='Lag',ylab='AC(1)')
lines(ac1$lag,ac1$acf,main='Autocorrelation of log NASDAQ HP Cycles',xlab='Lag',ylab='AC(1)',type='l',col='blue',lwd=2)
plot(bc1,main='Autocorrelation of log NASDAQ FD ',xlab='Lag',ylab='AC(1)')
lines(bc1$lag,bc1$acf,main='Autocorrelation of log NASDAQ FD',xlab='Lag',ylab='AC(1)',type='l',col='blue',lwd=2)
     

#dacf=acf(diffhp$cycle)
#plot(dacf$acf,type='l')
##pacf(log(x)-log(y),plot='T')

#plot(mort, type="o") # plot of mortality rate
#mort=ts(mort)
#mortdiff=diff(mort,1) # creates a variable = x(t) – x(t-1)
#plot(mortdiff,type="o") # plot of first differences
#acf(mortdiff,xlim=c(1,24)) # plot of first differences, for 24 lags
#mortdifflag1=lag(mortdiff,-1)
#y=cbind(mortdiff,mortdifflag1) # bind first differences and lagged first differences
#mortdiffar1=lm(y[,1]~y[,2]) # AR(1) regression for first differences
#summary(mortdiffar1) # regression results
#acf(mortdiffar1$residuals, xlim = c(1,24)) # ACF of residuals for 24 lags.

}

test <-function()
{

require(graphics)

## Examples from Venables & Ripley
acf(lh)
acf(lh, type = "covariance")
pacf(lh)

acf(ldeaths)
acf(ldeaths, ci.type = "ma")
acf(ts.union(mdeaths, fdeaths))
ccf(mdeaths, fdeaths, ylab = "cross-correlation")
# (just the cross-correlations)

presidents # contains missing values
acf(presidents, na.action = na.pass)
pacf(presidents, na.action = na.pass)


}