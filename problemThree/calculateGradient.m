function grad = calculateGradient(A,x)
% [~,m] = size(A);
% 
% for i = 1:m
%     A(:,i) = A(:,i) ./ ( 1 - dot(A(:,i),x) );
% end
% 
% grad = sum(A,2);

grad = A * ( 1./ (1 - A' * x) ) - 1./(1+x) + 1./(1-x);

end