
function g1d_demo()

clear all;
close all;

for data = 1:2

[index,year]=getData(data);
figure;
for i = 1:5
    
subplot(5,2,i*2-1);
    gld=Gabor1dKernel(200,i,0);
    plot(gld.real);
    subplot(5,2,i*2);
    %plot(real(gld.KernelValues))
    plot(gld.imag);
end
end
end
