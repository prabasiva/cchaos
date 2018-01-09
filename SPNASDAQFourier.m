function SPNASDAQFourier()
%Program used to Discrete Fourier transform
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: SPNASDAQFourier.m
Fs = 1000;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
X = S + 2*randn(size(t));
wsize=1000;
g=subplot(5,2,1);
plot(1000*t(1:wsize),X(1:wsize),'r','LineWidth',1);
title('Signal Corrupted with Zero-Mean Random Noise','FontSize',18,'FontWeight','bold')
xlabel('t (milliseconds)','FontSize',16,'FontWeight','bold')
ylabel('f(t)','FontSize',16,'FontWeight','bold')
%N=2^nextpow2(L);
Y = fft(X);
P2 = abs(Y/L);P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
g=subplot(5,2,2);
plot(f,P1,'b','LineWidth',1)
title('Single-Sided Amplitude Spectrum of f(t)','FontSize',16,'FontWeight','bold')
xlabel('w','FontSize',16,'FontWeight','bold')
ylabel('|F(w)|','FontSize',16,'FontWeight','bold')
g=subplot(5,2,3);
plot(1000*t(1:wsize),S(1:wsize),'r','LineWidth',1);
title('Signal with No Random Noise','FontSize',18,'FontWeight','bold')
xlabel('t (milliseconds)','FontSize',16,'FontWeight','bold')
ylabel('f(t)','FontSize',16,'FontWeight','bold')
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
g=subplot(5,2,4);
plot(f,P1,'b','LineWidth',1)
title('Single-Sided Amplitude Spectrum of f(t)','FontSize',18,'FontWeight','bold')
xlabel('w','FontSize',16,'FontWeight','bold')
ylabel('|F(w)|','FontSize',16,'FontWeight','bold')
Fs = 100;           % Sampling frequency
t = -0.5:1/Fs:0.5;  % Time vector
L = length(t);      % Signal length
X = 1/(4*sqrt(2*pi*0.01))*(exp(-t.^2/(2*0.01)));
g=subplot(5,2,5)
plot(t,X,'r','LineWidth',1)
title('Gaussian Pulse in Time Domain','FontSize',18,'FontWeight','bold')
xlabel('Time (t)','FontSize',16,'FontWeight','bold')
ylabel('f(t)','FontSize',16,'FontWeight','bold')
n = 2^nextpow2(L);
Y = fft(X,n);
%f = Fs*(0:(n/2))/n;
f = Fs*(-n/2:n/2-1)/n
P = abs(Y/n);
g=subplot(5,2,6)
plot(f,fftshift(P),'b','LineWidth',1)
%plot(f,fftshift(P(1:n/2+1)),'b','LineWidth',1)
%plot(1:wsize,P(1:wsize),'b','LineWidth',1)
title('Gaussian Pulse in Frequency Domain','FontSize',18,'FontWeight','bold')
xlabel('Frequency (w)','FontSize',16,'FontWeight','bold')
ylabel('|F(w)|','FontSize',16,'FontWeight','bold')
[naq,year]=getData(2);
[dum,naq]=hpfilter(naq,14400);
g=subplot(5,2,7)
plot(year,naq,'r','LineWidth',1);
title('HPFilter of Log Nasdaq','FontSize',18,'FontWeight','bold');
xlabel('Year.month','FontSize',16,'FontWeight','bold');
ylabel('Cycles','FontSize',16,'FontWeight','bold');
%Fs = 1000;
Fs = 12;
[L,tp]=size(naq)
n = 2^nextpow2(L);
Y = fft(naq,n);
f = Fs*(0:(n/2))/n;
P = abs(Y/n);
g=subplot(5,2,8)
%plot(f,P(1:n/2+1),'b','LineWidth',1)
%plot(1:n/2+1,P(1:n/2+1),'b','LineWidth',1)
plot(f,P(1:n/2+1),'b','LineWidth',1)

title('HPFilter of NASDAQ in Frequency Domain','FontSize',18,'FontWeight','bold')
xlabel('Frequency (w)','FontSize',16,'FontWeight','bold')
ylabel('|F(w)|','FontSize',16,'FontWeight','bold')
[sp500,year]=getData(1);
[dum,sp500]=hpfilter(sp500,14400);
g=subplot(5,2,9)
plot(year,sp500,'r','LineWidth',1);
title('HPFilter of Log S&P 500','FontSize',18,'FontWeight','bold');
xlabel('Year.month','FontSize',16,'FontWeight','bold');
ylabel('Cycles','FontSize',16,'FontWeight','bold');
[L,tp]=size(sp500)
n = 2^nextpow2(L);
Y = fft(sp500,n);
f = Fs*(0:(n/2))/n;
P = abs(Y/n);
g=subplot(5,2,10)
%plot(f,P(1:n/2+1),'b','LineWidth',1);
plot(f,P(1:n/2+1),'b','LineWidth',1);
title('HPFilter of S&P in Frequency Domain','FontSize',18,'FontWeight','bold')
xlabel('Frequency (w)','FontSize',16,'FontWeight','bold')
ylabel('|F(w)|','FontSize',16,'FontWeight','bold')
