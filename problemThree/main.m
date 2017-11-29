%% 按Ctrl +　Enter 运行本节得到m=50 n = 50时的结果
% press Ctrl + Enter to run this section, m = 50, n = 50;

load('m=50_n=50.mat');
[n,m] = size(A);
x0 = zeros(n,1);
maxIter = 1000;
gradFun = @(x)calculateGradient(A,x);
objFun = @(x)objectFunction(A,x);

bound = 1e-5;


for i = 1:3

    xList = [];
    gradList = []; 
    tList = [];
    xk = x0;
    
    for j = 1:maxIter
        tempGrad = gradFun(xk);
        descentDirection = calculateDescentDirection(tempGrad,i);
        [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad,A);
        xList = [xList,xk];
        gradList = [gradList,gradFun(xk)];
        tList = [tList,t];
        if ( norm(gradFun(xk)) <= bound )
            break;
        end
    end
    disp('the iteration number is ');
    disp(j);
    gradCell{i} = gradList(:,1:j);
    xCell{i} = xList(:,1:j);
    tCell{i} = tList(:,1:j);
    objValueCell{i} = objValueList(:,1:j);
end
postProcessing;



%% 按Ctrl +　Enter 运行本节得到m=50 n = 50时的结果
% press Ctrl + Enter to run this section, m = 50, n = 50;
load('m=100_n=100.mat');
[n,m] = size(A);
x0 = zeros(n,1);
maxIter = 2000;
gradFun = @(x)calculateGradient(A,x);
objFun = @(x)objectFunction(A,x);

bound = 1e-5;


for i = 1:3

    xList = [];
    gradList = []; 
    tList = [];
    xk = x0;
    
    for j = 1:maxIter
        tempGrad = gradFun(xk);
        descentDirection = calculateDescentDirection(tempGrad,i);
        [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad,A);
        xList = [xList,xk];
        gradList = [gradList,gradFun(xk)];
        tList = [tList,t];
        if ( norm(gradFun(xk)) <= bound )
            break;
        end
    end
    disp('the iteration number is ');
    disp(j);
    gradCell{i} = gradList(:,1:j);
    xCell{i} = xList(:,1:j);
    tCell{i} = tList(:,1:j);
    objValueCell{i} = objValueList(:,1:j);
end
postProcessing;

        
        
        
        
        
    
