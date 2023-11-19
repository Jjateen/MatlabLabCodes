% main_script.m

% Sample data
data = [1, 2, 3, 4, 5];

% Step size
step = 0.1;

% Call the Energy_Fx function
energy = Energy_Fx(data, step);

% Display the result
disp(['Energy of the sequence: ', num2str(energy)]);
