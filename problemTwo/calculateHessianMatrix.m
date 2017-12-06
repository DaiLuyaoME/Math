function hessian = calculateHessianMatrix(A,x)
temp1 = 1 ./ (1 - A'*x);
temp1 = diag(temp1.^2);

temp2 = diag( (1./( 1 - x)).^2 + (1./( 1 + x)).^2 );

hessian = A * temp1 * A' + temp2;
end
