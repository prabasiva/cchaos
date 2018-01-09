function myreconsfromgabor()
%Program used to Gabor Coefficients for SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: myreconsfromgabor.m
    
        close all;
        clear all;
            [sp500,syear]=getData(1);
          %  sp500=log(sp500);
            [s2,s1]=hpfilter(sp500,1600);
    

        deltam = 8;
        M=17;
       % M=50;
        deltan=4;
        nn=84;
        %nn=100;
        thrcont=3;

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
            sg2=sg2/(2*pi);
           % plot(real(sg),'LineWidth',3);
           subplot(2,1,2);
            hold on;
            autocorr(s1,100);
            [c1,c2,c3]=autocorr(s1,100);
            hold on;
            p1=plot(c2,c1,'LineWidth',2,'Color','c');
            hold on;
            autocorr(real(sg2),100);
            [d1,d2,d3]=autocorr(real(sg2),100);
            hold on;
            p2=plot(d2,d1,'LineWidth',2,'Color','g');
            legend([p1,p2],'HP Original','HP Filtered');
             title('Original & Filtered HP Cycles');
            stdratio=std(real(sg2),1)/std(s1,1)
            vratio=var(real(sg2),1)/var(s1,1) * 100
            ccgo=corrcoef(real(sg2),s1)
            
            subplot(2,1,1);
            %figure;

            p1=plot(real(sg2),'LineWidth',.5,'DisplayName','Constructued signal');
            hold on;
            p2=plot(s1,'DisplayName','Original Signal');
            legend('show');
            ylabel('S(t)');
            xlabel('Time in year');
            title('log(SP500) original & Filtered HP Cycles');
            
            figure;
            clear all;
            
            [naq,nyear]=getData(2);
            naq=log(naq);
            [s2,s1]=hpfilter(naq,1600);
            deltam = 8;
       % M=16;
        M=50;
        deltan=4;
        %nn=32;
        nn=100;
        thrcont=3;

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
            sg2=sg2/(2*pi);
           % plot(real(sg),'LineWidth',3);
           subplot(2,1,2);
            hold on;
            autocorr(s1,100);
            [c1,c2,c3]=autocorr(s1,100);
            hold on;
            p1=plot(c2,c1,'LineWidth',2,'Color','c');
            hold on;
            autocorr(real(sg2),100);
            [d1,d2,d3]=autocorr(real(sg2),100);
            hold on;
            p2=plot(d2,d1,'LineWidth',2,'Color','g');
            legend([p1,p2],'HP Original','HP Filtered');
            title('Original & Filtered HP Cycles');
            stdratio=std(real(sg2),1)/std(s1,1)
            vratio=var(real(sg2),1)/var(s1,1) * 100
            ccgo=corrcoef(real(sg2),s1)
            
            subplot(2,1,1);
            %figure;

            p1=plot(real(sg2),'LineWidth',.5,'DisplayName','Constructued signal');
            hold on;
            p2=plot(s1,'DisplayName','Original Signal');
            legend('show');
            ylabel('S(t)');
            xlabel('Time in year');
            title('log(NASDAQ) original & Filtered HP Cycles');
end

    
    
    
    
    
        