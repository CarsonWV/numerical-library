function output = interpolate_newton(x_values, y_values, output_digits, wrap_output)
    % Created 2023-02-08
    % Newton's Interpolary Divided Differences Formula
    % Alg. 3.2, pg. 124
    % Used to create Newton Interpolation polynomial for approximating
    % function, given x and y values for finite number of points.
    

    % Set default arguments
    if nargin < 4
        wrap_output = false; 
    end

    n = length(x_values) - 1;
    make_name = @(i, j) sprintf("%d_%d", i, j);
    x_math = @(i) x_values(i + 1);

    d = divided_differences(x_values, y_values);

    % Construct and output polynomial
    output = string(round(d("0_0"), output_digits));
    
    if wrap_output
        displayFormula(output)
    end

    for i = 1:n
        name = make_name(i,i);
        coef = string(round(d(name), output_digits));
        
        poly_chain = "";
        for j = 1:i
            if j ~= 1
                poly_chain = strcat(poly_chain, "*");
            end
            poly_chain = strcat(poly_chain, sprintf("(x-%s)", string(x_math(j-1))));
        end
        
        if wrap_output
            fmla_out = sprintf("%s*%s", coef, poly_chain);
            displayFormula(fmla_out)
        end

        if d(name) >= 0
            next_term = sprintf("+%s*%s", coef, poly_chain);
        else 
            next_term = sprintf("%s*%s", coef, poly_chain);
        end

        output = strcat(output, next_term);
    end
