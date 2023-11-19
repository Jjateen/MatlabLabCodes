clc
clear all
close all
a=0.5;
stepsize_t=0.001;
t = -5 : 0.001 : 5;
len_t = length(t);

for ii = 1:1:len_t
    v_t(ii)=sin(t(ii));
end
plot(t,v_t)
xlabel("t")
ylabel("sin")