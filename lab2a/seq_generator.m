function doubleSidedExponential(A, a)
    % doubleSidedExponential generates and plots a double-sided exponential decay sequence.
    %
    % Parameters:
    %   A: Amplitude
    %   a: Decay factor

    % Check if input arguments are provided, otherwise use default values
    if nargin < 1
        A = 0.5;
    end

    if nargin < 2
        a = 0.1;
    end
    
    % Discrete time index
    n = -5:5;
    
    % Generate the double-sided exponential decay sequence
    x = A * exp(-a * abs(n));

    % Plot the sequence
    stem(n, x, 'LineWidth', 2);
    xlabel('n');
    ylabel('x[n]');
    title('Double-Sided Exponential Decay Sequence');
    grid on;
end
