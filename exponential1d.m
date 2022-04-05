function[ lambda ] = exponential1d(data)
    
    N = length(data);
    lambda = 0;

    for i = 1:N
        lambda = lambda + data(i);
    end
    
    lambda = N / lambda;
end