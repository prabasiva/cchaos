function AutoCorrLen()
s= struct('dsource','method','mu','sig','to','pdc');
j=0;
for i = 1:2
[a,b]=getData(i);
[t,c]=hpfilter(a,14400);
if i==1
    s(i+j).dsource='SP500'
else
    s(i+j).dsource='NASDAQ'
end;
s(i+j).method='HP Cycles';
[s(i+j).mu,s(i+j).sig,s(i+j).to]=deTrendStat(c);
s(i+j).pdc=4*s(i+j).to/12;
j=j+1;
if i==1
    s(i+j).dsource='SP500'
else
    s(i+j).dsource='NASDAQ'
end;
s(i+j).method='First Difference';
len=size(a);
len=len(1);
df1=a(2:len);
df2=a(1:len-1);
diff=df1-df2;
[s(i+j).mu,s(i+j).sig,s(i+j).to]=deTrendStat(diff);
s(i+j).pdc=4*s(i+j).to/12;
j=j+1;
if i==1
    s(i+j).dsource='SP500'
else
    s(i+j).dsource='NASDAQ'
end;
xaxis=size(b);
xaxis=1:xaxis;
xaxis=xaxis';
tbl=table(xaxis,a,'VariableNames',{'year','index'});
lm=fitlm(tbl,'index~year');
slopiner=lm.Coefficients.Estimate;
lltrend=slopiner(1)+slopiner(2)*xaxis;
llcycle=a-lltrend;
[s(i+j).mu,s(i+j).sig,s(i+j).to]=deTrendStat(llcycle);
s(i+j).pdc=4*s(i+j).to/12;
s(i+j).method='Log Linear';

end


for i=1:6
s(i)
end


function [mu,sig,corrlen]=deTrendStat(c)

[y,lag]=autocorr(c,100);
pos=find(y>0 == 0.0000000,1,'first');
y1=y(pos-1);
y2=y(pos);
x1=lag(pos-1);
x2=lag(pos);
m=(y2-y1)/(x2-x1);
b1=y1-m*x1;
corrlen=-1*b1/m;
mu=mean(y);
sig=var(y);



