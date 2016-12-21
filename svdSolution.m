function [U,S,V]=svdSolution(A,flag)
if nargin==1
    flag=0;
end

switch flag
    case 0
        [U,S,V]=svd(A);
    otherwise
end
end
