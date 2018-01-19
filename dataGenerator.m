%% generate white noise
% rng default;
rng(120); % fix random seed so that the result is reproducible
noisePower = 0.12;
% noisePower = 2;
N = 256;
Nfft = 4096;
u1 = sqrt(noisePower) * randn(1,N);
u2 = sqrt(noisePower) *randn(1,N);
plotIndex = -(N-1) : (N-1);
% plot correlation and cross correlation
plotCorrelation(plotIndex,xcorr(u1,u1),'${{r}_{{{u}_{1}}}}\left( n \right)$');
plotCorrelation(plotIndex,xcorr(u2,u2),'${{r}_{{{u}_{2}}}}\left( n \right)$');
plotCorrelation(plotIndex,xcorr(u1,u2),'${{r}_{{{u}_{1}{u}_{2}}}}\left( n \right)$');

%% generate filter
B1 = [ 1 , 1.98 , 0.98];
B2 = [ 1 , -1.98 , 0.98]; 
B3 = [ 1 , -1.8418, 0.98];
B4 = [ 1 , -1.5, 0.98];
B5 = [1, -1.2727, 0.98];
B = conv(conv(conv(conv(B1,B2),B3),B4),B5);
% plot zeros and poles
figure;h=zplane(B,1);set(h,'LineWidth',2);
% plot frequence response
figure;[H,w] = freqz(B,1,Nfft,'whole');plot(w/(2*pi),10*log10(abs(H)),'LineWidth',2);xlabel('Normalized Frequency  (\times2\pi rad/sample)');ylabel('Magnitude (dB)');
%% generate colored noise
v1 = filter(B,1,u1);
v2 = filter(B,1,u2);
v = v1 + 1i * v2;
plotIndex = -(N-1) : (N-1);
plotCorrelation(plotIndex,abs(xcorr(v,v)),'$\left| {{r}_{v}}\left( n \right) \right|$');
%%
a1 = 12;
a2 = 12;
a3 = 6;
f1 = 0.22;
f2 = 0.21;
f3 = 0.12;
n = 0 : (N-1);
phi1 = rand(1,1)*2*pi-pi;
phi2 = rand(1,1)*2*pi-pi;
phi3 = rand(1,1)*2*pi-pi;

x1 = a1 * exp( 1i * (2 * pi * f1 * n + phi1) );
x2 = a2 * exp( 1i * (2 * pi * f2 * n + phi2) );
x3 = a3 * exp( 1i * (2 * pi * f3 * n + phi3) );
y = x1 + x2 + x3;
x = v + y;
%% plot x(n)
plotData(abs(x),'$\left| x\left( n \right) \right|$');
plotData(rad2deg(angle(x)),'$\phi \left( x\left( n \right) \right)$');
%%
% y = fft(x);
% figure;
% plot(abs(y));
%% ture power spectral
[h,w] = freqz(conv(B,flip(B)),1,Nfft,'whole');
mag = abs(h) * 2 * noisePower;
n1 = floor(f1 * Nfft);mag(n1) = mag(n1) + 2 * pi * a1^2;
n2 = floor(f2 * Nfft);mag(n2) = mag(n2) + 2 * pi * a2^2;
n3 = floor(f3 * Nfft);mag(n3) = mag(n3) + 2 * pi * a3^2;
plotIndex = linspace(0,2*pi,Nfft);
figure;plot(plotIndex./(2*pi),10*log10(mag),'LineWidth',2);xlabel('Normalized Frequency  (\times2\pi rad/sample)');ylabel('Magnitude (dB)');


