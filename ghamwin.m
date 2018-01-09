function ghamwin()
s={'Gaussian Window' 'Hamming Window'};
wlen=25;
figure;
for fla=0:1
    if fla<1
    % form a periodic hamming window
        win = hamming(wlen, 'periodic');
    else
        win=gausswin(wlen)
    end
    g=subplot(1,2,1+fla);
    plot(abs(win),'r','LineWidth',1);
    xlabel('n (N=25)','FontSize',16,'FontWeight','bold')
    if fla ==0
        title('\sigma = 2.5 Gaussian Window function','interpreter','Tex','Fontsize',16,'FontWeight','bold')
       ylabel('e^{-n^2/2\sigma^2}','interpreter','Tex','FontSize',20)
    else
        title([s(fla+1),'function'],'FontSize',16,'FontWeight','bold')
        ylabel('0.54-0.46cos(2\pi*n/N)','interpreter','Tex','FontSize',20)
    end
end
