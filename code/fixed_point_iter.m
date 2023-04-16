function p = fixed_point_iter(g, p_0, TOL, maxiter, verbose)
    % Created 2023-02-01
    % Algorithm 2.2, pg. 60
    % Fixed point method for finding sols to x = g(x)
    % with initial guess p_0

    syms x;
    if nargin < 5
        verbose = false;
    end

    i = 1;
    while i <= maxiter
        p = vpa(subs(g, x, p_0));
        
        if verbose
            fprintf("\nN: %d, ", i);
            fprintf("p_n = %0.8f, ", p_0);
            fprintf("g(p_n) = %0.8f", p);
        end

        if abs(p - p_0) < TOL 
            return
        end
        i = i + 1;
        p_0 = p;
    end
    fprintf("\n\nMethod failed after 'maxiter' iterations.");
