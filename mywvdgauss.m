function mywvdgauss()

%Program used to Wigner Ville Distribution for Gaussian function
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: mywvdgauss.m

close all;
clear all;
sig = [.1,.8,1,1.2,10];
j=1;
[dummy,winx]=size(sig);
winy=2;
for i = 1:winx 
    t=-128:127;
    sigma=sig(i);
    coef=nthroot(pi*sigma*sigma,-4);
    expo=(t.*t)/2*sigma*sigma;
    g=coef*exp(-expo);
    subplot(winx,winy,j);
    plot(t,g);
    title(['Sigma = ',num2str(sigma)],'FontSize',14,'FontWeight','bold');
    set(gca,'fontsize',12,'FontWeight','bold')
   
    j=j+1;
    [wd,freq]=wig2(g);
    subplot(winx,winy,j)
    j=j+1;
    contour(t,freq,wd',8)
    set(gca,'fontsize',12,'FontWeight','bold')
end
