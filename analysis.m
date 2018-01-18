figure;
[h,w] = freqz(conv(B,fliplr(B)));
%%
figure;
freqz(B,1);
%%
n = numel(B);
