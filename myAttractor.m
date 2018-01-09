%Program used to Gabor Coefficients for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: myAttractor.m
    
        close all;
        clear all;
            [sp500,syear]=getData(1);
           % sp500=log(sp500);
            [s2,s1]=hpfilter(sp500,1600);
    

        deltam = 12;
        M=17;
        %M=50;
        deltan=4;
        nn=84;
        %nn=100;
        thrcont=1;
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
        [m,n]=size(c1);
        H=0.5;
        %thr=max(abs(c1));
        %spmask = (max(thr)-min(thr))/thrcont;
        spmask=mean(c1)+H*std(c1);
        for k = 1:m
            for j = 1:n
           if abs(c1(k,j)) < abs(spmask(k))
         %      if abs(c1(k,j)) < spmask
                   
                sp500maskmatrix(k,j)=0;
                else
                    sp500maskmatrix(k,j)=1;
                end;
            end;
        end;

            for t = 1:L
            temp=0;
                for m = 1:M
                    for n = 1:nn2
                        temp= temp+c1(m,n).*h(mod(t - m*deltam,L)).*exp(2*pi*i*deltan*n*t/L);
                    end
                end
                sg(t)=temp;

            end;
        sg=sg/(2*pi);
        c1=c1.*sp500maskmatrix;
        for t = 1:L
            temp=0;
                for m = 1:M
                    for n = 1:nn2
                        temp= temp+c1(m,n).*h(mod(t - m*deltam,M)).*exp(2*pi*i*deltan*n*t/L);
                    end
                end
                sg2(t)=temp;
         end;
            delta=60;
           % subplot(2,1,1);
            
           % x=real(s1(1:length(s1)-delta));
           % y=real(s1(delta+1:length(s1)));
           % plot(x,y);
           % subplot(2,1,2);
            figure;
            x=real(sg2(1:length(sg2)-delta));
            y=real(sg2(delta+1:length(sg2)));
            plot(x,y,'LineWidth',.7,'Color','r');
            xlabel('x(t)','FontSize',12,'FontWeight','bold','Color','b')
            ylabel('x(t+T)','FontSize',12,'FontWeight','bold','Color','b');     
            title('SP500 Filtered HP cycles','FontSize',12,'FontWeight','bold','Color','b');
            
            
            sum(sum(sp500maskmatrix))
            m*n
            
            
            clear all;
            [nas,syear]=getData(2);
            nas=log(nas);
            [s2,s1]=hpfilter(nas,1600);
    

        deltam = 8;
        M=16;
       % M=50;
        deltan=4;
        nn=32;
        %nn=100;
        thrcont=1;
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
        [m,n]=size(c1);
        H=0.5;
        %thr=max(abs(c1));
        %spmask = (max(thr)-min(thr))/thrcont;
        spmask=mean(c1)+H*std(c1);
        for k = 1:m
            for j = 1:n
           if abs(c1(k,j)) < abs(spmask(k))
         %      if abs(c1(k,j)) < spmask
                   
                sp500maskmatrix(k,j)=0;
                else
                    sp500maskmatrix(k,j)=1;
                end;
            end;
        end;

            for t = 1:L
            temp=0;
                for m = 1:M
                    for n = 1:nn2
                        temp= temp+c1(m,n).*h(mod(t - m*deltam,L)).*exp(2*pi*i*deltan*n*t/L);
                    end
                end
                sg(t)=temp;

            end;
        sg=sg/(2*pi);
        c1=c1.*sp500maskmatrix;
        for t = 1:L
            temp=0;
                for m = 1:M
                    for n = 1:nn2
                        temp= temp+c1(m,n).*h(mod(t - m*deltam,M)).*exp(2*pi*i*deltan*n*t/L);
                    end
                end
                sg2(t)=temp;
         end;
            delta=60;
            figure;
            x=real(sg2(1:length(sg2)-delta));
            y=real(sg2(delta+1:length(sg2)));
            plot(x,y,'LineWidth',.7,'Color','b');
            xlabel('x(t)','FontSize',12,'FontWeight','bold','Color','r')
            ylabel('x(t+T)','FontSize',12,'FontWeight','bold','Color','r');     
            title('NASDAQ Filtered HP cycles','FontSize',12,'FontWeight','bold','Color','r');
            
            sum(sum(sp500maskmatrix))
            m*n