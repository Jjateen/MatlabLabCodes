%A = 1.0;  % Amplitude
%a = 0.2;  % Decay factor
%doubleSidedExponential(A, a);


clc
clear all
close all
a=0.5;
t = -10 : 1 : 10;
len_t = length(t);

for ii = 1:1:len_t
    if(t(ii)>-5 && t(ii)<5) 
        v_t(ii)=5;
    else
        v_t(ii)=0;
    end
end    
stem(t,v_t)
xlabel("t")
ylabel("gate ")