function y_prime = appx_derivative(x, y, type)
    % Created 2023-03-13
    % Section 4.1, implemented from book formulas.
    % Used for filling in tables from homework exercises.
    % Assumes all points are equally spaced.

    y_prime = zeros(1, length(x));

    h = x(2) - x(1);
    len = length(x);

    if type == "forward-backward"
        disp(strcat("USING: ", type))

        for i = 1:len
            if i == len
                y_prime(len) = (y(i - 1) - y(i)) / (-h);

            else
                y_prime(i) = (y(i + 1) - y(i)) / (h);
            end
        end
    
    elseif type == "3-point"
        disp(strcat("USING: ", type))

        for i = 1:len
            if i == 1
                y_prime(1) = (1 / (2*h))*(-3*y(1) + 4*y(2) - y(3));
            
            elseif i == len
                y_prime(len) = (1 / (2*(-h)))*(-3*y(len) + 4*y(len - 1) - y(len - 2));
            
            else
                y_prime(i) = (1 / (2*h))*(y(i + 1) - y(i - 1));
            end
        end
    
    elseif type == "5-point"
        disp(strcat("USING: ", type))

        for i = 1:len
            if i == 1 || i == 2
                y_prime(i) = (1 / (12*h)) * (-25*y(i) + 48*y(i + 1) - 36*y(i+2) + 16*y(i+3) - 3*y(i+4));
            
            elseif i == len - 1 || i == len
                y_prime(i) = (1 / (12*-h)) * (-25*y(i) + 48*y(i-1) - 36*y(i-2) + 16*y(i-3) - 3*y(i-4));
            
            else
                y_prime(i) = (1 / (12*h))*(y(i-2) - 8*y(i-1) + 8*y(i+1) - y(i+2));
            end
        end
    end
