function [lambda] = exponential1d (data)
    N = length(data);
    lambda = 0;
    for n = 1:N
        lambda = lambda + data(n);
    end
    lambda = N/lambda;
end