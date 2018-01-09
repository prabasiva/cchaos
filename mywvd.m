function mywvd()

%Program used to Wigner Distribution for NASDAQ & SP500 indexes
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: mywvd.m

close all;
clear all;
[sp500,syear]=getData(1);
sp500=log(sp500);
[naq,nyear]=getData(2);
naq=log(naq);

for step = 1:2

    if step == 2
        sp500=naq;
        syear=nyear;
    end;
    
    figure;

    [s2,s1]=hpfilter(sp500,1600);
    subplot(2,3,1);
    plot(syear,sp500);
    xlabel('Time in years');
    ylabel('log s(t)');
    title('Log s(t)');
    
    [wd,freq]=wig2(sp500);
    %[wd,freq]=wig2(sp500,length(sp500),1);
    freq=freq*24;
    subplot(2,3,2);
    contour(syear,freq, abs(wd'),8), grid on 
    xlabel('Time in years');
    ylabel('Frequency');
    title('Contour Map');
    
    subplot(2,3,3);
    mesh(syear,freq,abs(wd'));  
    xlabel('Time in years');
    ylabel('Frequency');
    zlabel('Amplitude');
    
    subplot(2,3,4);
    plot(syear,s1);
    xlabel('Time in years');
    ylabel('Cycles');
    title('HP Filter cycles');
    
    [wd,freq]=wig2(s1);
    %[wd,freq]=wig2(s1,length(s1),1);
    freq=freq*24;
    subplot(2,3,5);
    contour(syear,freq, abs(wd'),8), grid on 
    xlabel('Time in years');
    ylabel('Frequency');
    title('Contour Map');
    
    subplot(2,3,6);
    mesh(syear,freq,abs(wd'));
    xlabel('Time in years');
    ylabel('Frequency');
    zlabel('Amplitude');
    
end;
