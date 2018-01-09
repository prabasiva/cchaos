function drawSpecEg()
close all;
clear all;
 Fs = 1000;            % Sampling frequency
    T = 1/Fs;             % Sampling period
    L = 1000;             % Length of signal
    t = (0:L-1)*T;        % Time vector
    S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
    Y = S + 2*randn(size(t));
s={'using Gaussian Window' 'using Hamming Window'};
wlen=2^6;
    figure;
    
for fla=0:1
    g=subplot(2,3,1+(3*fla));
    if fla==1
      X=S;
    else
        X=Y;  
    end;
    plot(L*t,X,'r','LineWidth',1);
  
    if fla==1
        
        title('Signal with No Random Noise','FontSize',18,'FontWeight','bold')
    else    
        title('Signal Corrupted with Zero-Mean Random Noise','FontSize',18,'FontWeight','bold')
    end
    xlabel('t (milliseconds)','FontSize',16,'FontWeight','bold')
    ylabel('f(t)','FontSize',16,'FontWeight','bold')
   g=subplot(2,3,2+(3*fla));
  spectrogram(X,gausswin(wlen));
   ylabel(g,'Time (ms)');
     title(['|STFT(t,\omega)|', s(1)],'FontSize',16,'FontWeight','bold')
    g=subplot(2,3,3+(3*fla));
   spectrogram(X,hamming(wlen));
     title(['|STFT(t,\omega)|', s(2)],'FontSize',16,'FontWeight','bold')
     ylabel(g,'Time (ms)');
    end
    
end


