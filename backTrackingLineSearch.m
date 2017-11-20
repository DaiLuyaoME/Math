function [objFunValue,xNew,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,grad,alpha,beta,maxIter)
%% function description
% objFun: handle to objective function
% grad: current gradient
% xk: the current optimal solution


minArgs=4;  
maxArgs=7;
narginchk(minArgs,maxArgs);

if nargin == 4 
    alpha = 0.1;
    beta = 0.7;
    maxIter = 100;
end
if nargin == 5
    beta = 0.7;
    maxIter = 100;
end
if nargin == 6
    maxIter = 100; % the default max iteration number is 100
end

t = 1;
flag = 0;
currentObjValue = objFun(xk);
descentValue =  dot(grad,descentDirection); % this value should be negative

for i = 1:maxIter
    xNew = xk + t * descentDirection;
    objFunValue = objFun(xNew);
    if ( objFunValue <= ( currentObjValue + alpha * t * descentValue) )
        flag = 1;
        iterNum = i;
        break;
    else
        t = t * beta;
    end
end

end