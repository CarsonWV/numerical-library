function output = lagrange_helper(x_values, k)
    % Created 2023-02-08
    % Helper function for interpolate_poly.m

    n = length(x_values);
    x_values = string(x_values);
    x_k = x_values(k);
    
    numerator = ""; denominator = "";

    for i = 1:n
        if i ~= k
            numerator = strcat(numerator, sprintf('(x - %s)', x_values(i)));
            denominator = strcat(denominator, sprintf('(%s - %s)', x_k, x_values(i)));
        end
    end
    
    fraction = sprintf("((%s) / (%s))", numerator, denominator);
    output = strrep(fraction, ")(", ")*(");