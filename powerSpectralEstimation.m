tempN = 4096;
[pxx,w] = periodogram(x,[],tempN);
figure;
plot(w/(2*pi),10*log10(pxx));
%%
window = 64;
noverlap = 32;
figure;
pwelch(x,window,noverlap);
figure;
pwelch(x,window,noverlap,tempN)

%%
M = 63;
corX = xcorr(x,x,M,'biased');
figure;
stem(corX);
shiftedCorX = [corX( M+1 : end),corX(1:M)];
figure;
stem(shiftedCorX);
    
%% AR-correlation method
order = 15;
figure;
pcov(x,order,tempN);
%% AR-berg method
figure;
pburg(x,order,tempN);
%% AR-yulear method
figure;
pyulear(x,15,tempN);


% pcov(x);

% pberg(x);

% pyulear(x);

% pcov

