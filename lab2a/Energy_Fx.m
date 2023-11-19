% Energy_Fx.m

function energy = Energy_Fx(data, step)
    data_squared = data.^2;
    energy = (step / 2) * (data_squared(1) + data_squared(end) + 2 * sum(data_squared(2:end - 1)));
end
