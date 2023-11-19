clc
clear all
close all
a=0.5;
stepsize_t=0.001;
t = -10 : 0.001 : 10;
len_t = length(t);
for ii = 1:1:len_t
    if(t(ii)>-5 && t(ii)<5)
        v_t(ii)=5;
    else
        v_t(ii)=0;
    end
end
plot(t,v_t)
xlabel("t")
ylabel("gate ")
%Conclusion: By generating