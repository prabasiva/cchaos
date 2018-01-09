function profTDFS
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

close all;
clear all;

d1=2;
d2=0;
D=d1+d2;
deltam=40;
deltan=40;
sigma=15;
%sigma1=1/sigma;


t=-121:120;
[dummy,len]=size(t);
f = 1./(len*t*2);
n1=floor(((f-(3/sigma))/deltan)-D/2)
n2=ceil(((f+(3/sigma))/deltan)+D/2)
m1=floor(((t-(3*sigma))/deltam)-D/2);
m2=ceil(((t+(3*sigma))/deltam)+D/2);

[dummy, mlen] = size(m1);
[dummy, nlen] = size(n1);
T = deltan;
omega = deltam;

tfds = zeros(mlen,nlen);
wvdhh = zeros(mlen,nlen);

for d = 1:3

    d1=d;
    d2=0;
    D=d1+d2;

    a1=2*exp(-(t.^2/sigma^2)+(sigma^2*f.^2));
    figure;
    plot(t,a1);
    figure;
    for i = 1: mlen
        for j = 1 : nlen
            for m = m1(i) : m2(i)
                for n = n1(j) : n2(j)

                 for m_1 = m-d1 :m+d2
                 %  for m_1 = m-d1 :m+d1
                %    for m_1 = m-D :m+D
     %
                        n_1 = (D - abs(m-m_1));
                        t_mu= ((m+m_1)/2) * T;
                        omega_mu = ((n+n_1)/2) * omega;
                        t_d = (m - m_1) * T;
                        omega_d = (n - n_1) * omega;

                        a2=exp(i*omega_d*t_mu);
                        a3=exp(-i*(t_d*f(i) - omega_d*t(i)));

                       wvdhh(i,j)=a1(i)*a2*a3;
                    end;
                end;
            end
        end;
    end;

    tfds = tfds + wvdhh;
    wvdhh = zeros(mlen,nlen);
end;

surf(abs(tfds));
