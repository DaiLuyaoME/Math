function [v,w] = solveKKTMatrix(H,A,g,h)
L = choleskyDecomposition(H);
AT = A';
[m,n] = size(A);
opts1.LT = true;
opts2.UT = true;
%% step one
Y = zeros(n,m); % H^-1 * AT
for i = 1:m
    temp = linsolve(L,AT(:,i),opts1);
    temp = linsolve(L',temp,opts2);
    Y(:,i) = temp;
end

temp = linsolve(L,g,opts1);
y = linsolve(L',temp,opts2); % H^-1 * g

%% step two
S = -1 * A * Y;

%% step three
LS = choleskyDecomposition(-1 * S);
temp = linsolve(LS,(h - A * y),opts1);
w = linsolve(LS',temp,opts2); 

%% step four
temp = linsolve(L,(-1*AT*w - g),opts1);
v = linsolve(L',temp,opts2); 


end