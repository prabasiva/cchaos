
close all;
[sp500,syear]=getData(1);
[trend, y1] = hpfilter(sp500,14400);

N=length(y1);
%t=(0:1/N:1-1/N);
t=(0:N-1)'/N;
y=sin(2*pi*100*t)+2*sin(2*pi*200*t);
subplot(4,2,1);
plot(t,y);
ax=gca;
ax.TickLabelInterpreter='latex';
xlabel('Time in Seconds','FontSize',10,'FontWeight','bold');
title('y=sin(2\pi100t)+2sin(2\pi200t)','FontSize',12,'FontWeight','bold')
%title(['$',latex(y),'$'],'Interpreter','latex')
subplot(4,2,2);
plot(syear,y1);
subplot(4,2,3);
plot(abs(fft(y)));
subplot(4,2,4);
plot(abs(fft(y1)));
subplot(4,2,5);
spectrogram(y,[],[],[],N,'yaxis');
%ax=gca;
%ax.YLim = [0 100];
subplot(4,2,6);
spectrogram(y1,[],[],[],N,'yaxis');
subplot(4,2,7);
%pwelch(y,[],[],[],N)

spectrogram(y,[],[],[],N,'yaxis')

subplot(4,2,8);
%pwelch(y1,[],[],[],N)
spectrogram(y1,[],[],[],4/(1e7),'yaxis')


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
subplot(4,2,1);
plot(t,x);
subplot(4,2,2);
plot(abs(fft(x)));
subplot(4,2,3);
spectrogram(x,64,32,32,N,'yaxis');
subplot(4,2,4);
%spectrogram(x,128,120,128,1e3,'yaxis')
spectrogram(x,128,120,128,N,'yaxis')

subplot(4,2,5);
spectrogram(x,32,16,16,N,'yaxis')


subplot(4,2,6);
spectrogram(x,[],[],[],N,'yaxis')

subplot(4,2,7);
%pwelch(y,[],[],[],N)

spectrogram(y,[],[],[],N,'yaxis')

subplot(4,2,8);
%pwelch(y1,[],[],[],N)
spectrogram(y1,[],[],[],1/1e6,'yaxis')

