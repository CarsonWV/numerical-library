function R = integrate_romberg(f, a, b, n)
    
    % Initialize output matrix.
    output = zeros(n, n);

    % STEP 1
    h = b - a;

    % STEP 2
    R = zeros(n, n);
    R(1, 1) = (h / 2)*(f(a) + f(b));
    
    % STEP 3
    for i = 2:n

        % STEP 4
        sigma = 0;
        for k = 1:2^(i - 2)
            sigma = sigma + f(a + (k - 0.5)*h);
        end
        R(i, 1) = (1 / 2)*(R(i - 1, 1) + h*sigma);
    
        % STEP 5
        for j = 2:i
            R(i, j) = R(i, j - 1) + ((R(i, j - 1) - R(i - 1, j - 1)) / ((4^(j - 1)) - 1));
        end

        % STEP 6
        % Skipped

        % STEP 7
        h = h / 2;

        % Step 8
        % Skipped

    end

    