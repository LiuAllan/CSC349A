function root = Bisect ( xl , xu , eps , imax, f, enablePlot )
i = 1;
fl = feval(f, xl);

fprintf ( ' iteration approximation \n')
while (i <= imax)
    xr = (xl+xu/2);
    fprintf ( ' %6.0f %18.8f \n', i, xr )
    fr = feval(f, xr);
    
    %when enablePlot is 1 it shows each iteration of the bisection method
    if (enablePlot && (i == 1) || (i == 2) || (i == 4) || (i == 6))
        %hold on;
        x = [x1:0.001:xu];
        fx = feval(f, x);
        
        y = [xl:xr:xu];
        fy = feval(f, y);
        
        figure;
        
        plot(x, fx)
        plot(x, zeros(size(x)))
        plot(y, fy)
        %hold off;
    end
    
    
    if (fr == 0 || (xu-xl/abs(xu+xl)) < eps)
        root = xr;
        return;
    end
    i = i + 1;
    if (fl*fr < 0)
        xu = xr;
    else
        xl = xr;
        fl = fr;
    end
end
    fprintf ( ' failed to converge in %g iterations\n', imax )
end

