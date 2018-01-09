
function drawSTFTv2()

close all;
[sp500,syear]=getData(1);
[trend, y1] = hpfilter(sp500,14400);
[naq,nyear]=getData(2);
[trend,y2] = hpfilter(naq,14400);

nSamp = 550;
%nSamp = 2000;
%Fs = 1000;
%t = (0:nSamp-1)'/Fs;
t = (0:nSamp-1)'/nSamp;
t1 = t(1:int16(nSamp/3));
t2 = t(int16(nSamp/3)+1:2*int16(nSamp/3));
t3 = t(2*int16(nSamp/3)+1:nSamp);
x11 = sin(2*pi*150*t1);
x12 = sin(2*pi*100*t2);
x13 = sin(2*pi*50*t3);
y3=[x11;x12;x13];

for i = 1:3
figure;
if i == 1
    x=y3;
elseif i == 2
     x = y2;
     t = nyear;
else
     x= y1;
     t = syear;
end;
subplot(4,2,1);
plot(t,x);
subplot(4,2,2);
plot(abs(fft(x)));
subplot(4,2,3);
len=length(t);
spectrogram(x,64,32,32,len,'yaxis');
subplot(4,2,4);

spectrogram(x,64,32,128,len,'yaxis')

subplot(4,2,5);
spectrogram(x,64,32,64,len,'yaxis')


subplot(4,2,6);
spectrogram(x,128,64,32,len,'yaxis')

subplot(4,2,7);
spectrogram(x,128,120,128,len,'yaxis')

subplot(4,2,8);
spectrogram(x,128,64,64,len,'yaxis')
%ax=gca;
%ax.XLimMode='manual';
%ax.XTickMode='manual';
%xt=ax.XTick
%dur=floor(length(t)/length(xt));
%ind=dur:dur:length(t);
%ind
%t(ind)
%ax.XTick=ind;
%ax.XTickLabel=t(ind);

end;

end