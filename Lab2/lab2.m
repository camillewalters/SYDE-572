
clear;
close all;
clf;

%PART 2: 1D 
% plot the samples along the x axis
load("lab_2_data\lab2_1.mat");

y = zeros(length(a),1);
scatter(a,y);
title("Case A Samples");

figure();
scatter(b,y);
title("Case B Samples");


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
%%
% Model Estimation 2D Case
clf;
load("lab2_2");
% parametric estimation
parametric2d(al,bl,cl)
% non-parametric estimation
non_parametric2d(al,bl,cl)
%%

% Sequential Discriminant
load("lab2_3");
sequentialClassification(a,b);

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




