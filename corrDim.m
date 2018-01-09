function corrDim()
[index,year]=getData(1);
[trend,cycles]=hpfilter(index,14400);
N=size(cycles);
N=N(1);
Nr = 10;
r = linspace(0.005, 0.001, Nr);
for m = 1:50:200
    cn(1:numel(r))=zeros;
    for k = 1:numel(r);
        for j = 1:N
            for i = j+1:N-m
              if (j~=i)
                hside=r(k)-abs(cycles(i)-cycles(j));
                cn(k)=cn(k)+heaviside(hside);
              end
             end
        end
    end;
    plot(log(r),log(cn));
    [dimc, se]= polyfit(log10(r), log10(cn), 1)
    f = polyval(dimc,log10(r));
    plot(log10(r),f);
    hold on
end;