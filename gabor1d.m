
classdef Gabor1dKernel
   
  properties(GetAccess = 'public', SetAccess = 'private')
      KernelValues     
  end
    
  methods      

        function this = Gabor1dKernel(length, sigma, freq)
            xmin=ceil(length/2);
            xmax=xmin;
            xmin=-xmin;
            x=xmin:xmax;
            omega=2*pi*freq;
            this.KernelValues = 1/(sqrt(2*pi)*sigma*exp(-x.^2/(2*sigma^2)).*exp(i*omega*x);
          end
  end
end;