orderRange = 100;
FPE = @(e,k,N) e * ( N + k + 1) / ( N - k - 1);
AIC = @(e,k,N) N * log(e) + 2 * k;


optimaRes = 1000000;
for k = 1:orderRange
    [~,e(k)] = aryule(x,k);
%     temp(k) = FPE(e(k),k,N);
    temp(k) = AIC(e(k),k,N);
end
[~,index] = min(temp)