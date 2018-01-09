llt<-function()
{
  #Program used to Log linear trend and cycles for SP500 & NASDAQ index
  # Praba Siva
  # praba@umich.edu
  # @prabasiva
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
fspcom=read.table('fspcom.dat')
year=fspcom[,2]
tsfspcom=ts(log(fspcom[,5]),start=year[1],
            end=c(year[length(year)],12),frequency=12)
loglinear=stl(log(tsfspcom),s.window=5)
plot(loglinear,main="A Seasonal-Trend Decomposition of S&P 500",
     col='red')
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
dat <- read.csv(file="nasdaq_ready.csv",head=TRUE,sep=",")
year=dat[,1]
dat=dat[,3]
tsnasdaq=ts(dat,start=year[1],
            end=c(year[length(year)]-1,12),frequency=12)
nloglinear=stl(log(tsnasdaq),s.window=5)
plot(nloglinear,main="A Seasonal-Trend Decomposition of NASDAQ",
     col="blue")
strend=loglinear$time.series[,2]
ntrend=nloglinear$time.series[,2]
plot(year[1:length(strend)],strend[1:length(strend)],
     col='blue',type='l',ylim=range(strend,ntrend))
lines(year[1:length(ntrend)],ntrend[1:length(ntrend)],
      col='red',type='l')
}