function objectValue = objectFunction(A,x)


objectValue = -1 * sum(log(1-A'* x)) + -1 * sum(log(1-x.^2));


end