% Victor Liu -- V00736140
% CSC 349A, Assignment #3
% Question #3
%
% Function, Bisect(    )

function root = Bisect( xl, xu, eps, imax, fcn, enablePlot )

% interation counter start at 1
i = 1;

% Evaluate the function with x_lower
f_l = feval(fcn, xl);
fprintf( ' iteration    approximation \n')

% Loop while i <= imax value
while( i <= imax)
    x_root = (xl + xu) / 2;
    fprintf( ' %6.0f %18.8f \n', i, x_root )
    
    % Evaluate function with x_root
    f_r = feval(fcn, x_root);
    
    % We only want to print the plots for 1, 2, 4, and 6
    % and i is our counter, so...
    if enablePlot && ((i == 1) || (i == 2) || (i == 4) || (i == 6))
       % Set the number of steps in between x_lower and x_upper
       % tried 0.1 ... too coarse
       % tried 0.01... still too coarse
       x = [xl:0.001:xu];
       
       % Evaluate the function with our range of x-values
       f_x = feval(fcn, x);
       
       z = [xl, x_root, xu];
       f_z = feval(fcn, z);
       
       % create multiple windows using 'figure' command
       figure;
       
       % plot the data
       plot(x, f_x)
       plot(x, zeros(size(x)))
       plot(z, f_z)

    end
    
    % if f_r = 0, or (x_u - x_l)/|x)u + x_l| < E then...
    if((f_r == 0) || ((xu - xl)/abs(xu + xl)) < eps)
        % The root if the current x_r value
        root = x_root
        return;
    end
    
    % increment i counter by one
    i = i + 1;
    
    % test f_lower x f_root < 0
    if((f_l * f_r) < 0)
        % update X_u with X_r
        xu = x_root;
    else
        % update X_l with X_r
        xl = x_root;
        
        % Also update f_l with f_r
        f_l = f_r;
    end
    
end

% Error if equation fails to converge after i_max iterations
fprintf ( ' failed to converge in %g iterations\n', imax )

end
