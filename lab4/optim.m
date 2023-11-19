clc
close all
clear all

step_t = 0.01;
t = -20:step_t:20;

% Preallocate arrays
length_t = length(t);
x_t = zeros(1, length_t);

step_omega = 0.01 * pi;
omegax = -(1 / step_t) * pi:step_omega:(1 / step_t) * pi;

% Preallocate arrays
length_omega = length(omegax);
expo_omega = exp(-1j * omegax.' * t);

% Generate x_t
x_t(t == 0) = 1 / step_t;

subplot(3, 1, 1), plot(t, x_t)
pause(2)

% Compute X_omega
X_omega = expo_omega * x_t.';
X_omega_angle = atan(imag(X_omega) ./ real(X_omega));

% Calculate X_omega_theo
X_omega_theo = 2 ./ (1 + omegax.^2);
X_omega_angle_theo = zeros(size(omegax));

subplot(3, 1, 2)
plot(omegax, abs(X_omega), 'b')
hold on
plot(omegax, X_omega_theo, 'r')
hold off
legend('abs(X_{\omega})', 'X_{\omega} (Theoretical)')

subplot(3, 1, 3)
plot(omegax, X_omega_angle, 'b')
hold on
plot(omegax, X_omega_angle_theo, 'r')
hold off
legend('angle(X_{\omega})', 'angle(X_{\omega} Theoretical)')
