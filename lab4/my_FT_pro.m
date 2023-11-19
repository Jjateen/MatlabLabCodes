clc
close all
clear all

step_t=0.01;
t=-20:step_t:20;
length_t=length(t);

step_omega=0.01*pi;



omegax=-(1/step_t)*pi:step_omega:(1/step_t)*pi;
length_omega=length(omegax);

for ii=1:length_omega
    expo_omega(ii,:)=exp(-1j*omegax(ii).*t);
end

for ii=1:length_t
    if(t(ii)==0)
        x_t(ii)=1/step_t;
    else
        x_t(ii)=0;
    end
%     if(t(ii)<-0.5)
%         x_t(ii)=0;
%     elseif(t(ii)>=-0.5  && t(ii)<=0.5)
%         x_t(ii)=1;
%     else
%         x_t(ii)=0;
%     end

end

subplot(3,1,1),plot(t, x_t)
pause(2)

for ii=1:length_omega
    temp=x_t.*expo_omega(ii,:);
    X_omega(ii)=my_int_fun(temp, step_t);
end

X_omega_angle=atan(imag(X_omega)./real(X_omega));

for ii=1:length_omega
    
    X_omega_theo(1, ii)=2/(1+omegax(ii)^2);
    X_omega_angle_theo(1,ii)=0;
end 
subplot(3,1,2),plot(omegax, [abs(X_omega); X_omega_theo] )
subplot(3,1,3),plot(omegax, [X_omega_angle; X_omega_angle_theo] )