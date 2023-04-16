function output = spline_function(x, x_values, coef_matrix)
    % Given a coef_matrix of spline values, return the value of y, taking
    % into account the correct subinterval and polynomial coefficients.

    n = length(x_values);
    if x < x_values(1) || x_values(n) < x
        output = 0;
    else
        if abs(x - x_values(n)) < 0.01
            spline_index = n - 2;
        else
            % Find lower bound.
            for i = 1:n
                if  x < x_values(i)
                    spline_index = i - 2;
                    break
                end
            end
        end

        x_j = x_values(spline_index +1);
        output = coef_matrix(spline_index +1,2:5)*[1 ; (x - x_j); (x - x_j)^2 ; (x - x_j)^3];
    end