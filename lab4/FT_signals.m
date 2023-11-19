clc
clear all
close all

step_omega=0.01*pi;

step_size_t=0.1;
t=-40:step_size_t:40;
length_t=length(t);

omegax=-(1/step_size_t)*pi:step_omega:(1/step_size_t)*pi;
length_omega=length(omegax);

for ii=1:length_omega
    expo_omega(ii,:)=exp(-1j*omegax(ii).*t);
end


[x_t_1] = signal_gen(t, 9, 2, 0.7, 0.5, 10,...
    step_size_t, length_t);

subplot(3,1,1), plot(t, [x_t_1])

[X_omega_1, omegax] = computation_of_FT(x_t_1, step_size_t, expo_omega, omegax, length_omega);

%Magnitute spectrum
X_omega_Mag_1=abs(X_omega_1);


%Phase of the 
Angle_X_omega_1=atan(imag(X_omega_1)./real(X_omega_1) );


%theoertical calculation of phase and magnitute

for ii=1:length(omegax)
    X_omega_Mag_the(ii)=0;
    
    Angle_X_omega_the(ii)=0; 
end

subplot(3,1,2), plot(omegax, [X_omega_Mag_1] );
subplot(3,1,3), plot(omegax, [Angle_X_omega_1] );
pause(1)