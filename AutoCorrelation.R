ac<-function()
{
  #Program used to create AutoCorrelation Analysis for sample, SP500 & NASDAQ
  #Filename:AutoCorrelation.R
  # Praba Siva
  # praba@umich.edu
  # @prabasiva
   
library(mFilter);
library(latex2exp)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
fspcom=read.table('fspcom.dat')
dat = (fspcom[,5])
mort=log(dat)
year=fspcom[,2]+1/12*fspcom[,3]
le=length(dat)
x=mort[2:le]
y=mort[1:le-1]
diffxy=x-y
#plot(diffxy,type='l')
dur=1:length(year)
lmr=lm(mort~dur)
intercept=coef(lmr)[1]
slope=coef(lmr)[2]
dftrend=intercept+slope*dur
dfcycle=mort-dftrend
dfacf=acf(dfcycle,plot=FALSE,100);
hpf=hpfilter(mort,freq=14400)
layout(matrix(c(1,2,3,4), 4,1, byrow = TRUE))
color={'blue'}
ac1=acf(hpf$cycle, ci.type = "ma",plot=FALSE,100)
plot(year,mort,main='Log SP500 index',
     xlab='Year',ylab=TeX('log (SP500(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='red');
bc1=acf(diffxy,ci.type="ma",plot=FALSE,100)
plot(ac1,main='Autocorrelation of log SP500 HP Cycles'
     ,xlab='Lag',ylab='AC(1)')
lines(ac1$lag,ac1$acf,main='Autocorrelation of log SP500 HP Cycles',
      xlab='Lag',ylab='AC(1)',type='l',
      col='blue',cex.axis=1.1,cex.lab=1.1,lwd=3)
plot(bc1,main='Autocorrelation of log SP500 FD ',
     xlab='Lag',ylab='AC(1)')
lines(bc1$lag,bc1$acf,main='Autocorrelation of log SP500 FD',
      xlab='Lag',ylab='AC(1)',type='l',col='blue',lwd=3)
plot(dfacf,main='Autocorrelation of log-linear SP500  ',
     xlab='Lag',ylab='AC(1)')
lines(dfacf$lag,dfacf$acf,main='Autocorrelation of log-linear SP500 ',
      xlab='Lag',ylab='AC(1)',type='l',
      col='blue',lwd=3)
layout(matrix(c(1,2), 2,1, byrow = TRUE))
plot(year,mort,main='Log SP500 index',
     xlab='Year',ylab=TeX('log (SP500(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='red');
lines(year,dftrend,main='Trend of Log SP500 index using Log-linear',
      xlab='Year',ylab=TeX('log-linear(SP500(t))'),
      type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='blue');
legend("bottomright",c("Trend"),lty=c(1),lwd=c(2.5),col=c("blue"))
plot(year,dfcycle,main='Cycle of Log SP500 index using Log-linear',
     xlab='Year',ylab=TeX('log-linear(SP500(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='green');
layout(matrix(c(1,2), 2,1, byrow = TRUE))
plot(year,mort,main='Log SP500 index',
     xlab='Year',ylab=TeX('log (SP500(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='red');
plot(year[1:length(diffxy)],diffxy,
     main='Cycle of Log SP500 index using Log-linear trend',
     xlab='Year',ylab=TeX('log-linear(SP500(t))'),type='l',
     cex.axis=1.1,cex.lab=1.1,lwd=3,col='green');
sta.sp500=list(mean(dfacf$acf),sd(dfacf$acf),var(dfacf$acf),corrlength(dfacf),
               mean(ac1$acf),sd(ac1$acf),var(ac1$acf),corrlength(ac1),
               mean(bc1$acf),sd(bc1$acf),var(bc1$acf),corrlength(bc1));
layout(matrix(c(1,2,3,4), 4,1, byrow = TRUE))
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
dat <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
year=dat[,1]+1/12*dat[,2]
dat=dat[,3]
mort=log(dat)
le=length(dat)
x=mort[2:le]
y=mort[1:le-1]
diffxy=x-y
dur=1:length(year)
lmr=lm(mort~dur)
intercept=coef(lmr)[1]
slope=coef(lmr)[2]
dftrend=intercept+slope*dur
dfcycle=mort-dftrend
dfacf=acf(dfcycle,plot=FALSE,100);
hpf=hpfilter(mort,freq=14400)
ac1=acf(hpf$cycle, ci.type = "ma",plot=FALSE,100)
bc1=acf(diffxy,ci.type="ma",plot=FALSE,100)
layout(matrix(c(1,2), 2,1, byrow = TRUE))
plot(year,mort,main='Log NASDAQ index',
     xlab='Year',ylab=TeX('log (NASDAQ(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='red');
lines(year,dftrend,main='Trend of Log NASDAQ index using Log-linear',
      xlab='Year',ylab=TeX('log-linear(NASDAQ(t))'),
      type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='blue');
legend("bottomright",c("Trend"),lty=c(1),lwd=c(2.5),col=c("blue"))
plot(year,dfcycle,main='Cycle of Log NASDAQ index using Log-linear',
     xlab='Year',ylab=TeX('log-linear(NASDAQ(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='green');
layout(matrix(c(1,2), 2,1, byrow = TRUE))
plot(year,mort,main='Log NASDAQ index',
     xlab='Year',ylab=TeX('log (NASDAQ(t))'),
     type='l',cex.axis=1.1,cex.lab=1.1,lwd=3,col='red');
plot(year[1:length(diffxy)],diffxy,
     main='Cycle of Log NASDAQ index using Log-linear trend',
     xlab='Year',ylab=TeX('log-linear(NASDAQ(t))'),type='l',
     cex.axis=1.1,cex.lab=1.1,lwd=3,col='green');
layout(matrix(c(1,2,3,4), 4,1, byrow = TRUE))
plot(year,mort,main='Log NASDAQ index',
     xlab='Year',ylab=TeX('log (NASDAQ(t))'),type='l',
     col='red',cex.axis=1.1,cex.lab=1.1,lwd=3);
plot(ac1,main='Autocorrelation of log NASDAQ HP Cycles',
     xlab='Lag',ylab='AC(1)')
lines(ac1$lag,ac1$acf,main='Autocorrelation of log NASDAQ HP Cycles',
      xlab='Lag',ylab='AC(1)',type='l',
      col='blue',cex.axis=1.1,cex.lab=1.1,lwd=3)
plot(bc1,main='Autocorrelation of log NASDAQ FD ',
     xlab='Lag',ylab='AC(1)')
lines(bc1$lag,bc1$acf,main='Autocorrelation of log NASDAQ FD',
      xlab='Lag',ylab='AC(1)',type='l',
      col='blue',cex.axis=1.1,cex.lab=1.1,lwd=3)
plot(dfacf,main='Autocorrelation of log-linear NASDAQ  ',
     xlab='Lag',ylab='AC(1)')
lines(dfacf$lag,dfacf$acf,main='Autocorrelation of log-linear NASDAQ ',
      xlab='Lag',ylab='AC(1)',type='l',col='blue',lwd=3)
layout(matrix(c(1,2,3,4,5,6), 3, 2, byrow = TRUE))
#par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
x=seq(-15,15,.1);
y=sin(x)
ac1=acf(y,lag.max=100,plot=FALSE);
plot(x,y,main='Sin wave',xlab='T',ylab='Sin(t)',type='l',
     col='red',cex.axis=1.1,cex.lab=1.1,lwd=3)
plot(ac1,main='Autocorrelation of Sin wave',xlab='Lag',ylab='AC(1)',
     cex.axis=1.1,cex.lab=1.1,lwd=.2)
lines(ac1$lag,ac1$acf,type='l',col='blue',lwd=2)
x=seq(-15,15,.1);
y=x^2+x^3
ac1=acf(y,lag.max=100,plot=FALSE);
plot(x,y,main='Polynomial',
     xlab='T',ylab=TeX('y=x^3(t)+x^2(t)'),type='l',col='red',
     cex.axis=1.1,cex.lab=1.1,lwd=3)
plot(ac1,main='Autocorrelation of Polynomial',
     xlab='Lag',ylab='AC(1)',cex.axis=1.1,cex.lab=1.5,lwd=.2)
lines(ac1$lag,ac1$acf,type='l',col='blue',lwd=2)
x=seq(-15,15,.1);
y=sin(x)*rnorm(length(x),mean=0,sd=1)
ac1=acf(y,lag.max=100,plot=FALSE);
plot(x,y,main='Sin wave with random noise',
     xlab='t',
     ylab=TeX('Sin(t) * r($\\mu=0 ,\\sigma^2=1)'),type='l',col='red',
     cex.axis=1.1,cex.lab=1.1,lwd=2)
plot(ac1,main='Autocorrelation of Sin wave with random noise',
     xlab='Lag',ylab='AC(1)',cex.axis=1.1,cex.lab=1.5,lwd=3)
lines(ac1$lag,ac1$acf,type='l',col='blue',lwd=.2)
corrlength(ac1)
sta.nasdaq=list(mean(dfacf$acf),sd(dfacf$acf),var(dfacf$acf),corrlength(dfacf),
               mean(ac1$acf),sd(ac1$acf),var(ac1$acf),corrlength(ac1),
               mean(bc1$acf),sd(bc1$acf),var(bc1$acf),corrlength(bc1))
print("Dtrend statistics for SP500")
print(matrix(sta.sp500,nrow=4))
print("Dtrend statistics for NASDAQ")
print(matrix(sta.nasdaq,nrow=4))
}

corrlength <- function(acfvector)
  
{
 
  ind=min(which(acfvector$acf<0));
 
  return ((abs(acfvector$acf[ind])+abs(acfvector$acf[ind-1])/10)*(abs(acfvector$acf[ind-1]))+ind-1)
  
}

