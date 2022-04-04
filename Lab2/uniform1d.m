function [a,b] = uniform1d (data)

    figure();

    a = min(data);
    b = max(data);

    xmin = a - 2;
    xmax = b + 2;

    syms x
    
    f = piecewise(x<a,0, x>b,0, x>a,(1/(b-a)));

    hold on;
    xlim([xmin, xmax])

    y = zeros(length(data),1);
    scatter(data,y);

    fplot(f,[xmin, xmax]);


end

function val = gauss(x,mean,h)
    if abs(x-mean) > 3*h
        val = 0;
    else
        val = (1/h)*(1/sqrt(2*pi)) * exp((-1/2)*((x-mean)/h)^2);
    end
end