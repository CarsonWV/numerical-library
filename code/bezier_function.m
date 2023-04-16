function points = bezier_function(mat, points_per_spline)
    % Get the output points for a bezier curve,
    % using `points_per_spline` cuts of the interval [0, 1]
    % for each individual spline.

    n_spline = size(mat, 1);

    points = zeros(points_per_spline * n_spline, 2);
    param_values = linspace(0, 1, points_per_spline);
    
    for block = 0 : points_per_spline - 1
        i = param_values(block + 1);
        param_vector = [1 i i^2 i^3].';
        
        x_next = mat(:, 1:4)*param_vector;
        y_next = mat(:, 5:8)*param_vector;

        points(n_spline*block +1: n_spline*(block + 1), 1) = x_next;
        points(n_spline*block +1: n_spline*(block + 1), 2) = y_next;
    end

%     for i = 1 : n_spline
%         domain = linspace((i - 1)*(1/ n_spline), ((i - 1) + 1)*(1/ n_spline) - 0.00001, points_per_spline)
%         
%         x_function = @(x) mat(i, 1:4)*[1 x x^2 x^3].';
%         y_function = @(x) mat(i, 5:8)*[1 x x^2 x^3].';
%         
%         x_next = arrayfun(x_function, domain);
%         y_next = arrayfun(y_function, domain)
% 
%         points(points_per_spline*(i - 1) +1: points_per_spline*((i - 1) + 1), 1) = x_next;
%         points(points_per_spline*(i - 1) +1: points_per_spline*((i - 1) + 1), 2) = y_next;
%     end