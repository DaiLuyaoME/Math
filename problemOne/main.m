clear;

objFun = @(x) log( exp(x-5) + exp(5-x) );
gradFun = @(x) ( exp(2*x) - exp(10) ) / (exp(2*x) + exp(10)) ;

%% solve problem one with exact line search

% parameters initialization
maxIter = 15;
% bound = 1e-5;
x0 = 0;
objValueListExactSearch = zeros(1,maxIter+1);
xListExactSearch = zeros(1,maxIter+1);
gradValueListExactSearch = zeros(1,maxIter+1);
xListExactSearch(1) = x0;
objValueListExactSearch(1) = objFun(x0);
gradValueListExactSearch(1) = gradFun(x0);


for i = 2:(maxIter+1)
    descentDirection = -1 * gradFun(i-1); % use negative gradient as descent direction
    [objValueListExactSearch(i),xListExactSearch(i),t,iterNum,flag] = exactLineSearch(objFun,xListExactSearch(i-1),descentDirection);
    gradValueListExactSearch(i) = gradFun(xListExactSearch(i));
%     if( abs(t) < bound )
%         break;
%     end
end

xListExactSearch = xListExactSearch(1:i);
objValueListExactSearch = objValueListExactSearch(1:i);
gradValueListExactSearch = gradValueListExactSearch(1:i);

% plot(xListExactSearch(1:i));

%% solve problem one with back tracking search
maxIter = 100;
bound = 1e-5;
x0 = 0;
objValueListBackSearch = zeros(1,maxIter+1);
xListBackSearch = zeros(1,maxIter+1);
gradValueListBackSearch = zeros(1,maxIter+1);
xListBackSearch(1) = x0;
objValueListBackSearch(1) = objFun(x0);
gradValueListBackSearch(1) = gradFun(x0);

for i = 2:(maxIter+1)
    descentDirection = -1 * gradValueListBackSearch(i-1); % use negative gradient as descent direction
    [objValueListBackSearch(i),xListBackSearch(i),t,iterNum,flag] = backTrackingLineSearch(objFun,xListBackSearch(i-1),descentDirection,gradValueListBackSearch(i-1));
    gradValueListBackSearch(i) = gradFun(xListBackSearch(i));
%     if(abs(t) < bound)
%         break;
%     end
end

xListBackSearch = xListBackSearch(1:i);
objValueListBackSearch = objValueListBackSearch(1:i);
gradValueListBackSearch = gradValueListBackSearch(1:i);

%%
postProcessingProblemOne;
