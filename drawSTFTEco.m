function drawSTFTECo()
[sp500,syear]=getData(1);
[naq,nyear]=getData(2);

s={'Gaussian Window' 'Hamming Window'};
wlen=25;
hopsize=25;
retno =1;
Ff = 20;
for fla = 0:1
    figure;
    X=naq;
    g=subplot(2,2,1);
    plot(nyear,X,'r','LineWidth',1);
    title('Log Nasdaq','FontSize',18,'FontWeight','bold');
    xlabel('Year.month','FontSize',16,'FontWeight','bold');
    ylabel('Log Nasdaq','FontSize',16,'FontWeight','bold');
    L = length(X);
    [Y,ft,tt]=stft2(X,wlen,hopsize,retno,Ff,fla);
    %Y=fftshift(Y);
    P=abs(Y/L);
    g=subplot(2,2,2);
    %plot(tt,P,'b','LineWidth',1);
    plot(P,'b','LineWidth',1);

    title(['Nasdaq in STFT using', s(fla+1)],'FontSize',18,'FontWeight','bold')
    xlabel('\omega','interpreter','Tex','FontSize',16,'FontWeight','bold')
    ylabel('|F(\omega,t)|','interpreter','Tex','FontSize',16,'FontWeight','bold')
    g=subplot(2,2,3);
    X=sp500;
    plot(syear,X,'r','LineWidth',1);
    L = length(X);
    title('Log S&P 500','FontSize',18,'FontWeight','bold');
    xlabel('Year.month','FontSize',16,'FontWeight','bold');
    ylabel('Log S&P 500','FontSize',16,'FontWeight','bold');
    [Y,ft,tt]=stft2(X,wlen,hopsize,retno,Ff,fla);
    %Y=fftshift(Y);
    P=abs(Y/L);
    g=subplot(2,2,4);
    %plot(tt,P,'b','LineWidth',1);
    plot(P,'b','LineWidth',1);
    title(['S&P 500 in STFT', s(fla+1)],'FontSize',16,'FontWeight','bold')
    xlabel('\omega','interpreter','Tex','FontSize',16,'FontWeight','bold')
    ylabel('|F(\omega,t)|','interpreter','Tex','FontSize',16,'FontWeight','bold')
end;
