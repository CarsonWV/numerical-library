function output = interpolate_hermite(x_values, y_values, y_prime, digits, verbose)
    % Created 2023-02-11
    % Alg. 3.3, pg. 193
    % Generate Hermite polynomial, given points (x,y) and derivates at
    % those points.

    % Set default arguments
    if nargin < 5
        verbose = false; 
    end
    
    n = length(x_values) - 1;
    
    mkname = @(i, j) sprintf("q_%d_%d", i, j);
    d = dictionary();
    z = double.empty(n, 0);

    for i = 0:n
        z((2*i) +1) = x_values(i +1);
        z((2*i + 1) +1) = x_values(i +1);
        name = mkname(2*i, 0); d(name) = y_values(i +1);
        name = mkname(2*i + 1, 0); d(name) = y_values(i +1);
        name = mkname(2*i + 1, 1); d(name) = y_prime(i +1);

        if i ~= 0
            new = mkname(2*i, 1);            
            term1 = mkname(2*i, 0);
            term2 = mkname(2*i - 1, 0);
            d(new) = (d(term1) - d(term2)) / (z((2*i) +1) - z((2*i-1) +1));
        end
    end

    for i = 2:2*n + 1
        for j = 2:i
            new = mkname(i, j);
            term1 = mkname(i,j-1);
            term2 = mkname(i-1, j-1);
            d(new) = (d(term1) - d(term2)) / (z((i) +1) - z((i-j) +1));
        end
    end

    % Construct final polynomial.
    output = "";
    for i = 0:2*n + 1
        if i == 0
            coef = string(vpa(y_values(1), digits));
            next_term = sprintf("%s", coef);
            output = next_term;
        else 
            % Get next coefficient.
            name = mkname(i, i); 
            coef = string(round(d(name), digits));

            % Make polynomial chain.
            poly_chain = "";
            for j = 1:i
                if mod(j, 2) == 1
                    factor = sprintf("(x-%s)", string(round(z(j), digits)));
                    poly_chain = strcat(poly_chain, factor);
                else
                    poly_chain = strcat(poly_chain, "^2");
                    if j ~= i % Not the last iteration
                        poly_chain = strcat(poly_chain, "*");
                    end
                end
            end
            
            next_term = sprintf("%s*%s", coef, poly_chain);
            output = strcat(output, "+", next_term);
        end
        
        if verbose
            displayFormula(next_term)
        end
    end