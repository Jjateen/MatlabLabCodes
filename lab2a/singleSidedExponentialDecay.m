function singleSidedExponentialDecay()
    clc
    clear all
    close all
    stepsize_t = 1;
    t = -50 : 1 : 50;
    len_t = length(t);
    v_t = zeros(1, len_t);

    for i = 1:1:len_t
        if (t(i) >= 0)
            v_t(i) = exp(-t(i));
        else
            v_t(i) = exp(-t(i));
        end
    end

    stem(t, v_t)
    xlabel("t")
    ylabel("Single-Sided Exponential Decay")
end
