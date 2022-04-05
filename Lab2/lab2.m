clear;
close all;
clf;

%PART 2: 1D 
% plot the samples along the x axis
load("lab_2_data/lab2_1.mat");

y = zeros(length(a),1);
scatter(a,y);
title("Case A Samples");

figure();
scatter(b,y);
title("Case B Samples");

x_a = 0:0.01:(max(a)+2);
x_b = 0:0.01:(max(b)+2);
mu_a = 5;
sd_a = 1;
lambda_b = 1;

%PART 2.1: GAUSSSIAN

% case a 
[gauss_mu_a, gauss_sd_a] = gaussian1d(a);
p_a_actual = normpdf(x_a, mu_a, sd_a);
p_a_est = normpdf(x_a, gauss_mu_a, gauss_sd_a);

figure;
hold on;
scatter(a,y);
plot(x_a, p_a_est);
plot(x_a, p_a_actual);
xlabel('x'); 
ylabel('p(x)');
title("Case A: Gaussian Parametrics Estimation");
legend("Sample Data","Estimated PDF","True Origin PDF");
hold off;

% case b 
[gauss_mu_b, gauss_sd_b] = gaussian1d(b);
p_b_actual = exppdf(x_b,1/lambda_b);
p_b_est = normpdf(x_b, gauss_mu_b, gauss_sd_b);

figure;
hold on;
scatter(b,y);
plot(x_b, p_b_est);
plot(x_b, p_b_actual);
xlabel('x'); 
ylabel('p(x)');
title("Case B: Gaussian Parametrics Estimation");
legend("Sample Data","Estimated PDF","True Origin PDF");
hold off;

%PART 2.2: EXPONENTIAL  

% case a 
[lambda_a_est] = exponential1d(a);
p_a_actual = normpdf(x_a, mu_a, sd_a);
p_a_est = exppdf(x_a, 1/lambda_a_est);

figure;
hold on;
scatter(a,y);
plot(x_a, p_a_est);
plot(x_a, p_a_actual);
xlabel('x'); 
ylabel('p(x)');
title("Case A: Expontential Parametrics Estimation");
legend("Sample Data","Estimated PDF","True Origin PDF");
hold off;


% case b 
[lambda_b_est] = exponential1d(b);
p_b_actual = exppdf(x_b,1/lambda_b);
p_b_est = exppdf(x_b, 1/lambda_b_est);

figure;
hold on;
scatter(b,y);
plot(x_b, p_b_est);
plot(x_b, p_b_actual);
xlabel('x'); 
ylabel('p(x)');
title("Case B: Expontential Parametrics Estimation");
legend("Sample Data","Estimated PDF","True Origin PDF");
hold off;


%PART 2.3: UNIFORM
[a_a, b_a] = uniform1d(a);
title("Case A: Uniform Parametrics Estimation");
plota_true(5,1)
legend("Sample Data","Estimated PDF","True Origin PDF");

[a_b, b_b] = uniform1d(b);
title("Case B: Uniform Parametrics Estimation");
plotb_true(1)
legend("Sample Data","Estimated PDF","True Origin PDF");


%PART 2.4: NON PARAMETRIC
%case a, h = 0.1
fa01 = parzen1d(a,0.1,0.01);
title("Case A: Parzen Window Estimation, h = 0.1");
plota_true(5,1)
legend("Sample Data","Estimated PDF","True Origin PDF");

%case a, h = 0.4
fa04 = parzen1d(a,0.4,0.01);
title("Case A: Parzen Window Estimation, h = 0.4");
plota_true(5,1)
legend("Sample Data","Estimated PDF","True Origin PDF");

%case b, h = 0.1
fb01 = parzen1d(b,0.1,0.01);
title("Case B: Parzen Window Estimation, h = 0.1");
plotb_true(1);
legend("Sample Data","Estimated PDF","True Origin PDF");

%case b, h = 0.4
fb04 = parzen1d(b,0.4,0.01);
title("Case B: Parzen Window Estimation, h = 0.4");
plotb_true(1);
legend("Sample Data","Estimated PDF","True Origin PDF");







%helper functions for 1d case
function plota_true(mu, sd)
    syms x
    f = (1/sd)*(1/sqrt(2*pi)) * exp((-1/2)*((x-mu)/sd)^2);
    fplot(f);
end

function plotb_true(lam)
    syms x
    f = piecewise(x<0,0,x>=0,lam*exp(-lam*x));
    fplot(f);
end

