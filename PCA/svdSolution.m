function [U,S,V]=svdsolve(A,flag)
if nargin==1
    flag=1;
end

switch flag
    case 1
        [U,S,V]=svd(A);
    otherwise
end
end
