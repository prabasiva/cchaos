function mydft()

 abc=dftmtx(50);
subplot(2,2,1);surf(real(abc));
title('Discrete Fourier Transform - Real Part','FontSize',18,'FontWeight','bold')

 subplot(2,2,2);surf(imag(abc));
 title('Discrete Fourier Transform - Imaginary Part','FontSize',18,'FontWeight','bold')

 
abc=inv(abc);
subplot(2,2,3);surf(real(abc));
title('Inverse Discrete Fourier Transform - Real Part','FontSize',18,'FontWeight','bold')

 subplot(2,2,4);surf(imag(abc));
 title('Inverse Discrete Fourier Transform - Imaginary Part','FontSize',18,'FontWeight','bold')
