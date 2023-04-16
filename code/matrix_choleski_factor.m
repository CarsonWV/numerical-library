function l = matrix_choleski_factor(A)
    % Created 2023-04-16
    % Implementation of Algorithm 6.6 from Burden - Numerical Analysis 7ed.
    % Gives the Choleski factorization for the given matrix A = LL^{t}.
    % A - nxn square matrix.

    [n, m] = size(A);
    l = zeros([n n]);
    syms k;
    
    % Input validation.
    if n ~= m
        error("Square matrix required for A.")
    end

    % STEP 1
    l(1, 1) = (A(1, 1))^(1/2);

    % STEP 2
    for j = 2 : n
        l(j, 1) = A(j, 1) / l(1, 1);
    end

    % STEP 3
    for i = 2 : n - 1
        
        % STEP 4
        l(i, i) = (A(i, i) - sum(l(i, 1 : i - 1).^2))^(1/2);

        % STEP 5
        for j = i + 1 : n
            l(j, i) = (A(j, i) - sum(l(j, 1 : i - 1).*l(i, 1 : i - 1))) / l(i, i);
        end
    end

    % STEP 6
    l(n, n) = (A(n, n) - sum(l(n, 1 : n - 1).^2))^(1/2);

    % STEP 7
    % Final output.