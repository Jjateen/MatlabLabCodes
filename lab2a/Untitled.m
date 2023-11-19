% Parameters
N = 100;             % Number of samples
f_cosine = 0.1;      % Frequency of the discrete cosine wave
f_square = 0.2;      % Frequency of the discrete square wave
f_pulse = 0.05;      % Frequency of the discrete rectangular pulse
A_cosine = 1;        % Amplitude of the discrete cosine wave
A_square = 1;        % Amplitude of the discrete square wave
A_pulse = 1;         % Amplitude of the discrete rectangular pulse
n = 0:N-1;           % Discrete time vector

% Generate a discrete cosine wave
x_cosine = A_cosine * cos(2 * pi * f_cosine * n);

% Generate a discrete square wave (manually created)
x_square = A_square * sign(sin(2 * pi * f_square * n));

% Generate a discrete rectangular pulse
T = 20; % Width of the pulse in samples
x_pulse = A_pulse * double((n >= N/2 - T/2) & (n < N/2 + T/2));

% Compute the discrete Fourier coefficients for the cosine wave
X_cosine = fft(x_cosine);
X_cosine = X_cosine / N; % Normalize by the number of samples

% Compute the discrete Fourier series for the square wave
numHarmonics = 10;  % Number of harmonics to include in the series
x_fourier_square = zeros(1, N);  % Initialize the discrete Fourier series for the square wave

for k = 1:numHarmonics
    harmonic = (4 * A_square / (2 * k - 1)) * sin(2 * pi * (2 * k - 1) * f_square * n);
    x_fourier_square = x_fourier_square + harmonic;
end

% Compute the discrete Fourier series for the rectangular pulse
x_fourier_pulse = zeros(1, N);
for k = 1:numHarmonics
    harmonic = (A_pulse * sin(2 * pi * f_pulse * k * n)) ./ (pi * k);
    x_fourier_pulse = x_fourier_pulse + harmonic;
end

% Plot the discrete cosine wave and its discrete Fourier coefficients
subplot(2, 3, 1);
stem(n, x_cosine);
xlabel('Sample Number (n)');
ylabel('Amplitude');
title('Discrete Cosine Wave');

subplot(2, 3, 2);
stem(abs(X_cosine));
xlabel('Frequency Bin (k)');
ylabel('Magnitude');
title('Discrete Fourier Coefficients (Cosine)');

% Plot the discrete square wave and its discrete Fourier series
subplot(2, 3, 4);
stem(n, x_square);
xlabel('Sample Number (n)');
ylabel('Amplitude');
title('Discrete Square Wave');

subplot(2, 3, 5);
stem(n, x_fourier_square);
xlabel('Sample Number (n)');
ylabel('Amplitude');
title('Discrete Fourier Series (Square Wave)');

% Plot the discrete rectangular pulse and its discrete Fourier series
subplot(2, 3, 3);
stem(n, x_pulse);
xlabel('Sample Number (n)');
ylabel('Amplitude');
title('Discrete Rectangular Pulse');

subplot(2, 3, 6);
stem(n, x_fourier_pulse);
xlabel('Sample Number (n)');
ylabel('Amplitude');
title('Discrete Fourier Series (Rectangular Pulse)');
