clc
clear all
close all

% Parameters for the signals
step_omega = 0.01 * pi;
step_size_t = 0.01;
t = -10:step_size_t:10;
length_t = length(t);

% Define the range for omegax
omegax = -(1/step_size_t) * pi:step_omega:(1/step_size_t) * pi;
length_omega = length(omegax);

% Precompute the exponentials
expo_omega = zeros(length_omega, length(t)); % Initialize expo_omega with the correct dimensions
for ii = 1:length_omega
    expo_omega(ii, :) = exp(-1j * omegax(ii) * t);
end

% Rest of the code remains the same


% Generate the time signal f(t)
x_t = 5 * cos(2 * pi * 10 * t);
x_t(t < -5 | t > 5) = 0; % Set values outside of -5 < t < 5 to 0

% Plot the time signal f(t)
subplot(2, 1, 1);
plot(t, x_t);
title('f(t) = 5cos(2\pi \cdot 10t)');
xlabel('t');
ylabel('f(t)');
grid on;

% Compute the Fourier Transform of the time signal f(t)
[X_omega, omegax] = computation_of_FT(x_t, step_size_t, expo_omega, omegax, length_omega);

% Magnitude spectrum of the Fourier Transform
X_omega_Mag = abs(X_omega);

% Phase of the Fourier Transform
Angle_X_omega = angle(X_omega);

% Plot the magnitude and phase of the Fourier Transform
subplot(2, 1, 2);
plot(omegax, X_omega_Mag);
title('Magnitude Spectrum of Fourier Transform');
xlabel('\omega');
ylabel('|X(\omega)|');
grid on;

% Adjust the plot layout
sgtitle('Time Signal and Its Fourier Transform');
