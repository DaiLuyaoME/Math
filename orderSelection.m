orderRange = 100;
FPE = @(e,k,N) e * ( N + k + 1) / ( N - k - 1);
AIC = @(e,k,N) N * log(e) + 2 * k;


optimaRes = 1000000;
for k = 1:orderRange
    [~,e(k)] = aryule(x,k);
    temp1(k) = FPE(e(k),k,N);
    temp2(k) = AIC(e(k),k,N);
    
end
[~,index1] = min(temp1);
[~,index2] = min(temp2);
disp('FPE准则阶次：');
disp(index1);
disp('AIC准则阶次: ');
disp(index2);