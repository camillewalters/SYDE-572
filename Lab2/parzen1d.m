function f = parzen1d (data, h, res)

    figure();

    xmin = min(data) - 2;
    xmax = max(data) + 2;

    points = floor((xmax-xmin)/res);
    
    f = zeros(points,1);

    for j = 1:points
        x = xmin + j*res;
        for i = 1:length(data)
            mean = data(i);
            val = gauss(x,mean,h);
            f(j,1) = f(j,1) + val;
        end
    end

    f = f/length(data);

    hold on;
    xlim([xmin, xmax])

    y = zeros(length(data),1);
    scatter(data,y);

    x_space = linspace(xmin,xmax,points);
    plot(x_space,f);

end

function val = gauss(x,mean,h)
    if abs(x-mean) > 3*h
        val = 0;
    else
        val = (1/h)*(1/sqrt(2*pi)) * exp((-1/2)*((x-mean)/h)^2);
    end
end