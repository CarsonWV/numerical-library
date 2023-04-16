function max_error = spline_max_error(x_knots, f, a, b)
    syms x
    
    fcn = diff(f, 4);
    f_prime_four = @(val) vpa(subs(fcn, x, val));
    M = max(arrayfun(f_prime_four, a : 0.05 : b));

    len = length(x_knots);
    x_flip = flip(x_knots);
    max_x_diff = max(x_flip(1 : len - 1) - x_flip(2 : len));

    max_error = (5*M/384) * max_x_diff^4;