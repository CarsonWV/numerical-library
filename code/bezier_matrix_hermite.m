function output_matrix = bezier_matrix_hermite(points, points_plus, points_minus, print_output)
    % Created 2023-02-17
    % Alg. 3.6 Bezier Curve (pg. 161)
    % points - 2x2 matrix w/ 1 col of x values, one of y.
    % l_guide - Same for left guide points.
    % r_guide - Same for right.

    % Set default arguments
    if nargin < 4 
       print_output = false; 
    end

    x = points(:, 1);
    y = points(:, 2);

    n = length(x) - 1;

    x_plus = points_plus(:, 1);
    y_plus = points_plus(:, 2);


    x_minus = [0 points_minus(:, 1).'];
    y_minus = [0 points_minus(:, 2).'];

    a_0 = zeros([n 1]);
    a_1 = zeros([n 1]);
    a_2 = zeros([n 1]);
    a_3 = zeros([n 1]);
    
    b_0 = zeros([n 1]);
    b_1 = zeros([n 1]);
    b_2 = zeros([n 1]);
    b_3 = zeros([n 1]);

    % Step 1
    for i = (0) +1:(n-1) +1

        alpha_0 = x_plus(i) - x(i);
        alpha_1 = x(i+1) - x_minus(i+1);
        beta_0 = y_plus(i) - y(i);
        beta_1 = y(i+1) - y_minus(i+1);

        a_0(i) = x(i);
        b_0(i) = y(i);

        a_1(i) = alpha_0;
        b_1(i) = beta_0;

        a_2(i) = 3*(x(i+1) - x(i)) - (alpha_1 + 2*alpha_0);
        b_2(i) = 3*(y(i+1) - y(i)) - (beta_1 + 2*beta_0);

        a_3(i) = 2*(x(i) - x(i+1)) + (alpha_0 + alpha_1);
        b_3(i) = 2*(y(i) - y(i+1)) + (beta_0 + beta_1);
        
    end

    output_matrix = [a_0 a_1 a_2 a_3 b_0 b_1 b_2 b_3];

    if print_output
        for i = 1 : size(output_matrix, 1)
            str = string(round(output_matrix(i, :), 2));
            fmla_1 = sprintf("%s + %s*t + %s*t^2 + %s*t^3", str(1), str(2), str(3), str(4));
            displayFormula(fmla_1)
            fmla_1 = sprintf("%s + %s*t + %s*t^2 + %s*t^3", str(5), str(6), str(7), str(8));
            displayFormula(fmla_1)
        end
    end