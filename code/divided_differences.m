function d = divided_differences(x_values, y_values, print_table)
    % Created 2023-02-08
    % Helper function for Alg. 3.2, pg. 124
    % Calculate dictionary of divided differences from x and y values.

    % Set default arguments
    if nargin < 3
        print_table = false;
    end

    n = length(x_values) - 1;
    make_name = @(i, j) sprintf("%d_%d", i, j);
    x = @(i) x_values(i + 1);

    d = dictionary();

    % Intialize first side of triangle.
    for i = 0:n
        name = make_name(i, 0);
        d(name) = y_values(i+1);
    end
    
    % Formula on pg. 124
    for i = 1:n
        for j = 1:i
            first = make_name(i, j - 1);
            second = make_name(i - 1, j - 1);
            name = make_name(i, j);
            d(name) = (d(first) - d(second)) / (x(i) - x(i - j));
        end
    end

    if print_table
        
        data = table('Size',[2*(n+1) n+1],'VariableTypes', repelem("string", n+1),'VariableNames',string(0:n));
        for j = 0:n
            
            column = [];

            if j ~= 0
                for i = 0:(j-1)
                    column = [column; ""];
                end
            end

            for i = (0 + j):n
                name = make_name(i, j);
                column = [column; string(round(d(name), 5)); ""];
            end
           
            if j ~= 0
                for i = 0:(j-1)
                    column = [column; ""];
                end
            end
            data(:, j + 1) = table(column);
        end
    
        data
    end