function direction = calculateDescentDirection(grad,normType)
%% calculate descent direction for steepest descent method
% grad: current gradient
% normType: the type of norm, 1 for 1-norm, 2 for 2-norm, 3 for infinite
% norm

direction = zeros(size(grad));
switch normType
    case 1
        [~,index] = max(abs(grad));
        if ( grad(index) >=0 )
            direction(index) = -1;
        else
            direction(index) = 1;
        end
    case 2
        direction = -1 * grad / norm(grad);
    case 3
        temp = -1 * grad;
        direction( temp > 0 ) = 1;
        direction( temp < 0 ) = -1;
        direction( temp ==0 ) = 0;
    otherwise
        direction = -1 * grad/norm(grad);
end

end