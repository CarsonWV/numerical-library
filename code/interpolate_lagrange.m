function output = interpolate_lagrange(x_values, y_values, wrap_output)
    % Created 2023-02-08
    % Implementation of Thm. 3.2, pg. 109
    % Creates Lagrange interpolating polynomial using array of input values
    % and output of f at those values.

    % Set default arguments
    if nargin < 3
        wrap_output = false; 
    end

    output = "";
    y_values = string(y_values);
    n = length(x_values);

    for i = 1:n
        
        % Make output span multiple lines.
        if wrap_output
            term_output = sprintf("%s*%s", y_values(i), lagrange_helper(x_values, i));
            displayFormula(term_output)
        end
        
        % Append next term to complete formula.
        next_term = sprintf("%s*%s+", y_values(i), lagrange_helper(x_values, i));
        output = strcat(output, next_term);

    end
    output = extractBetween(output,1,strlength(output) - 1); % All but last + sign