close all;
clear all;
dat=csvread('/Users/sivasp1/Documents/2016/Personal/Praba/MATH599/program/nasdaq_mat.csv');
year=dat(:,1);
month=dat(:,2);


%L=128;
L=length(dat);
t=1:L;
N=L/2;
s1=cos(t)+cos(2*t);
%s2(1:32)=cos(1:32);
%s2(33:64)=cos((33:64)*2);
%s2(65:128)=cos(65:128);

s2=dat;

for n = 1:N
   % b1(n)= sum(s1.*exp(-2*pi*i*n*t/L));
   % b2(n)= sum(s2.*exp(-2*pi*i*n*t/L));
end

%plot(s1);
%figure;
%plot(s2);


deltam= 8;
M=16;
deltan = 4;
nn = 32;
nn2 = nn/2;
nr = deltam * L;
dr = deltan * 2 * pi;

sig = sqrt(nr/dr);
it=-64:63;
coef=(pi * sig * sig)^.25;
h0 = @(ii) coef*exp(-(ii.*ii)/(2*sig*sig));
h = @(ii) h0( mod(ii + N, L) - N);
for m = 1:M
    for n = 1:nn2
    c1(m, n)= sum(s1.*h(mod(t - n*deltam,L)).*exp(-2*pi*i*deltan*n*t/L));
   % c2(m, n)= sum(s2.*h(mod(t - n*deltam,L)).*exp(-2*pi*i*deltan*n*t/L));
    end
end
figure;
plot(t,s1);
figure;
plot(t,s2);
figure;
mesh(abs(c1))
%figure;
%mesh(abs(c2))
