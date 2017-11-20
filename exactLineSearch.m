function [objFunValue,xNew,t,iterNum,flag] = exactLineSearch(objFun,xk,descentDirection,gamma,delta,threshold,maxIter)
%% exact line search function
% objFun: object function
% xk: current location
% descentDirection: the descent direction
% gamma: the value of gamma, which should be in (0.0.5),the default value
% is 1.1
% delta: the value of delta, the default value is the 2-norm of current
% descent direction
% threshold: the default value is 1e-5
% maxIter: the maximum iteration number, the default value is 100
minArgs=3;
maxArgs=7;
narginchk(minArgs,maxArgs);
defaultThreshold = 1e-5;
defaultMaxIter = 100;
if nargin == 3
    gamma = 1.1;
    delta = norm(descentDirection)  ;
    threshold = defaultThreshold;
    maxIter = defaultMaxIter;
end
if nargin == 4
    delta = norm(descentDirection) ;
    threshold = defaultThreshold;
    maxIter = defaultMaxIter;
end

if nargin == 5
    threshold = defaultThreshold;
    maxIter = defaultMaxIter;
end

t1 = 0;
t2 = delta;
ratio = 0.618;
flag = 0;
currentObjValue = objFun(xk);
% xkNorm = norm(xk);

for i = 1:maxIter
    tempx = xk + t2 * descentDirection;
    if ( objFun(tempx) > currentObjValue )
        break;
    else
        t2 = t2 * gamma;
    end
end



for i = 1: maxIter
    tempt1 = t1 + (t2 - t1) * (1 - ratio);
    tempt2 = t1 + (t2 - t1) * ratio;
    if (objFun(xk + tempt1 * descentDirection) > objFun(xk + tempt2 * descentDirection))
        t1 = tempt1;
    else
        t2 = tempt2;
    end
    if ( abs(t2 - t1) < threshold )
        flag = 1;
        t = 0.5 * (t1 + t2);
        xNew = xk + t * descentDirection;
        iterNum = i;
        objFunValue = objFun(xNew);
        break;
    end
end

end

