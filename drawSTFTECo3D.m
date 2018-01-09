function drawSTFTECo3D()
close all;
clear all;
[sp500,syear]=getData(1);
[naq,nyear]=getData(2);

s={'using Gaussian Window' 'using Hamming Window'};
wlen=2^6;
    figure;
    
for fla=0:1
    g=subplot(2,3,1+(3*fla));
    if fla==1
       [trend, X] = hpfilter(sp500,14400);
       xaxis=syear;
    else
        [trend, X] = hpfilter(naq,14400);
        xaxis=nyear;
    end;
    plot(xaxis,X,'r','LineWidth',1);
  
    if fla==1
        title('HP Filter cycles (\lambda =14400) for SP500','FontSize',18,'FontWeight','bold')
    else    
        title('HP Filter cycles (\lambda =14400) for NASDAQ','FontSize',18,'FontWeight','bold')
    end
    xlabel('Years','FontSize',16,'FontWeight','bold')
    ylabel('Cycles','FontSize',16,'FontWeight','bold')
   g=subplot(2,3,2+(3*fla));
   out=spectrogram(X,gausswin(wlen));
   surf(abs(out));
    title(['|STFT(t,\omega)|', s(1)],'FontSize',16,'FontWeight','bold')
    g=subplot(2,3,3+(3*fla));
    out=spectrogram(X,hamming(wlen));
    surf(abs(out));
    title(['|STFT(t,\omega)|', s(2)],'FontSize',16,'FontWeight','bold')
    end
    
end


