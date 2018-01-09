%Program used to Time Frequency for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: spectrumAnalysis3.m
    

function spectrumAnalysis3()
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
    subplot(5,3,1);
    plot(t,x);
     title('Signal with three different frequencies varying in time','FontSize',18,'FontWeight','bold')
        xlabel('t (Seconds)','FontSize',14,'FontWeight','bold')
        ylabel('f(t)','FontSize',14,'FontWeight','bold')
    subplot(5,3,4);
    plot(abs(fft(x)));
     title('Frequency Domain','FontSize',18,'FontWeight','bold')
        xlabel('Frequency','FontSize',14,'FontWeight','bold')
        ylabel('|F(s)|','FontSize',14,'FontWeight','bold')
    subplot(5,3,7);
         spectrogram(x,[],[],[],N,'yaxis')  
     title('Short Time Frequency Analysis (STFA)','FontSize',18,'FontWeight','bold')
   
        xlabel('Time','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
subplot(5,3,10);
         spectrogram(x,gausswin(win),[],[],N,'yaxis')  
    title({'Gaussian Window of window length = 100 ms'},...
        'FontSize',16,'FontWeight','bold')
    
        xlabel('Time','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
subplot(5,3,13);
         spectrogram(x,hamming(win),[],[],N,'yaxis')  
         
    title({'Hamming Window of window length = 100 ms'},...
        'FontSize',16,'FontWeight','bold')
    
        xlabel('Time','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

        
    subplot(5,3,2);
    plot(syear,sp);
    title('S&P Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold');
        xlabel('Years','FontSize',14,'FontWeight','bold')
        ylabel('Cycle','FontSize',14,'FontWeight','bold')

    subplot(5,3,5);
    plot(abs(fft(sp)));
    title('S&P - HP Filter Cycles in Frequency Domain','FontSize',18, 'FontWeight','bold')
        xlabel('Frequency','FontSize',14,'FontWeight','bold')
        ylabel('|F(s)|','FontSize',14,'FontWeight','bold')

    subplot(5,3,8);
        spectrogram(sp,[],[],[],12,'yaxis');
    
    title('STFA of S&P - HP Filter Cycles \lambda = 14400','FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

        
    subplot(5,3,11);
        spectrogram(sp,gausswin(win),[],[],12,'yaxis');
    
    title({'Gaussian Window of window length = 100','S&P - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

    subplot(5,3,14);
        spectrogram(sp,hamming(win),[],[],12,'yaxis');
    
    title({'Hamming Window of window length = 100','S&P - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')

        
    subplot(5,3,3);
    plot(nyear,na);
    title('NASDAQ Index - HP Filter Cycles \lambda = 14400','FontSize',18,'FontWeight','bold')
        xlabel('Years','FontSize',14,'FontWeight','bold')
        ylabel('Cycle','FontSize',14,'FontWeight','bold')
    subplot(5,3,6);
    plot(abs(fft(na)));
    title('NASDAQ - HP Filter Cycles in Frequency Domain','FontSize',18,'FontWeight','bold')
        xlabel('Frequency','FontSize',14,'FontWeight','bold')
        ylabel('|F(s)|','FontSize',14,'FontWeight','bold')

    subplot(5,3,9);
        spectrogram(na,[],[],[],12,'yaxis')
        
    title('STFA of NASDAQ - HP Filter Cycles \lambda = 14400','FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
        
    subplot(5,3,12);
        spectrogram(na,gausswin(win),[],[],12,'yaxis')
        
    title({'Gaussian Window of window length = 100','NASDAQ - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
        
    subplot(5,3,15);
        spectrogram(na,hamming(win),[],[],12,'yaxis')
        
    title({'Hamming Window of window length = 100','NASDAQ - HP Filter Cycles \lambda = 14400'},...
        'FontSize',16,'FontWeight','bold')
        xlabel('Time in Years','FontSize',14,'FontWeight','bold')
        ylabel('Frequency','FontSize',14,'FontWeight','bold')
end

   
