clc
clear all
close all
no_fourier_coff=15;
k=-no_fourier_coff:1:no_fourier_coff;
tp=1;
ss=0.01;
t=0:ss:tp;
omega_o=(2*pi)/tp;
len_t=length(t);

for ii=1:len_t
     if(t(ii)<=0.5)
         f_t(ii)=1;
     else
         f_t(ii)=0;
     end
%f_t=2*sin(2*pi*10.*t);
end
plot(t, f_t);
pause

for ii=1:(no_fourier_coff*2+1)
    t1=f_t.*exp(-1j*omega_o*k(ii).*t);
    t2=my_int_fun(t1, ss);
    a_k(ii)=t2/tp;
    
end

stem(k, abs(a_k))