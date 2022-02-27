function plot_sample (zA, muA, sigmaA, color)

    [VA,DA] = eig(sigmaA);

    hold on;
    x1A = zA(1,:);
    x2A = zA(2,:);
    scatter(x1A,x2A, color);
    plot_ellipse(muA(1),muA(2), atan(VA(2,1)/VA(1,1)), sqrt(DA(1,1)), sqrt(DA(2,2)), color)

end