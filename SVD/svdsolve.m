function [U,S,V]=svdsolve(A,flag)
if nargin==1
    flag=1;
end
[m,n]=size(A);
switch flag
    case 1
        [~, S, U, VT, ~, ~] = nag_lapack_dgesvd('A', 'A', A);
        V=VT';
        %         [U,S,V]=svd(A);
    case 2
        [~, S, U, VT, ~] = nag_lapack_dgesdd('A', A);
        V=VT';
    case 3
        
        [U,S,V] = svd(A);
        S=diag(S(1:n,1:n));
    case 4
        [U,~]=eig(A*A');
        [V,D]=eig(A'*A);
        temp=diag(D);
        S=sqrt(temp);
    case 5
        [~, S, U, V, ~, ~,~] = nag_lapack_dgejsv('E', 'F', 'J', 'R', 'N', 'N', A);
    otherwise
end
end
