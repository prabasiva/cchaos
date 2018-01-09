function drawCorrDim()
%Program used to Correlation Dimension for both SP500 & NASDAQ
% Praba Siva
% praba@umich.edu
% @prabasiva
% Filename: drawCorrDim.m

close all;
clear all;
titlestr={' for SP500',' for NASDAQ'};
for i = 1:2
    [index,year]=getData(i);
    [trend,cycles]=hpfilter(index,14400);
    N=size(cycles);
    N=N(1);
    figure;
    for delay = 2:2:8
        subplot(2,2,delay/2);
        for ed = 2:2:30
            [r,c] = c2(cycles,ed,delay,400,500);
            plot(r,c,'LineWidth',2);
            set(gca,'fontsize',14,'fontweight','bold');
            
            %xlabel('$\log_{10}(\epsilon)$','Interpreter','Latex','FontSize',14,'FontWeight','bold')
            %ylabel('$\log_{10} C(\epsilon)$','Interpreter','Latex','FontSize',14,'FontWeight','bold')
            xlabel('log10(\epsilon)','FontSize',18,'FontWeight','bold')
            ylabel('log10 C(\epsilon)','FontSize',18,'FontWeight','bold')
            
            if i==1
                 title({['Correlation sum for SP500 indexes with embedding dimensions = 2,4,..30']
                     ;['and delay = ',num2str(delay)]},'fontsize',16);
            else
                title({['Correlation sum for NASDAQ indexes with embedding dimensions = 2,4,..30'] 
                    ;['and delay = ',num2str(delay)]},'fontsize',16);

            end
            textlegmain(ed/2)={['m = ',num2str(ed)]};
            edmat(delay/2,ed/2)=abs(c/r);
            hold on;
        end;
        hold on;
        legend(textlegmain,'Location','northwest','FontSize',8,'FontWeight','bold');
        legend('show');
        hold on;
    end;
    figure;
for delay = 2:2:8
    plot(2:2:30,edmat(delay/2,:),'LineWidth',3);
    set(gca,'fontsize',14,'fontweight','bold');
    xlabel('Embedding dimension','FontSize',18,'FontWeight','bold');
    ylabel('Correlation Dimension','FontSize',18,'FontWeight','bold');
    if i==1
        title('SP 500 Index','FontSize',24,'FontWeight','bold');
    else
        title('NASDAQ index','FontSize',24,'FontWeight','bold');
    end
    textleg(delay/2)={['Delay = ',num2str(delay)]};
    mean(edmat(delay/2,:));
    hold on;
    end;
    cdim= mean(mean(edmat));
    ldata(1:15)=cdim;
    plot(2:2:30,ldata,'--','LineWidth',3);
    hold on;
    legend(textleg,'Location','northwest','FontSize',10,'FontWeight','bold');
    legend('show');
    hold on;
end;