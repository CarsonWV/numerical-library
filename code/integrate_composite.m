function output = integrate_composite(f, a, b, n, method)
    % Created 2023-03-24
    % Section 4.4 - Composite Numerical Integration
    % f      - function to be integrated.
    % a, b   - interval endpoints.
    % n      - EVEN number for n/2 subintervals.
    % method - Simpson's, Trapezoidal, or Midpoint.
    
    if method == "simpson's"
        % USING: Algorithm 4.1 from pg. 199 of Burden 7th Ed.
        
        % STEP 1
        h = (b - a) / n;
        
        % STEP 2
        XI0 = f(a) + f(b);
        XI1 = 0;
        XI2 = 0;

        % STEP 3
        for i = 1:n-1
            
            % STEP 4
            X = a + i*h;
            
            % STEP 5
            if mod(i, 2) == 0
                XI2 = XI2 + f(X);
            else
                XI1 = XI1 + f(X);
            end
        
        end

        % STEP 6
        XI = h*(XI0 + 2*XI2 + 4*XI1) / 3;
        output = XI;
    
    elseif method == "trapezoidal"
        % USING: Adapting Theorem 4.5 to Simpson's Rule Code
        
        % STEP 1
        h = (b - a) / n;
        
        % STEP 2
        XI0 = f(a) + f(b);
        XI1 = 0;

        % STEP 3
        for i = 1:n-1
            
            % STEP 4
            X = a + i*h;
            
            % STEP 5
            XI1 = XI1 + f(X);
        
        end

        % STEP 6
        XI = h*(XI0 + 2*XI1) / 2;
        output = XI;

    elseif method == "midpoint"
        % USING: Adapting Theorem 4.5 to Simpson's Rule Code

        % STEP 1
        h = (b - a) / (n + 2);
        
        % STEP 2
        XI1 = 0;

        % STEP 3
        for j = 0:n/2
            
            % STEP 4
            X = a + (2*j + 1)*h;
            
            % STEP 5
            XI1 = XI1 + f(X);
            
        end

        % STEP 6
        XI = 2*h*(XI1);
        output = XI;

    else
        dips("Method required!")
    
    end
    