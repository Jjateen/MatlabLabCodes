function [X_omega, omegax] = computation_of_FT...
    (x_t, step_t, expo_omega, omegax, length_omega)
%This programe will comput the FT 
%   input are the signal, time and stepsize for omega

for ii=1:length_omega
    temp=x_t.*expo_omega(ii,:);
    X_omega(ii)=my_int_fun(temp, step_t);
end


end

