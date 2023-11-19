clc
clear all
close all

time_period = 2;
step_size_t = 0.0001;
t = 0:step_size_t:time_period;
tt = length(t);

omega_o = 2 * pi / time_period;

No_of_Fourier_coff = 20;
kk = -No_of_Fourier_coff:1:No_of_Fourier_coff;

% Initialize v_t with zeros
v_t = zeros(size(t));

% Triangular wave signal
for ii = 1:tt
    % Periodic triangular wave (ramp signal)
    v_t(ii) = mod(t(ii), 0.5) / 0.5;
end

subplot(2, 2, 1), plot(t, v_t)
xlabel("time (t)")
ylabel("v(t) - Periodic Triangular Wave")

% Calculate Fourier coefficients for the periodic triangular wave signal
for ii = 1:1:(2 * No_of_Fourier_coff + 1)
    temp1 = v_t .* exp(-1j * omega_o * kk(ii) .* t);
    [int_ans] = my_int_fun(temp1, step_size_t);
    a_k(ii) = (1 / time_period) * (int_ans);
end

subplot(2, 2, 2), stem(kk, abs(a_k))

pause

mid_term_of_fs = No_of_Fourier_coff + 1;
t2 = 0:step_size_t:3 * time_period;
for ii = 1:mid_term_of_fs
    if (ii == 1)
        harmonics(ii, :) = a_k(mid_term_of_fs) * ...
            exp(1j * omega_o * kk(mid_term_of_fs) .* t);
    else
        harmonics(ii, :) = (a_k(mid_term_of_fs - ii + 1) .* ...
            exp(1j * omega_o * (kk(mid_term_of_fs - ii + 1)) .* t)) ...
            + (a_k(mid_term_of_fs + ii - 1) .* ...
            exp(1j * omega_o * (kk(mid_term_of_fs + ii - 1)) .* t));
    end
end

subplot(2, 2, 3), plot(t, real(harmonics))

reconstructed_signal = sum(harmonics);
subplot(2, 2, 4), plot(t, real(reconstructed_signal), '--r')

figure, subplot(2, 1, 1), stem(kk, abs(a_k))

% Theoretical values of a_k for the periodic triangular wave
for ii = 1:1:(2 * No_of_Fourier_coff + 1)
    if (kk(ii) == 0)
        a_k_th(ii) = 1/12;
    elseif (mod(kk(ii), 2) == 0)
        a_k_th(ii) = 0;
    else
        a_k_th(ii) = (-1)^((kk(ii) - 1) / 2) * (2 / (pi^2 * (kk(ii) - 1)^2));
    end
end

subplot(2, 1, 2), stem(kk, abs(a_k_th))
