%% peridogram method
Nfft = 4096;
% Nfft = 256;
[pxx,w] = periodogram(x,[],Nfft);
% plot(w/(2*pi),10*log10(pxx));
plotSpectral(w/(2*pi),10*log10(pxx),'周期图法');
%% Welch method
Nfft = 4096;
window = 128;
noverlap = window * 0.5;
[pxx,w] = pwelch(x,window,noverlap,Nfft)
plotSpectral(w/(2*pi),10*log10(pxx),'Welch法');
%% correlation method
M = 63;
Nfft = 4096;
pxx = pcorrelation(x,M,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'相关函数法');
%% AR-yule-walker method
Nfft = 4096;
order = 30;
[pxx,w] = pyulear(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(Yule-Walker方法)');
%% AR-berg method
Nfft = 4096;
order = 15;
[pxx,w] = pburg(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(burg法)');
%% AR-covarience method
Nfft = 4096;
order = 17;
[pxx,w] = pcov(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(协方差法)');
%% AR-modified covarience method
Nfft = 4096;
order = 17;
[pxx,w] = pmcov(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(修正协方差法)');
%% AR-mem method
% figure;
% pmem(x,30,Nfft);
%% subspace method: pisarenko 
Nfft = 4096;
[pxx,w] = peig(x,15,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'Pisarenko谐波分解');
%% subspace method: MUSIC
Nfft = 4096;
[pxx,w] = pmusic(x,15,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'MUSIC方法');

