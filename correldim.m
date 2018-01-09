

function correldim()
close all;
clear all;
[index,year]=getData(2);
[trend,cycles]=hpfilter(index,14400);

X=cycles;

%function [obj] =cdim(x)
N = numel(X);
%for m = 1:20:300
arrayDist = zeros(N, N);
for i = 1:N
    x1 = X(i);
    for j = 1:N
        x2 = X(j);
        arrayDist(i,j) = abs(x1-x2);
    end
end
Nr = 20;
r = linspace(0.0005, 0.015, Nr);
for k = 1:numel(r);
    countk = find(arrayDist >= r(k));
    cr(k) = numel(countk);
end
logr = log10(r);
logcd = log10(cr);
logcd/logr
hold on
plot(logr, logcd)
[dimc, se]= polyfit(logr, logcd, 1);
f = polyval(dimc,logr);
%plot(logr, f)
hold off
xlabel('log\epsilon');
ylabel('logC(\epsilon)');obj.cd = dimc(1);
box on
%end;

