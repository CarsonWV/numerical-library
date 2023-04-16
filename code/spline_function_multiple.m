function [output_range, output_values] = spline_function_multiple(start_index, end_index, x, y)
    % Get spline values for points between two indexes.

    x_subset = x(start_index:end_index);
    y_subset = y(start_index:end_index);

    [x_subset, sortIdx] = sort(x_subset, 'ascend');
    % sort B using the sorting index
    y_subset = y_subset(sortIdx);

    output_range = linspace(x(start_index), x(end_index), 100);
    natural_coefs = spline_natural_matrix(x_subset, y_subset);
    
    get_value = @(input) spline_function(input, x_subset, natural_coefs);
    output_values = arrayfun(get_value, output_range);