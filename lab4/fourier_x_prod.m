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

% Generate the product signal x_product
x_product = x_gate .* x_exp; % Assuming x_gate and x_exp have been computed

[x_t_product] = signal_gen(t, 9, 2, 0.7, 0.5, 10, step_size_t, length_t);

% Plot the product signal
subplot(3, 1, 1);
plot(t, x_t_product);
title('Product Signal: x_{gate}(t) * exp(-0.2t)');
xlabel('t');
ylabel('x(t)');
grid on;

% Compute the Fourier Transform of the product signal
[X_omega_product, omegax] = computation_of_FT(x_t_product, step_size_t, expo_omega, omegax, length_omega);

% Magnitude spectrum
X_omega_Mag_product = abs(X_omega_product);

% Phase of the Fourier Transform
Angle_X_omega_product = atan(imag(X_omega_product) ./ real(X_omega_product));

% Theoretical calculation of phase and magnitude
X_omega_Mag_the_product = zeros(size(omegax));
Angle_X_omega_the_product = zeros(size(omegax));

% Plot the magnitude and phase of the Fourier Transform
subplot(3, 1, 2);
plot(omegax, X_omega_Mag_product);
title('Magnitude Spectrum of Product Signal');
xlabel('\omega');
ylabel('|X(\omega)|');
grid on;

subplot(3, 1, 3);
plot(omegax, Angle_X_omega_product);
title('Phase of Product Signal');
xlabel('\omega');
ylabel('Angle(X(\omega))');
grid on;

% Adjust the plot layout
sgtitle('Fourier Transform of Product Signal');
