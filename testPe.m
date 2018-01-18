M = 73;
corX = xcorr(x,x,M,'biased');
% corX = xcorr(x,x,M);
figure;
stem(corX);
% shiftedCorX = [corX( M+1 : end),corX(1:M)];
% figure;
% stem(shiftedCorX);
%%
tempN = 4096;
% Y = fft(shiftedCorX,tempN);
Y = fft(corX,tempN);
figure;
plot((0:tempN-1)/tempN,10*log10(abs(Y)));