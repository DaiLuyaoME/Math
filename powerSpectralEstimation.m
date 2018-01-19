%% peridogram method
Nfft = 4096;
% Nfft = 256;
[pxx,w] = periodogram(x,[],Nfft);
% plot(w/(2*pi),10*log10(pxx));
plotSpectral(w/(2*pi),10*log10(pxx),'����ͼ��');
%% Welch method
Nfft = 4096;
window = 128;
noverlap = window * 0.5;
[pxx,w] = pwelch(x,window,noverlap,Nfft)
plotSpectral(w/(2*pi),10*log10(pxx),'Welch��');
%% correlation method
M = 63;
Nfft = 4096;
pxx = pcorrelation(x,M,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'��غ�����');
%% AR-yule-walker method
Nfft = 4096;
order = 30;
[pxx,w] = pyulear(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(Yule-Walker����)');
%% AR-berg method
Nfft = 4096;
order = 15;
[pxx,w] = pburg(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(burg��)');
%% AR-covarience method
Nfft = 4096;
order = 17;
[pxx,w] = pcov(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(Э���)');
%% AR-modified covarience method
Nfft = 4096;
order = 17;
[pxx,w] = pmcov(x,order,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'AR(����Э���)');
%% AR-mem method
% figure;
% pmem(x,30,Nfft);
%% subspace method: pisarenko 
Nfft = 4096;
[pxx,w] = peig(x,15,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'Pisarenkoг���ֽ�');
%% subspace method: MUSIC
Nfft = 4096;
[pxx,w] = pmusic(x,15,Nfft);
plotSpectral(w/(2*pi),10*log10(pxx),'MUSIC����');

