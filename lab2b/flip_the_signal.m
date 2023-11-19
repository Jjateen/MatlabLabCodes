function [fliped_signal] = flip_the_signal(signal_a, lenght_signal)
%this function will flip the signal
%   Detailed explanation goes here

for ii=1:lenght_signal
    fliped_signal(ii)=signal_a(lenght_signal-ii+1);
end
end

