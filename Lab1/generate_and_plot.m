function zA = generate_and_plot(muA,sigmaA,N, color)
[VA,DA] = eig(sigmaA);

WAinv = inv((VA)')*DA^0.5;

zA = zeros(2,N);

for i =1:N
    plus = randn(2,1);
    plus = WAinv*plus;
    zA(:,i) = muA + plus;
end

hold on;
x1A = zA(1,:);
x2A = zA(2,:);
scatter(x1A,x2A, color);
plot_ellipse(muA(1),muA(2), atan(VA(2,1)/VA(1,1)), sqrt(DA(1,1)), sqrt(DA(2,2)), color)