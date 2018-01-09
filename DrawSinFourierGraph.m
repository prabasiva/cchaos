function DrawSinFourierGraph()
Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 200;                        % Length of signal
t = (0:L-1)*T;                % Time vect
f = [50,150,300];
x1 = sin(2*pi*f(1)*t);          % First row wave
x2 = sin(2*pi*f(2)*t);         % Second row wave
x3 = sin(2*pi*f(3)*t);         % Third row wave

X = [x1; x2; x3;];

figure;

for i = 1:3
    g=subplot(3,2,i+i-1)
    plot(t(1:L),X(i,1:L),'r','LineWidth',1)
    ylabel('sin(2\pift)','FontSize',16,'FontWeight','bold')
    xlabel('\fontname{Helvetica} Time','FontSize',16,'FontWeight','bold')
    title(['A sine wave of frequency f  = ',num2str(f(i)),' in the Time Domain'],'FontSize',18,'FontWeight','bold')
    p=get(g,'position');
    p(1)=.7*p(1);
    p(4)=1.1*p(4);
    set(g,'position',p);
end


n = 2^nextpow2(L);
dim = 2;
Y = fft(X,n,dim);
P2 = abs(Y/n);
P1 = P2(:,1:n/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);


for i=1:3
    g=subplot(3,2,i*2);
    plot(0:(Fs/n):(Fs-Fs/n),P2(i,1:n),'b','LineWidth',1)
    title(['Sin wave of frequency  ',num2str(f(i)), ' in the Frequency Domain'],'FontSize',18,'FontWeight','bold')
    ylabel(' |F(s)|','FontSize',16,'FontWeight','bold')
    xlabel('Freqency','FontSize',16,'FontWeight','bold')
    p=get(g,'position');
    p(1)=.9*p(1);
    p(4)=1.1*p(4);
    set(g,'position',p);
end
