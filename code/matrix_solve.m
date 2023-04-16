function solved_matrix = matrix_solve(A)
    % Created 2023-04-16
    % Implemented using Algorithm 6.1 in Burden - Numerical Analysis 7th E.
    % Uses Gaussian Elimination and Backwards Substitution to solve a 
    % linear system Ax = b, with A and b given.
    % A - nx(n+1) augmented matrix, with b appended to A as a column.

    [n, m] = size(A);
    M = zeros([n, n]);
    x = zeros([1, n]);
    
    % Input validation.
    if n ~= m - 1
        error("Square matrix required for A.")
    end

    % STEP 1
    for i = 1:n
        
        % STEP 2
        nonzero_exists = false;
        for test_value = n:-1:i
            if A(test_value, i) ~= 0
                nonzero_exists = true;
                p = test_value;
            end
        end
        if ~nonzero_exists
            error("No unique solution exists.")
        end

        % STEP 3
        if p ~= i
            A([i, p], :) = A([p, i], :);
        end

        % STEP 4
        for j = i + 1 : n
            
            % STEP 5
            M(j, i) = A(j, i) / A(i, i);

            % STEP 6
            A(j, :) = A(j, :) - M(j, i)*A(i, :);
        end
    end

    % STEP 7
    if A(n, n) == 0
        error("No unique solution exists.")
    end

    % STEP 8
    x(n) = A(n, n + 1) / A(n, n);
    
    % STEP 9
    for i = n - 1 : -1 : 1
        sigma = 0;
        for j = i + 1 : n
            sigma = sigma + A(i, j)*x(j);
        end

        x(i) = (A(i, n + 1) - sigma) / A(i, i);
    end     

    solved_matrix = x;