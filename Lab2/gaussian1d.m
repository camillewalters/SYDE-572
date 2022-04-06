function [mu, sigma] = gaussian1d (data)
    N = length(data);
    mu = sum(data)/N;
    sigma = sqrt(sum((data - mu).^2) / N);
end