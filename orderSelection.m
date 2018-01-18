orderRange = 100;
FPE = @(e,k,N) e * ( N + k + 1) / ( N - k - 1);
AIC = @(e,k,N) N * log(e) + 2 * k;


optimaRes = 1000000;
for k = 1:orderRange
    [~,e(k)] = aryule(x,k);
    temp(k) = FPE(e(k),k,N);
%     temp(k) = AIC(e(k),k,N);
end
[~,index] = min(temp);
%%
[~,e,rc] = aryule(x,100);
N = 256;
for i = 1:100
    temp(i) = FPE(rc(i),i,N);
end
[~,index] = min(temp);
%%
[~,e,rc] = aryule(x,100);
N = 256;
for i = 1:100
    temp(i) = AIC(rc(i),i,N);
end
[~,index] = min(temp);

    