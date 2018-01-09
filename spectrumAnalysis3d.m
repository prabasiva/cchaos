%Program used to Time Frequency for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: spectrumAnalysis3d.m
    

function spectrumAnalysis3d()

close all;
[sp500,syear]=getData(1);
[trend, sp] = hpfilter(sp500,14400);
[naq,nyear]=getData(2);
[trend, na] = hpfilter(naq,14400);
nSamp = 2000;
t = (0:nSamp-1)'/nSamp;
t1 = t(1:int16(nSamp/3));
t2 = t(int16(nSamp/3)+1:2*int16(nSamp/3));
t3 = t(2*int16(nSamp/3)+1:nSamp);
x11 = sin(2*pi*300*t1);
x12 = sin(2*pi*200*t2);
x13 = sin(2*pi*100*t3);
x=[x11;x12;x13];
N=length(x);
win=100;
  figure;
    subplot(3,2,1);
    plot(syear,sp);
    title('S&P Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold');
        xlabel('Years','FontSize',14,'FontWeight','bold')
        ylabel('Cycle','FontSize',14,'FontWeight','bold')

        spectrogram(sp,[],[],[],4/(1e7),'yaxis');
    
    title('STFA of S&P - HP Filter Cycles \lambda = 14400','FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

        
    subplot(3,2,3);
    out=spectrogram(sp,gausswin(win),[],[],4/(1e7),'yaxis');
     surf(abs(out));
    
    title({'Gaussian Window of window length = 100','S&P - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

    subplot(3,2,5);
        out=spectrogram(sp,hamming(win),[],[],4/(1e7),'yaxis');
    surf(abs(out));
    
    title({'Hamming Window of window length = 100','S&P - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

        
    subplot(3,2,2);
    plot(nyear,na);
    title('NASDAQ Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold')
        xlabel('Years','FontSize',14,'FontWeight','bold')
        ylabel('Cycle','FontSize',14,'FontWeight','bold')
        
    subplot(3,2,4);
        out=spectrogram(na,gausswin(win),[],[],4/(1e7),'yaxis')
        surf(abs(out));
    title({'Gaussian Window of window length = 100','NASDAQ - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
        
    subplot(3,2,6);
      out=  spectrogram(na,hamming(win),[],[],4/(1e7),'yaxis')
        surf(abs(out));
    title({'Hamming Window of window length = 100','NASDAQ - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
end

   
