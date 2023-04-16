function T = comparison_table(a_p_n, b_p_n, c_p_n, d_p_n, initial, iterations, row_names)
    % Created 2023-02-01
    % Custom helper function.
    % Given anonymous function, a_p_n - d_p_n, generate a table of their
    % values for iteration 1 through iterations.


    % initial values.
    a = a_p_n(initial); b = b_p_n(initial); c = c_p_n(initial); d = d_p_n(initial);
    table_data = [1 a b c d];
    
    for i = 2:iterations
        % Next iteration.
        a = a_p_n(a); b = b_p_n(b); c = c_p_n(c); d = d_p_n(d);
        new_row = [i a b c d];
        table_data = [table_data;new_row];
    end
    
    % Ex. row_names: {'count', 'A', 'B', 'C', 'D'}

    table_data = round(table_data, 4, "significant");
    T = table(table_data(:,1), ...
        table_data(:,2), ...
        table_data(:,3), ...
        table_data(:,4), ...
        table_data(:,5), ...
        'VariableNames', row_names);