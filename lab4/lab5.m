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

% Generate the gate signal (x_gate)
[x_t_gate] = signal_gen(t, 9, 2, 0.7, 0.5, 10, step_size_t, length_t);

% Generate exp(-0.2t) signal (x_exp)
[x_t_exp] = signal_gen(t, 4, 1, 0.2, 1, 1, step_size_t, length_t);

% Generate the product signal x_product (x_gate * x_exp)
x_product = x_t_gate .* x_t_exp;

% Plot the signals
subplot(5, 1, 1);
plot(t, x_t_gate);
title('Gate Signal (x_{gate}(t))');
xlabel('t');
ylabel('x(t)');
grid on;

subplot(5, 1, 2);
plot(t, x_t_exp);
title('exp(-0.2t) Signal (x_{exp}(t))');
xlabel('t');
ylabel('x(t)');
grid on;

subplot(5, 1, 3);
plot(t, x_product);
title('Product Signal (x_{product}(t) = x_{gate}(t) * x_{exp}(t))');
xlabel('t');
ylabel('x(t)');
grid on;

% Compute the Fourier Transform of the product signal (X_omega_product)
[X_omega_product, omegax] = computation_of_FT(x_product, step_size_t, expo_omega, omegax, length_omega);

% Magnitude spectrum of the Fourier Transform
X_omega_Mag_product = abs(X_omega_product);

% Phase of the Fourier Transform
Angle_X_omega_product = angle(X_omega_product);

% Plot the magnitude and phase of the Fourier Transform of the product signal
subplot(5, 1, 4);
plot(omegax, X_omega_Mag_product);
title('Magnitude Spectrum of Fourier Transform (X_{product}(\omega))');
xlabel('\omega');
ylabel('|X(\omega)|');
grid on;

subplot(5, 1, 5);
plot(omegax, Angle_X_omega_product);
title('Phase of Fourier Transform (X_{product}(\omega))');
xlabel('\omega');
ylabel('Phase(X(\omega))');
grid on;

% Adjust the plot layout
sgtitle('Signals and Their Fourier Transforms');
