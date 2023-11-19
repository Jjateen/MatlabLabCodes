% Parameters for the signals
step_size_t = 0.01;
t = -5:step_size_t:5;
length_t = length(t);

% Generate the time signal x(t) using the signal_gen function
[x_t_sine] = signal_gen(t, 6, sqrt(10), 0, 50, 1, step_size_t, length_t);

% Square the time signal to obtain x(t) = 10 * sin^2(2\pi * 50t)
x_t = x_t_sine.^2;

% Plot the time signal x(t)
subplot(2, 1, 1);
plot(t, x_t);
title('x(t) = 10 * sin^2(2\pi \cdot 50t)');
xlabel('t');
ylabel('x(t)');
grid on;

% Compute the Fourier Transform of the time signal x(t)
% (You can use the same code for Fourier Transform as in the previous response)

% Magnitude spectrum of the Fourier Transform
% Phase of the Fourier Transform

% Plot the magnitude and phase of the Fourier Transform
subplot(2, 1, 2);
plot(omegax, X_omega_Mag);
title('Magnitude Spectrum of Fourier Transform');
xlabel('\omega');
ylabel('|X(\omega)|');
grid on;

% Adjust the plot layout
sgtitle('Time Signal and Its Fourier Transform');
