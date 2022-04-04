function [mu, sigma] = gaussian1d (data)
      
    N = length(data);
    
    mu = sum(data) / N;
    
    var_e = sum((data - mu).^2) / N;
    
    sigma = sqrt(var_e);
end