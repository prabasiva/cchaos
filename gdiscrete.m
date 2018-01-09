close all;
clear all;
L=128;
t=1:L; 
N=L/2;
s1=cos(t)+cos(2*t);
s2(1:32)=cos(1:32);
s2(33:64)=cos((33:64)*2);
s2(65:128)=cos(65:128);

for n = 1:N
    b1(n)= sum(s1.*exp(-2*pi*i*n*t/L));
    b2(n)= sum(s2.*exp(-2*pi*i*n*t/L));
end
    
%plot(s1);
%figure;
%plot(s2);


deltam= 8;
M=16;
deltan = 4;
nn = 32;
nr = deltam * L;
dr = deltan * 2 * pi;

sig = sqrt(nr/dr);
it=-64:63;
coef=(pi * sig * sig)^.25;
h0=coef*exp(-(it.*it)/(2*sig*sig));
figure;
plot(t,s1);
figure;
plot(t,s2);
figure;
plot(it,h0);

for z = L:1:-1
    ind= mod(z+L/2,L)+1;
    h(z)=h0(ind);
end;
hold on;
plot(h);

ind=mod(it+L/2,L);
for k = 1 : length(ind)
    h(k) = h0(ind(k))
end;
plot(h);
dat = -400:399;

x = -16*pi : 0.1 : 16 * pi;
for k = 1 : length(x)
	if x(k) < -pi
		y(k) = cos(x(k)/(2*pi));
	elseif x(k) >= -pi && x(k) <  pi
		y(k) = cos(x(k)/pi);
	else
	y(k) = cos(x(k)/(2*pi));
	end
end
plot(x, y);
grid on;
