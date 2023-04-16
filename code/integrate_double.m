function J = integrate_double(f, a, b, c, d, n, m, method)
    % Created 2023-03-25
    % USING: Alg. 4.4 on page 233 of Burden, 8th edition.
    % f    - function of x and y to be integrated
    % a, b - bounds of the outer integral
    % c, d - bounds of the inner functions, functions of x only.
    % n, m - number of iterations for each integral

    if method == "simpson's"

        % STEP 1
        h = (b - a) / n;
        J_1 = 0;
        J_2 = 0;
        J_3 = 0;
    
        % STEP 2
        for i = 0:n
            % STEP 3
            x = a + i*h;
            HX = (d(x) - c(x)) / m;
            K_1 = f(x, c(x)) + f(x, d(x));
            K_2 = 0;
            K_3 = 0;
            
            % STEP 4
            for j = 1:m - 1
                % STEP 5
                y = c(x) + j*HX;
                Q = f(x, y);
                
                % STEP 6
                if mod(j, 2) ==  0
                    K_2 = K_2 + Q;
                else
                    K_3 = K_3 + Q;
                end
            end
    
            % STEP 7
            L = (K_1 + 2*K_2 + 4*K_3)* HX / 3;
    
            % STEP 8
            if (i == 0 || i == n)
                J_1 = J_1 + L;
            elseif mod(i, 2) == 0
                J_2 = J_2 + L;
            else
                J_3 = J_3 + L;
            end
    
        end
        % STEP 9
        J = h*(J_1 + 2*J_2 + 4*J_3) / 3;
    
        % STEP 10
    end
            