function output = integrate_standard(f, a, b, method)
    % Created 2023-03-16
    % Section 4.3 - Elements of Numerical Integration
    % a, b - interval endpoints.
    % f    - function to be integrated.
    % n    - number of points to use from the interval.
    
    if method == "trapezoidal"
        h = (b - a);
        output = (h / 2)*(f(a) + f(b));
    
    elseif method == "simpson's"
        h = (b - a) / 2;
        output = (h / 3)*(f(a) + 4*f(a + h) + f(b));

    elseif method == "simpson's three-eighths"
        h = (b - a) / 3;
        output = (3 * h / 8)*(f(a) + 3*f(a+h) + 3*f(a+2*h) + f(b));
    
    elseif method == "4-point"
        h = (b - a) / 4;
        output = (3 * h / 45)*(7*f(a) + 32*f(a+h) + 12*f(a+2*h) + 32*f(a+3*h) + 7*f(b));

    else
        dips("Method required!")
    
    end
    