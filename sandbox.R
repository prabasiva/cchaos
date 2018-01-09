
library(mFilter)
delta=60
opar <- par(no.readonly=TRUE)
setwd("/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program")
fspcom=read.table('fspcom.dat')
dat = fspcom[,5]
year=fspcom[,2]+1/12*fspcom[,3]
gtemp=log(dat)
fit = lm(dat~time(dat), na.action=NULL)
par(mfrow=c(3, 1))
plot(dat,type='l',main="signal")
plot(resid(fit), type='l', main="Detrended")
plot(diff(dat), type='l', main='First Difference')
