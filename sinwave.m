

close all;
clear all;
Fs = 10;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 400;                        % Length of signal
x = (0:L-1)*T;                % Time vect

dimx=5;dimy=3;wid=1;


for j=0:dimx-1
    
    if j == 0
        in = sin(x);
           else
        in=sin(j*pi*x);
    end;

subplot(dimx,dimy,wid);
plot(x,in);
wid=wid+1;
subplot(dimx,dimy,wid);
plot(x,abs(fft(in)));
    if j == 0
        in = 2*pi*sin(x);
    else
        in=2*pi*sin(j*pi*x);
    end;

wid=wid+1;
subplot(dimx,dimy,wid);
plot(x,abs(fft(in)));
wid=wid+1;
end;