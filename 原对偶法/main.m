%%
clear;
load('A.mat');
load('b.mat');
load('lambda.mat');
load('mu.mat');
load('P.mat');
load('q.mat');
load('x_0.mat');


% [n,m] = size(A);
maxIter = 300;
objFun = @(x)0.5 * x'*P*x + q'*x;
objPhi = @(x)-1*sum(log(x));
gradFun = @(x)P*x + q;
gradPhi = @(x)-1 * 1./x;
hessianFun = @(x)P;
hessianPhi = @(x)diag(1./x.^2);

hessianBar = @(x,t)t * hessianFun(x) + hessianPhi(x);
gradBar = @(x,t) t*gradFun(x) + gradPhi(x);
objBar = @(x,t) t*objFun(x) + objPhi(x);




xList = [];
gradList = [];
tList = [];                 
vList = [];
objValueList = [];

etaList = [];
resNormList = [];



xk = x_0;
TOL = 1e-10;
[m,n] = size(A);

t = 1;

for i = 1:maxIter
    revisedKKTMatrix = [P,-1 * eye(n),A'; diag(lambda),diag(xk),zeros(n,m);A,zeros(m,n),zeros(m)];
    resDual = q + P*xk - lambda + A'*mu; resCentral = diag(lambda)*xk - 1/t * ones(n,1); resPrimal = A*xk - b;
    % resvector = [q + P*xk - lambda + A'*mu; diag(lambda)*x - 1/t * ones(n,1); A*x - b];
    etaEs = lambda' * xk;
    if( abs(etaEs) < TOL && norm(resDual) < TOL && norm(resPrimal) < TOL)
        break;
    end
    etaList = [etaList,etaEs]; resNormList = [resNormList,norm([norm(resDual),norm(resPrimal)])]; 
    resvector = [resDual;resCentral;resPrimal];
    delta = linsolve(revisedKKTMatrix,-1 * resvector);
    deltaX = delta(1:n); deltaLambda = delta((n+1):(2*n)); deltaMu = delta((2*n+1):end);
    indexX = deltaX < 0 & xk > 0;
    temp1 = min(abs(xk(indexX)./deltaX(indexX)));
    indexLambda = deltaLambda < 0 & lambda > 0;
    temp2 = min(abs(lambda(indexLambda)./deltaLambda(indexLambda)));
    searchT = 0.99 * min([temp1,temp2]);
    searchT = min(searchT,1);
    xk = xk + searchT * deltaX;
    lambda = lambda + searchT * deltaLambda;
    mu = mu + searchT * deltaMu;
    t = abs(10 * m / (lambda' * xk));
end

disp('the iteration number is ');
disp(i);
%%
optimalX = xk;
optimalP = objFun(xk);
optimalLambda = lambda;
optimalMu = mu;
%%
semiplotData(resNormList,'iteration number','$\log \left\{ {{\left( \left\| {{r}_{pri}} \right\|_{2}^{2}+\left\| {{r}_{dual}} \right\|_{2}^{2} \right)}^{1/2}} \right\}$');
%%
semiplotData(etaList,'iteration number','$\log \left( {\hat{\eta }} \right)$');










