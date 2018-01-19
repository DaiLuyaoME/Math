function Y = pcorrelation( x,M,nfft )

corX = xcorr(x,x,M,'biased');
Y = abs(fft(corX,nfft));


end

