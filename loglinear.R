loglinear<-function()
{
  #Program used to Log linear example
  #Filename:loglinear.R
  # Praba Siva
  # praba@umich.edu
  # @prabasiva
layout(matrix(c(1,1,2,2), 2, 2, byrow = TRUE))
t=0:50000;
plot(t,exp(t*-.0001),main=TeX('$\\beta_1 < 0$'),
     xlab='Time t', ylab=TeX('log Y =$\\beta_0+\\beta_1 t$'),
     type='l',cex.axis=1.1,cex.lab=.9,lwd=3,col='red')
plot(t,exp(t*.0001),main=TeX('$\\beta_1 > 0$'),
     xlab='Time t', ylab=TeX('log Y =$\\beta_0+\\beta_1 t$'),type='l',
     cex.axis=1.1,cex.lab=.9,lwd=3,col='blue')
par(opar)
}