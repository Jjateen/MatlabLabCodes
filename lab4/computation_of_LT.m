function [X_s, s] = computation_of_LT(x_t, step_t, expo_s, s, length_s)
    % This program will compute the Laplace transform
    % Input: signal, time step, exponentials, Laplace variable, and length of Laplace variable
    
    for ii = 1:length_s
        temp = x_t .* expo_s(ii, :);
        X_s(ii) = my_int_fun(temp, step_t);
    end
end
