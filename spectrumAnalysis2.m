close all;
[sp500,syear]=getData(1);
r=randi([1,length(sp500)],1,length(sp500));
sp500(1:length(sp500))=sp500(r);
syear(1:length(sp500))=syear(r);
[trend, sp] = hpfilter(sp500,14400);
for i = 1:6
delta = 20+i*20;
a=sp(1:length(sp)-delta);
b=sp(delta+1:length(sp));
subplot(3,2,i)
plot(a,b);
end;

[naq,nyear]=getData(2);
r=randi([1,length(nyear)],1,length(nyear));
naq(1:length(naq))=naq(r);
nyear(1:length(naq))=nyear(r);


[trend, na] = hpfilter(naq,14400);
nSamp = 2000;
Fs = 1000;
%t = (0:nSamp-1)'/Fs;
t = (0:nSamp-1)'/nSamp;
t1 = t(1:int16(nSamp/3));
t2 = t(int16(nSamp/3)+1:2*int16(nSamp/3));
t3 = t(2*int16(nSamp/3)+1:nSamp);
x11 = sin(2*pi*300*t1);
x12 = sin(2*pi*200*t2);
x13 = sin(2*pi*100*t3);
x=[x11;x12;x13];
N=length(x);

figure;
subplot(3,2,1);
plot(t,x);
subplot(3,2,3);
plot(abs(fft(x)));
subplot(3,2,5);
spectrogram(x,[],[],[],N,'yaxis')

subplot(3,2,2);
plot(syear,sp);
subplot(3,2,4);
plot(abs(fft(sp)));
subplot(3,2,6);
spectrogram(sp,[],[],[],4/(1e7),'yaxis')

figure;
subplot(3,2,1);
plot(t,x);
subplot(3,2,3);
plot(abs(fft(x)));
subplot(3,2,5);
spectrogram(x,[],[],[],N,'yaxis')


subplot(3,2,2);
plot(nyear,na);
subplot(3,2,4);
plot(abs(fft(na)));
subplot(3,2,6);
spectrogram(na,[],[],[],2/(1e7),'yaxis')
