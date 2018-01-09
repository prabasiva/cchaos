function spectrumAnalysis()
close all;
[sp500,syear]=getData(1);
[trend, sp] = hpfilter(sp500,14400);
[naq,nyear]=getData(2);
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
 title('Signal with three different frequencies varying in time','FontSize',18,'FontWeight','bold')
    xlabel('t (milliseconds)','FontSize',14,'FontWeight','bold')
    ylabel('f(t)','FontSize',14,'FontWeight','bold')
subplot(3,2,3);
plot(abs(fft(x)));
 title('Frequency Domain','FontSize',18,'FontWeight','bold')
    xlabel('Frequency','FontSize',14,'FontWeight','bold')
    ylabel('|F(s)|','FontSize',14,'FontWeight','bold')
subplot(3,2,5);
spectrogram(x,[],[],[],N,'yaxis')
 title('Short Time Frequency Analysis (STFA)','FontSize',18,'FontWeight','bold')
    xlabel('Time','FontSize',14,'FontWeight','bold')
    ylabel('Frequency','FontSize',14,'FontWeight','bold')

subplot(3,2,2);
plot(syear,sp);
title('S&P Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold')
    xlabel('Years','FontSize',14,'FontWeight','bold')
    ylabel('Cycle','FontSize',14,'FontWeight','bold')
    
subplot(3,2,4);
plot(abs(fft(sp)));
title('S&P Index - HP Filter Cycles in Frequency Domain','FontSize',18,'FontWeight','bold')
    xlabel('Frequency','FontSize',14,'FontWeight','bold')
    ylabel('|F(s)|','FontSize',14,'FontWeight','bold')

subplot(3,2,6);
spectrogram(sp,[],[],[],4/(1e7),'yaxis')
title('STFA of S&P Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold')
    xlabel('Time in Years','FontSize',14,'FontWeight','bold')
    ylabel('Frequency','FontSize',14,'FontWeight','bold')

figure;
subplot(3,2,1);
plot(t,x);
title('Signal with three different frequencies varying in time','FontSize',18,'FontWeight','bold')
    xlabel('t (milliseconds)','FontSize',14,'FontWeight','bold')
    ylabel('f(t)','FontSize',14,'FontWeight','bold')
subplot(3,2,3);
plot(abs(fft(x)));
title('Frequency Domain','FontSize',18,'FontWeight','bold')
    xlabel('Frequency','FontSize',14,'FontWeight','bold')
    ylabel('|F(s)|','FontSize',14,'FontWeight','bold')

subplot(3,2,5);
spectrogram(x,[],[],[],N,'yaxis')
title('Short Time Frequency Analysis (STFA)','FontSize',18,'FontWeight','bold')
    xlabel('Time','FontSize',14,'FontWeight','bold')
    ylabel('Frequency','FontSize',14,'FontWeight','bold')


subplot(3,2,2);
plot(nyear,na);
title('NASDAQ Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold')
    xlabel('Years','FontSize',14,'FontWeight','bold')
    ylabel('Cycle','FontSize',14,'FontWeight','bold')
subplot(3,2,4);
plot(abs(fft(na)));
title('NASDAQ Index - HP Filter Cycles in Frequency Domain','FontSize',18,'FontWeight','bold')
    xlabel('Frequency','FontSize',14,'FontWeight','bold')
    ylabel('|F(s)|','FontSize',14,'FontWeight','bold')

subplot(3,2,6);
spectrogram(na,[],[],[],2/(1e7),'yaxis')
title('STFA of NASDAQ Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold')
    xlabel('Time in Years','FontSize',14,'FontWeight','bold')
    ylabel('Frequency','FontSize',14,'FontWeight','bold')

end
