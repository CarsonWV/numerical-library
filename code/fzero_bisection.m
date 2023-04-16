function p = fzero_bisection(f, a, b, TOL, maxit, verbose)
    % Created 2023-02-01
    % Algorithm 2.1, pg. 49
    % Bisection method for finding roots of cont's function
    % f where f(a) and f(b) have different signs.

    syms x
    if nargin < 6
        verbose = false;
    end

    i = 1;
    fa = vpa(subs(f, x, a));
    while i <= maxit
  
        p = vpa((a + b)/2);
        fp = vpa(subs(f, x, p));
        
        if verbose
            fprintf("\nN: %d, ", i);
            fprintf("a = %0.8f, ", a);
            fprintf("b = %0.8f, ", b);
            fprintf("p = %0.8f, ", p);
            fprintf("f(p) = %0.8f", fp);
        end
        
        if fa * fp > 0
            a = p; fa = fp;
        else
            b = p;
        end
        if b - a <= TOL
            return
        end
        i = i + 1;
    end
    fprintf("\n\nWARNING: Method failed after 'maxiter' iterations.");
