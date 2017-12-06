function [objFunValue,xNew,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,grad)
%% function description
% objFun: handle to objective function
% grad: current gradient
% xk: the current optimal solution



% alpha = 0.1;
% beta = 0.7;
% maxIter = 3000;

alpha = 0.05;
beta = 0.5;
maxIter = 3000;


t = 1;
flag = 0;
currentObjValue = objFun(xk);
descentValue =  dot(grad,descentDirection); % this value should be negative

for i = 1:maxIter
    xNew = xk + t * descentDirection;
    objFunValue = objFun(xNew);
    iterNum = i;
    if ( objFunValue <= ( currentObjValue + alpha * t * descentValue) )
        flag = 1;
%         iterNum = i;
        break;
    else
        t = t * beta;
    end
end

end
