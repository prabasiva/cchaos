    function myfiltgabor()
%Program used to Gabor Coefficients for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: myfiltgabor.m
close all;
clear all;
[sp500,syear]=getData(1);
[naq,nyear]=getData(2);
    deltam = 8;
    M=16;
   M=50;
    deltan=4;
    nn=32;
    nn=100;
    thrcont=3;
 %   [s2,s1]=hpfilter(sp500,1600);
    [s2,s1]=hpfilter(sp500,14400);
 
 s1=s1';
    L=length(s1);
    t=1:L; 
    N=L/2;
    nn2=nn/2;
    sigma=sqrt((deltam*L)/(deltan * 2 * pi));
    c=nthroot(pi*sigma*sigma,-4);
    h0 = @(b) c*exp(-((b.*b)/(2*sigma*sigma)));
    h = @(ii) h0( mod(ii + N, L)-N);
    for m = 1:M
        for n = 1:nn2
            c1(m, n)= sum(s1.*h(mod(t - m*deltam,L)).*exp(-2*pi*i*deltan*n*t/L));
        end

    end
    %[s2,s1]=hpfilter(naq,1600);
    
    [s2,s1]=hpfilter(naq,14400);
    s1=s1';
    L=length(s1);
    t=1:L; 
    N=L/2;
    nn2=nn/2;
    sigma=sqrt((deltam*L)/(deltan * 2 * pi));
    c=nthroot(pi*sigma*sigma,-4);
    h1 = @(b) c*exp(-((b.*b)/(2*sigma*sigma)));
    h2 = @(ii) h1( mod(ii + N, L)-N);
    for m = 1:M
        for n = 1:nn2
            c2(m, n)= sum(s1.*h2(mod(t - m*deltam,L)).*exp(-2*pi*i*deltan*n*t/L));
        end
    end
    
[m,n]=size(c1);
thr=max(abs(c1));
spmask = (max(thr)-min(thr))/thrcont;
for k = 1:m
    for j = 1:n
        if abs(c1(k,j)) < spmask
            sp500maskmatrix(k,j)=0;
        else
            sp500maskmatrix(k,j)=1;
        end;
    end;
end;

%DRAW THRESHOLD PRESENTATION & MASK OPERATOR
figure;
subplot(2,2,1);    
plot(abs(c1),'LineWidth',2);
xlabel('m');
ylabel('|C(m,n)|');
title('Time Section of Gabor Distribution for SP500','FontSize',16,...
    'FontWeight','bold')
    h=get(gca,'ylabel');
hold on;
li(1:m)=spmask;
p1=plot(li,'LineWidth',6,'Color','b');
legend(p1,'Threshold');

[m,n]=size(c2);
thr(1:m)=max(abs(c2(1:m,:)));

nasmask = (max(thr)-min(thr))/thrcont;
for k = 1:m
    for j = 1:n
        if abs(c2(k,j)) < nasmask
            nasmaskmatrix(k,j)=0;
        else
            nasmaskmatrix(k,j)=1;
        end;
    end;
end;    
subplot(2,2,2);
plot(abs(c2),'LineWidth',2);
xlabel('m');
ylabel('|C(m,n)|');
title('Time Section of Gabor Distribution for NASDAQ','FontSize',16,...
    'FontWeight','bold');
hold on;
li(1:m)=nasmask;
p1=plot(li,'LineWidth',6,'Color','b');
legend(p1,'Threshold');
c1=c1.*sp500maskmatrix;
c2=c2.*nasmaskmatrix;

subplot(2,2,3);    
plot(abs(c1),'LineWidth',2);
xlabel('m');
ylabel('|C(m,n)|');
title('Time Section of Masked Gabor Distribution for SP500',...
    'FontSize',16,'FontWeight','bold');
hold on;
li(1:m)=spmask;
p1=plot(li,'LineWidth',6,'Color','b');
legend(p1,'Threshold');

subplot(2,2,4);
plot(abs(c2),'LineWidth',2);
xlabel('m');
ylabel('|C(m,n)|');
title('Time Section of Masked Gabor Distribution for NASDAQ',....
    'FontSize',16,'FontWeight','bold');
hold on;
li(1:m)=nasmask;
p1=plot(li,'LineWidth',6,'Color','b');
legend(p1,'Threshold');

figure;

    subplot(1,2,1)
    surf(abs(c1));
    colormap hsv;
    %Change the text location based on the m & n. 
    %For m=n=16, text(-5,0.4...
    %For m=n=50  text
    if M==16
        text(-5, 0.4, 'Fig a: Filtered Gabor Coefficient for log(sp500)','FontSize',16,'FontWeight','bold','Color','r')
    else
        text(-15, 0.4, 'Fig a: Filtered Gabor Coefficient for log(sp500)','FontSize',16,'FontWeight','bold','Color','r')
    end;   
    ylabel('Sampling Points - M','FontSize',12,'FontWeight','bold','Color','b')
    h=get(gca,'xlabel');
    set(h,'rotation',30)
    xlabel('Sampling Points - N','FontSize',12,'FontWeight','bold','Color','b')
    h=get(gca,'ylabel');
    set(h,'Position',get(h,'Position') +[2 4 0])
    set(h,'rotation',140)
    zlabel('|C(m,n|^2','FontSize',12,'FontWeight','bold','Color','b')
    
    subplot(1,2,2);
    surf(abs(c2));
    colormap hsv;
    if M==16
        text(-5, 0.4, 'Fig a: Filtered Gabor Coefficient for log(nasdaq)','FontSize',16,'FontWeight','bold','Color','r')
    else
        text(-15, 0.4, 'Fig a: Filtered Gabor Coefficient for log(nasdaq)','FontSize',16,'FontWeight','bold','Color','r')
    end;
    ylabel('Sampling Points - M','FontSize',12,'FontWeight','bold','Color','b')
    h=get(gca,'xlabel');
    set(h,'rotation',30)
    xlabel('Sampling Points - N','FontSize',12,'FontWeight','bold','Color','b')
    h=get(gca,'ylabel');
    set(h,'Position',get(h,'Position') +[2 4 0])
    set(h,'rotation',140)
    zlabel('|C(m,n|^2','FontSize',12,'FontWeight','bold','Color','b')
    
end

