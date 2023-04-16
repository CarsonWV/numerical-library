function p = fzero_newton(f, p_0, TOL, MAXIT, verbose)
    % Created 2023-02-01
    % Algorithm 2.3, pg. 67
    % Newton's method for finding the root of a function.
    
    syms x;
    if nargin < 5
        verbose = false;
    end

    i = 1;
    while i <= MAXIT
        f_prime = diff(f);
        p = p_0 - ( vpa(subs(f, x, p_0)) / vpa(subs(f_prime, x, p_0)) );

        if verbose
            fprintf("\nN: %d, ", i);
            fprintf("p_0 = %0.8f, ", p_0);
            fprintf("p = %0.8f, ", p);
        end

        if abs(p - p_0) < TOL
            return
        end
        i = i + 1;
        p_0 = p;
    end
    fprintf("\n\nWARNING: Method failed after 'maxiter' iterations.");