function data = table_richardson(f, x_0, h, n, given, values)
    % Created 2023-03-17
    % Section 4.2 - Richardson's Approximation
    % Uses process from example 1 to generate table.
    
    % Set default arguments
    if nargin < 5 
        given = false;
        values = [];
    end

    data = zeros([n n]);
    
    if given
        % Case: You're given the initial values (like ex. 4.3.5)
        data(:, 1) = values;
    
    else
        % Case: You're not given any starting values.

        % Sub-divide h values (e.g. 0.2 -> 0.1 -> 0.05).
        inputs = zeros([1 n]); 
        for i = 1:n
            inputs(i) = h / (2^(i - 1));
        end
        
        % Set first column (e.g. N_1(0.2) N_2(0.1) N_(0.05)
        N_1 = @(h) (1 ./ (2 * h)).*(f(x_0 + h) - f(x_0 - h));
        data(:, 1) = N_1(inputs);
    
    end

    % Use column 1 values to 
    for j = 2:n
        for i = j:n
            data(i, j) = data(i, j - 1) + ((data(i, j - 1) - data(i - 1, j - 1)) / (4^(j - 1) - 1));
        end
    end