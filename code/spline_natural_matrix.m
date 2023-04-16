function coef_matrix = spline_natural_matrix(x_values, y_values)
    % Created 2023-02-12
    % NATURAL CUBIC SPLINE ALGORITHM 3.4                                 
    % To construct the cubic spline interpolant S for the function f,
    % defined at the numbers x(0) < x(1) < ... < x(n), satisfying
    % S''(x(0)) = S''(x(n)) = 0:
    %
    % INPUT:   n; x(0), x(1), ..., x(n); either generate A(I) = f(x(I))
    %          for I = 0, 1, ..., n or input A(I) for I = 0, 1, ..., n.
    %
    % OUTPUT:  A(J), B(J), C(J), D(J) for J = 0, 1, ..., n - 1.
    %
    % NOTE:    S(x) = A(J) + B(J)*( x - x(J) ) + C(J)*( x - x(J) )**2 +
    %          D(J) * ( x - x(J) )**3 for x(J) <= x < x(J + 1)
    
    % Fix the indices between the MATLAB - math translation.
    x = @(i) x_values(i);
    a = @(i) y_values(i);
    n = length(x_values) - 1;

    % STEP 1
    for i = (0) +1:(n-1) +1
        h(i) = x(i + 1) - x(i);
    end

    % STEP 2
    for i = (1) +1:(n-1) +1
        alpha(i) = (3 / h(i)) * (a(i+1) - a(i)) - (3 / h(i-1)) * (a(i)- a(i-1));
    end

    % STEP 3
    l((0) +1) = 1;
    u((0) +1) = 0;
    z((0) +1) = 0;

    % STEP 4
    for i = (1) +1: (n-1) +1
        l(i) = 2 * (x(i+1) - x(i-1)) - h(i-1)*u(i-1);
        u(i) = h(i) / l(i);
        z(i) = (alpha(i) - h(i-1) * z(i-1)) / l(i);
    end

    % STEP 5
    l((n) +1) = 1;
    z((n) +1) = 0;
    c((n) +1) = 0;

    % STEP 6
    for j = (n - 1) +1: -1 : (0) +1
        c(j) = z(j) - u(j) * c(j + 1);
        b(j) = ((a(j + 1) - a(j)) / h(j)) - h(j) * (c(j + 1) + 2 * c(j)) / 3;
        d(j) = (c(j + 1) - c(j)) / (3*h(j));
    end

    % Step 7
    coef_matrix = [x(1) a(1) b(1) c(1) d(1)];
    for j = (0) +2:(n-1) +1
        coef_matrix = [coef_matrix ; [x(j) a(j) b(j) c(j) d(j)]];
    end