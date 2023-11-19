clc
clear all
close all
a=0.5;stepsize_t=0.001;
t = -5 : 0.001 : 5;
len_t = length(t);

for ii = 1:1:len_t
    if(t(ii)>0) %can shift graph from this
        v_t(ii)=1;
    elseif(t(ii)<0) %can shift graph from this
        v_t(ii)=-1;
    else
        v_t(ii)=0;
    end
end
plot(t,v_t)
xlabel("t")
ylabel("signum")