function L = choleskyDecomposition(A)

[m,n] = size(A);

L = zeros(m,n);

L(1,1) = sqrt(A(1,1));
for i = 2:n
    L(i,1) = A(1,i) / L(1,1);
end
for i = 2:n
    temp = sum(L(i,1:(i-1)).^2);
    L(i,i) = sqrt(A(i,i)-temp);
    %     temp = L(i, 1: (i-1));
    if i == n
        break;
    else
        for k = i : n
            L(k,i) = A(k,i) -   sum(L(i,1:(i-1)) .* L(k,1:(i-1)));
            %             L(k,i) = sqrt( A(k,i) - sum(temp .* L(k,1:(i-1))) );
        end
    end
end


end