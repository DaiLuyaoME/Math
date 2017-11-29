objFun = @(x)(1-x(1))^2+2*(x(2)-x(1)^2)^2;
gradFun = @(x)[-2*(1-x(1))-8*x(1)*( -1*x(1)^2+x(2));4*(-1*x(1)^2+x(2))];

%% solve problem two with exact line search

% parameters initialization
maxIter = 300;
xCell = cell(3,1);
gradCell = cell(3,1);
objFunValueCell = cell(3,1);
descentDirectionCell = cell(3,1);
gradBound = 1e-8;

for i = 1:3
    
    x0 = [0;0];
    
    tempX = zeros(2,maxIter+1);
    tempGrad = zeros(2,maxIter+1);
    tempObjValue = zeros(1,maxIter+1);
    tempDescentDirection = zeros(2,maxIter+1);
    tempX(:,1) = x0;
    tempGrad(:,1) = gradFun(x0);
    tempObjValue(1) = objFun(x0);
    for j = 2 : (maxIter+1)
        if ( norm(tempGrad(:,j-1)) < gradBound)
            break;
        end
        descentDirection = calculateDescentDirection(tempGrad(:,j-1),i);
        tempDescentDirection(:,j-1) = descentDirection;
        [tempObjValue(j),tempX(:,j),t,iterNum,flag] = exactLineSearch(objFun,tempX(:,j-1),descentDirection);
%          [tempObjValue(j),tempX(:,j),t,iterNum,flag] = exactLineSearch(objFun,tempX(:,j-1),descentDirection,1.1,norm(descentDirection),1e-8)
        tempGrad(:,j) = gradFun(tempX(:,j));
    end
    disp('the Iteration number is ');
    disp(j);
    disp('the optimal value is ');
    disp(tempObjValue(end));
%     sprintf('the iteration number is %d', j);
    xCell{i} = tempX(:,1:(j-1));
    gradCell{i} = tempGrad(:,1:(j-1));
    objFunValueCell{i} = tempObjValue(1:(j-1));
    descentDirectionCell{i} = tempDescentDirection(:,1:(j-2));
    
end
%%
postProcessingProblemTwo;

