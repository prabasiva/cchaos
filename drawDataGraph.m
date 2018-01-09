function drawDataGraph()
%Program used to Gabor Coefficients for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: drawDataGraph
close all;
clear all;
[sp500,syear]=getData(1);
[naq,nyear]=getData(2);
subplot(2,2,1);
plot(syear,exp(sp500),'r','LineWidth',1);
title('SP500 Index','FontSize',18,'FontWeight','bold')
xlabel('Year','FontSize',16,'FontWeight','bold')
ylabel('SP500','FontSize',16,'FontWeight','bold')
subplot(2,2,2);
plot(syear,sp500,'b','LineWidth',1);
title('SP500 Index - Logirthmic Scale','FontSize',18,'FontWeight','bold')
xlabel('Year','FontSize',16,'FontWeight','bold')
ylabel('log(SP500)','FontSize',16,'FontWeight','bold')
subplot(2,2,3);
plot(nyear,exp(naq),'r','LineWidth',1);
title('NASDAQ Index','FontSize',18,'FontWeight','bold')
xlabel('Year','FontSize',16,'FontWeight','bold')
ylabel('NASDAQ','FontSize',16,'FontWeight','bold')

subplot(2,2,4);
plot(nyear,naq,'b','LineWidth',1);
title('NASDAQ Index - Logirthmic Scale','FontSize',18,'FontWeight','bold')
xlabel('Year','FontSize',16,'FontWeight','bold')
ylabel('log(NASDAQ)','FontSize',16,'FontWeight','bold')


end