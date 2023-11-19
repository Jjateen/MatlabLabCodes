clc
clear all
close all

time_period=2;
step_size_t=0.0001;
t=0:step_size_t:time_period;
tt=length(t);

omega_o=2*pi/time_period;

No_of_Fourier_coff=20;
kk=-No_of_Fourier_coff:1:No_of_Fourier_coff;

for ii=1:tt
    v_t(ii)=2*sin((pi/2)*t(ii));
     if(t(ii)<-0.25)
        v_t(ii)=0;
    elseif(t(ii)>=-0.25 && t(ii)<=0.25)
        v_t(ii)=1;
    else
        v_t(ii)=0;
    end

    v_t(ii)=(2/3)*t(ii);

    if(t(ii)<=0.5)
        v_t(ii)=5*cos(omega_o*t(ii));
    elseif(t(ii)>0.5 && t(ii)<1.5)
        v_t(ii)=0;
    else
        v_t(ii)=5*cos(omega_o*t(ii));
    end

    if(t(ii)<=2)
        v_t(ii)=1*sin(omega_o*t(ii));
    else
        v_t(ii)=0;
    end

end

%theortical values of a_k
for ii=1:1:(2*No_of_Fourier_coff+1)
    if(abs(kk(ii))==1)
        a_k_th(ii)=(1+1j*(pi/2))/(4*pi);
    else
    a_k_th(ii)=(1/((2*pi)*(1-kk(ii)^2)))*( 1-1j*kk(ii)*exp(-1j*kk(ii)*pi/2) );
    end
end

subplot(2,2,1), plot(t, v_t)
xlabel("time (t)")
ylabel("v(t)")


for ii=1:1:(2*No_of_Fourier_coff+1)
    temp1=v_t.*exp(-1j*omega_o*kk(ii).*t);
    [int_ans] = my_int_fun(temp1, step_size_t);
    a_k(ii)=(1/time_period)*(int_ans);
end

subplot(2,2,2),stem(kk, abs(a_k))

pause

mid_term_of_fs=No_of_Fourier_coff+1;
t2=0:step_size_t:3*time_period;
for ii=1:mid_term_of_fs
    if(ii==1)
        harmonics(ii,:)=a_k(mid_term_of_fs)*...
            exp(1j*omega_o*kk(mid_term_of_fs).*t);
    else
        harmonics(ii,:)=(a_k(mid_term_of_fs-ii+1).*...
            exp(1j*omega_o*(kk(mid_term_of_fs-ii+1)).*t))...
            +(a_k(mid_term_of_fs+ii-1).*...
            exp(1j*omega_o*(kk(mid_term_of_fs+ii-1)).*t));
    end
  
end

subplot(2,2,3), plot(t, real(harmonics))

reconstructed_signal=sum(harmonics);
subplot(2,2,4),plot(t, real(reconstructed_signal), '--r' )

figure, subplot(2,1,1),stem(kk, abs(a_k))

subplot(2,1,2),stem(kk, abs(a_k_th))