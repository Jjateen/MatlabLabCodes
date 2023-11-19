clc
clear all
close all

step_s = 0.05;
s = -40:step_s:40;
length_s = length(s);

step_size_t = 0.05;
t = -40:step_size_t:40;
length_t = length(t);

for ii = 1:length_s
    expo_s(ii,:) = exp(-s(ii) * t);
end

[x_t_1] = signal_gen(t, 2, 1, 0, 0, 0, step_size_t, length_t);

subplot(2,1,1), plot(t, (x_t_1))

[X_s_1, s] = computation_of_LT(x_t_1, step_s, expo_s, s, length_s);

% Magnitude spectrum
X_s_Mag_1 = abs(X_s_1);

% Phase of the Laplace transform
%Angle_X_s_1 = atan(imag(X_s_1)./real(X_s_1));

% Theoretical calculation of phase and magnitude
%for ii = 1:length(s)
%    X_s_Mag_the(ii) = 0;
%    Angle_X_s_the(ii) = 0;
%end

subplot(2,1,2), plot(s, (X_s_Mag_1));
%subplot(3,1,3), plot(s, [Angle_X_s_1]);