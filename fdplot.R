fdplot <-function()
{
  #Program used to create the Difference stationary for NASDAQ & SP500 indexes
  # Praba Siva
  # praba@umich.edu
  # @prabasiva
  layout(matrix(c(1,1,2,2), 2, 2, byrow = TRUE))
  setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
  fspcom=read.table('fspcom.dat')
  dat = log(fspcom[,5])
  year=fspcom[,2]+1/12*fspcom[,3]
  t1=dat[1:length(dat)-1]
  t2=dat[2:length(dat)]
  plot(year[1:length(year)-1],t2-t1,type='l',
       main="Difference stationary of first Differencing of log(x(t))\nx(t) = S&P 500", 
       xlab="Year",ylab="FD",col='blue',
       ylim=c(-.2,.2),cex.axis=1.1,cex.lab=1.5,lwd=2.2) 
  setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
  dat <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
  year=dat[,1]+1/12*dat[,2]
  dat=log(dat[,3])
  t1=dat[1:length(dat)-1]
  t2=dat[2:length(dat)]
  plot(year[1:length(year)-1],t2-t1,type='l',
       main="Difference stationary of first Differencing of log(x(t))\nx(t) = NASDAQ", 
       xlab="Year",ylab="FD",col='red',
       ylim=c(-.2,.2),cex.axis=1.1,cex.lab=1.5,lwd=2.2) 
  
}
