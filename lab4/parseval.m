clc
clear all
close all

step_omega=0.01*pi;

step_size_t=0.1;
t=-40:step_size_t:40;
length_t=length(t);

omegax=-(1/step_size_t)*pi:step_omega:(1/step_size_t)*pi;
length_omega=length(omegax);
expo_omega = zeros(length_omega, length(t)); % Initialize expo_omega with the correct dimensions

for ii=1:length_omega
    expo_omega(ii,:)=exp(-1j*omegax(ii).*t);
end

[x_t_1] = signal_gen(t, 5, 1, 0.2, 0.5, 10,...
    step_size_t, length_t);

%Enery of the signal in time domain
data=abs(x_t_1).^2;
energy_t=my_int_fun(data, step_size_t);

subplot(3,1,1), plot(t, [x_t_1])

[X_omega_1, omegax] = computation_of_FT(x_t_1, step_size_t, expo_omega, omegax, length_omega);

%Magnitute spectrum
X_omega_Mag_1=abs(X_omega_1);

%Phase of the 
Angle_X_omega_1=atan(imag(X_omega_1)./real(X_omega_1) );

%Enery of the signal in Fre. domain
data=abs(X_omega_Mag_1).^2;
energy_fre=(1/(2*pi))*my_int_fun(data, step_omega);

%Integration function

subplot(3,1,2), plot(omegax, [X_omega_Mag_1] );
subplot(3,1,3), bar([energy_t, energy_fre ]);
pause(1)

[energy_t, energy_fre ]