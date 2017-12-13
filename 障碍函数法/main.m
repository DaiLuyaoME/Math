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
maxIter = 30;
objFun = @(x)0.5 * x'*P*x + q'*x;
objPhi = @(x)-1*sum(log(x));
gradFun = @(x)P*x + q;
gradPhi = @(x)-1 * 1./x;
hessianFun = @(x)P;
hessianPhi = @(x)diag(1./x.^2);

hessianBar = @(x,t)t * P + hessianPhi(x);
gradBar = @(x,t) t*gradFun(x) + gradPhi(x);
objBar = @(x,t) t*objFun(x) + objPhi(x);




xList = [];
gradList = [];
tList = [];
vList = [];
objValueList = [];
xk = x_0;
miu = 80;
TOL = 1e-10;
[m,n] = size(A);

%% phase one, find feasible initial point
vk =  zeros(m,1);
tempt = 1;
alpha = 0.05;
beta = 0.5;
for j = 1:maxIter
    tempGrad = gradBar(xk,tempt);
    [deltaX,deltaV] = solveKKTMatrix(hessianBar(xk,tempt),A,gradBar(xk,tempt)+A'*vk,A*xk-b);
    r = [gradBar(xk,tempt)+A'*vk;A*xk-b];
    if( norm(r) < TOL)
        break;
    end
    t = 1;
    while(min(xk+t*deltaX) <= 1e-4)
        t = t * beta;
    end
    
    while ( norm( [ gradBar(xk+t*deltaX,tempt) + A'*(vk + t * deltaV);A*(xk+t*deltaX)-b] ) > (1 - alpha * t) * norm(r) )
        t = t * beta;
    end
    xk = xk + t*deltaX;
    vk = vk + t*deltaV;
end


%%
warning('off');
t = 1;

objValueList = [];
for j = 1:maxIter
% for j = 1:3
    tempObj = @(x)objBar(x,t);
    for k = 1:maxIter
        %         [descentDirection,v] = solveKKTMatrix(hessianBar(xk,t),A,gradBar(xk,t),0);
        delta = linsolve([hessianBar(xk,t),A';A,zeros(m)],-1 * [gradBar(xk,t);zeros(m,1)]);
        %         delta = minres([hessianBar(xk,t),A';A,zeros(m)],-1 * [gradBar(xk,t);zeros(m,1)],1e-6,100);
        descentDirection = delta(1:n);
        V = delta( (n+1) : end );
        [objValue,xk,stept,iterNum,flag] = backTrackingLineSearch(tempObj,xk,descentDirection,gradBar(xk,t));
        xList = [xList,xk];
        tList = [tList,stept];
        %         vList = [vList,v];
        objValueList = [objValueList,objFun(xk)];
        tempRes = dot(gradBar(xk,t),descentDirection);
        %         if(0.5 * abs(dot(gradBar(xk,t),descentDirection)) < TOL)
        %             break;
        %         end
        if(norm(gradBar(xk,t)) < 1e-6)
            break;
        end
    end
    iterationList(j) = k;
    dualIntervalList(j) = m/t;
%     if( m / t < TOL)
    if( m / t < TOL)
        break;
    end
    t = t * miu;
end
% xList = xList(1:j);
% gradList = gradList(1:j);
% objValueList = objValueList(1:j);
% tList = tList(1:j);

disp('the iteration number is ');
disp(j);
%%
optimalX = xk;
optimalP = objFun(xk);
optimalLambda = 1./(t*xk);
optimalMu = linsolve(A',-1*(P*xk+q-optimalLambda));

%%
plotData(objValueList,'iteration number','${{f}_{0}}\left( {{x}_{k}} \right)$');
%%
data = [];
for i = 1:numel(dualIntervalList)
    data = [data;ones(iterationList(i),1) * dualIntervalList(i)];
end
% figure;
% h = semilogy(data);
semiplotData(data,'iteration number','$\frac{m}{t}$');








