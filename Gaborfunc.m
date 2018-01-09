function Gaborfunc()
figure;
[sp500,syear]=getData(1);
[naq,nyear]=getData(2);
[s2,s1]=hpfilter(sp500,14400);
[sgabor,glen]=dgt(s1,'gauss',10,20);

title('Gabor Transform of SP 500','FontSize',16,'FontWeight','bold')
xlabel('n','FontSize',16,'FontWeight','bold')
ylabel('|C(m,n)|','FontSize',16,'FontWeight','bold')
mesh(abs(sgabor));
figure;
[ngabor,glen]=dgt(naq,gausswin(50),10,20);
[xa,ya]=size(ngabor);
set(gca,'XTickLabel',{0:2:xa}, 'FontSize',15,'FontWeight','bold')
set(gca,'YTickLabel',{0:2:xa}, 'FontSize',15,'FontWeight','bold')
title('Gabor Transform of NASDAQ','FontSize',24,'FontWeight','bold')
xlabel('n','FontSize',20,'FontWeight','bold')
ylabel('|C(m,n)|','FontSize',20,'FontWeight','bold')
mesh(abs(ngabor));
figureHandle = gcf;
%# make all text in the figure to size 14 and bold
set(findall(figureHandle,'type','text'),'fontSize',14,'fontWeight','bold')

end

