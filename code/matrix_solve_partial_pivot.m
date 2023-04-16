function solution = matrix_solve_partial_pivot(A)
    % Created 2023-04-16
    % Implementation of Algorithm 6.2 in Burden - Numerical Analysis 7th E.
    % Solves a system of linear equations Ax = b using Gaussian elimination
    % with partial pivoting.
    % A - nx(n+1) augmented matrix, with b appended to A as a column.

    [n, m] = size(A);
    M = zeros([n n]);
    x = zeros([1 n]);

    % Input validation.
    if n ~= m - 1
        error("Square matrix required for A.")
    end

    % STEP 1
    NROW = 1 : n;

    % STEP 2
    for i = 1 : n - 1
        
        % STEP 3
        for test_value = n : -1 :i
            if abs(A(NROW(test_value), i)) == max(abs(A(NROW(i:n), i)))
                p = test_value;
            end
        end

        % STEP 4
        if A(NROW(p), i) == 0
            error("No unique solution exists.")
        end
        
        % STEP 5
        if NROW(i) ~= NROW(p)
            NCOPY = NROW(i);
            NROW(i) = NROW(p);
            NROW(p) = NCOPY;
        end

        % STEP 6
        for j = i + 1 : n

            % STEP 7
            M(NROW(j), i) = A(NROW(j), i) / A(NROW(i), i);

            % STEP 8
            A(NROW(j), :) = A(NROW(j), :) - M(NROW(j), i) * A(NROW(i), :);

        end
    end

    % STEP 9
    if A(NROW(n), n) == 0
        error("No unique solution exists.")
    end

    % STEP 10
    x(n) = A(NROW(n), n + 1) / A(NROW(n), n);

    % STEP 11
    for i = n - 1 : -1 : 1
        sigma = 0;
        for j = i + 1 : n
            sigma = sigma + A(NROW(i), j)*x(j);
        end
        
        x(i) = (A(NROW(i), n + 1) - sigma) / A(NROW(i), i);
    end

    solution = x;