
classdef Gabor1dKernel
   
  properties(GetAccess = 'public', SetAccess = 'private')
      KernelValues     
      x
      amp
      real
      imag
  end
    
  methods      

        function this = Gabor1dKernel(length, sigma, freq)
            xmin=ceil(length/2);
            xmax=xmin;
            xmin=-xmin;
            x=xmin:xmax;
            omega=2*pi*freq;
            this.x=x;
            this.KernelValues=1/(sqrt(2*pi)*sigma)*exp(-x.^2/(2*sigma^2)).*exp(i*omega*x);
            this.amp = sqrt( real(this.KernelValues).^2 + imag(this.KernelValues).^2 );
            this.real = real(this.KernelValues);
            this.imag = imag(this.KernelValues);
            end
  end
  
end