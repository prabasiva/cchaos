function myTDFS
%Program used to Gabor Coefficients for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: myTDFS.m
close all;
clear all;
%[sp500,syear]=getData(1);
%process(sp500,1);
%[naq,nyear]=getData(2);
%process(naq,2);


mlen=45;
nlen=40;
d1=1;
d2=0;
deltam=20;
deltan=10;
sigma=20;
sigma1=1/sigma;

m=1:mlen-d1;
m1=d1+1:mlen;

n=1:nlen-d2;
n1=d2+1:nlen;

[dum,mdim]=size(m);
[dum,ndim]=size(n);

mm1by2 = (m+m1)/2;
nn1by2 = (n+n1)/2;

mm1by2 = deltam*mm1by2;
nn1by2 = deltan*nn1by2;
nn = deltan*(n-n1);
wvdhh=zeros(mdim,ndim);
k=1:ndim;
a11= -sigma1 * ((k - nn1by2).^2);
    
% i = p
% k = q

for p = 1:mdim
    a1 = -sigma * (p - ((m(p)+m1(p))/2)*deltam).^2;
    a=a1+a11;
    bconst=(m(p)-m1(p))*deltam;
    b1= bconst*k;
    b2=nn*p;
    b3=bconst*nn1by2;
    b = (2*pi/nlen).*(b1+b2-b3);
   b1
   b2
   b3
   
    wvdhh(p,k)=2*exp(a1+a11).*exp(i*b);
end


surf(abs(wvdhh));


        
