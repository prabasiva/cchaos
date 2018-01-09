function drawSTFTEg()
s={'Gaussian Window' 'Hamming Window'};
wlen=25;
hopsize=25;
retno =1;
Ff = 500;
for fla=0:1
    Fs = 1000;            % Sampling frequency
    T = 1/Fs;             % Sampling period
    L = 1000;             % Length of signal
    t = (0:L-1)*T;        % Time vector
    S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
    X = S + 2*randn(size(t));
    figure;
    g=subplot(2,2,1);
  %  plot(1000*t(1:100),X(1:100),'r','LineWidth',1);
    plot(1000*t(1:100),X(1:100),'r','LineWidth',1);
    plot(1000*t,X,'r','LineWidth',1);
    
  L = length(X);
    title('Signal Corrupted with Zero-Mean Random Noise','FontSize',18,'FontWeight','bold')
    xlabel('t (milliseconds)','FontSize',16,'FontWeight','bold')
    ylabel('f(t)','FontSize',16,'FontWeight','bold')
    [Y,ft,tt]=stft2(X,wlen,hopsize,retno,Ff,fla);
    %Y=fftshift(Y);
    P=abs(Y/L);
    g=subplot(2,2,2);
    %plot(tt,P,'b','LineWidth',1);
     spectrogram(X,gausswin(wlen));
    title(['STFT using', s(fla+1)],'FontSize',16,'FontWeight','bold')
    xlabel('\omega','FontSize',16,'FontWeight','bold')
    ylabel('|F(\omega,\tau)|','interpreter','Tex','FontSize',16,'FontWeight','bold')
    g=subplot(2,2,3);
    plot(1000*t(1:100),S(1:100),'r','LineWidth',1);
    L = length(X);
    title('Signal Corrupted with Zero-Mean Random Noise','FontSize',18,'FontWeight','bold')
    xlabel('t (milliseconds)','FontSize',16,'FontWeight','bold')
    ylabel('f(t)','FontSize',16,'FontWeight','bold')
    [Y,ft,tt]=stft2(S,wlen,hopsize,retno,Ff,fla);
    %Y=fftshift(Y);
    P=abs(Y/L);
    g=subplot(2,2,4);
    plot(tt,P,'b','LineWidth',1);
    title(['STFT using',s(fla+1)],'FontSize',16,'FontWeight','bold')
    xlabel('\omega','interpreter','Tex','FontSize',16,'FontWeight','bold')
    ylabel('|F(\omega,\tau)|','interpreter','Tex','FontSize',16,'FontWeight','bold')
   
end
