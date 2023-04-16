function output = get_nth_term(fcn, initial, iteration)
    % Created 2023-02-01
    % Custom helper function.
    % Gets nth term of recursive fuction fcn, given initial value
    % `initial`. Returns result after `iteration` cycles.

    % Initial value.
    output = fcn(initial);
    for i = 2:iteration
        % Next iteration.
        output = fcn(output);
    end