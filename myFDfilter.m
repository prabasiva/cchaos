function myFDfilter()
%Program used to Gabor Coefficients for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: myFDfilter.m
close all;
clear all;
[sp500,syear]=getData(1);
process(sp500,1);
[naq,nyear]=getData(2);
process(naq,2);


function process(sp500,flag)

 % First differening
 % Graph looks identifical as shown in the P.Chen's paper
 % P.Chen's paper says it is log of sp500 data but he used sp500 
 % The graph in his paper shows it all.
    
    len=size(sp500);
    t1=sp500(1:len-1);
    t2=sp500(2:len);
    fd=t2-t1;
    lenfd=size(fd);
    delta=40;
    x=fd(1:lenfd-delta);
    y=fd(delta+1:lenfd);
    figure;
    subplot(2,1,1);
    scatter(x,y,'b');
    xlabel('X(t)','Fontsize',20);
    ylabel('X(t+T)', 'Fontsize', 20);
    if flag ==1
        title('FD Series for SP500 Index','Fontsize',20);
    else
        title('FD Series for NASDAQ Index','Fontsize',20);
    end;
    y=fd;
    n=size(y);
    % C and Phi values are given in the P.Chen's paper.
  
    c = 0.006*0.002;
    phi = [0.000265*0.043, -0.81*0.043];
  
    % White noise created based on the standard deviation value 
    noise = 0.033*randn(n(1),1);
    
    for t=3:n
       x(t-2) = c + phi(1)*y(t-1) + phi(2)*y(t-2) +noise(t-2); 
    end
    lenfd=size(x);
    delta=5;
    x1=x(1:lenfd-delta);
    y1=x(delta+1:lenfd);
    subplot(2,1,2);
    scatter(x1,y1,'r');
    xlabel('X(I)','Fontsize',20);
    ylabel('X(I+T)', 'Fontsize', 20);
    if flag ==1
        title('AR(2)for FDSeries of SP500 index','Fontsize',20);
    else
       title('AR(2)for FDSeries of NASDAQ index','Fontsize',20);
    end;
end
end
