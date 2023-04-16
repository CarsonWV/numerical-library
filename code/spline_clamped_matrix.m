function coef_matrix = spline_clamped_matrix(x_values, y_values, FPO, FPN)
    % Created 2023-02-12
    % SOURCE: https://sites.google.com/site/numericalanalysis1burden/module-7/matlab?authuser=0
    
    % CLAMPED CUBIC SPLINE ALGORITHM 3.5
    %
    % To construct the cubic spline interpolant S for the function f,
    % defined at the numbers x(0) < x(1) < ... < x(n), satisfying
    % S'(x(0)) = f'(x(0)) and S'(x(n)) = f'(x(n)):
    %
    % INPUT:   n; x(0), x(1), ..., x(n); either generate A(I) = f(x(I))
    %          for i = 0, 1, ..., n or input A(I) for I = 0, 1, ..., n;
    %          FP0 = f'(x(0)); FPN = f'(x(n)).
    %
    % OUTPUT:  A(J), B(J), C(J), D(J) for J = 0, 1, ..., n - 1.
    %
    % NOTE:    S(x) = A(J) + B(J) * ( x - x(J) ) + C(J) * ( x - x(J) )**2 +
    %          D(J) * ( x - x(J) )**3 for x(J) <= x < x(J + 1)
    
    n = length(x_values) - 1;
    a = @(i) y_values(i);

    % Step 1
    h = zeros(n);
    for i = (0) +1: (n - 1) +1
        h(i) = x_values(i + 1) - x_values(i);
    end

    % Step 2
    alpha((0) +1) = 3 * (a((1) +1) - a((0) +1)) / h((0) +1) - 3 * FPO;
    alpha((n) +1) = 3 * FPN - 3 * (a((n) +1) - a((n-1) +1)) / h((n-1) +1);
    
    % Step 3
    for i = (1) +1: (n-1) +1
        alpha(i) = (3 / h(i)) * (a(i + 1) - a(i)) - (3 / h(i - 1)) *(a(i) - a(i - 1));
    end

    % Step 4
    l((0) +1) = 2 * h((0) +1);
    u((0) +1) = 0.5;
    z((0) +1) = alpha((0) +1) / l((0) +1);

    % Step 5
    for i = (1) +1 : (n - 1) +1
        l(i) = 2 * (x_values(i + 1) - x_values(i - 1)) - h(i - 1) * u(i - 1);
        u(i) = h(i) / l(i);
        z(i) = (alpha(i) - h(i - 1) * z(i - 1)) / l(i);
    end

    % Step 6
    l((n) +1) = h((n-1) +1) * (2 - u((n-1) +1));
    z((n) +1) = (alpha((n) +1) - h((n-1) +1) * z((n-1) +1)) / l((n) +1);
    c((n) +1) = z((n) +1);

    % Step 7
    for j = (n - 1) +1 : -1 : (0) +1
        c(j) = z(j) - u(j) * c(j + 1);
        b(j) = (a(j + 1) - a(j)) / h(j) - h(j) * (c(j+1) + 2 * c(j)) / 3;
        d(j) = (c(j+1) - c(j)) / (3 * h(j));
    end

    % Step 8
    coef_matrix = [x_values(1) a(1) b(1) c(1) d(1)];
    for j = (0) +2:(n-1) +1
        coef_matrix = [coef_matrix ; [x_values(j) a(j) b(j) c(j) d(j)]];
    end
    