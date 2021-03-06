function parametric2d(a,b,c)

% Compute the sample mean and sample covariance of each class a, b, c
% Class A
mu_A = mean(a);
sigma_A = cov(a);

% Class B
mu_B = mean(b);
sigma_B = cov(b);

% Class C
mu_C = mean(c);
sigma_C = cov(c);

% Find and plot the ML classification boundaries.
% find min, max x-val for all classes
x_range = min([a(:,1); b(:,1); c(:,1)]) : 0.1 : max([a(:,1); b(:,1); c(:,1)]); 
y_range = min([a(:,2); b(:,2); c(:,2)]) : 0.1 : max([a(:,2); b(:,2); c(:,2)]);

[x,y] = meshgrid(x_range, y_range); % grid coordinates for plotting
xy = [x(:) y(:)]; % space 

% Calculate likelihood of each class
dist_a = mvnpdf(xy, mu_A, sigma_A);
dist_b = mvnpdf(xy, mu_B, sigma_B);
dist_c = mvnpdf(xy, mu_C, sigma_C);

d = [dist_a dist_b dist_c];

% Find max likelihood

[M,I] = max(d, [], 2); % I returns class of max likelihood
ml = reshape(I, size(x));

% Plot
figure(1)
hold on
scatter(a(:,1), a(:,2),'r');
scatter(b(:,1), b(:,2),'b');
scatter(c(:,1), c(:,2),'g');

contour(x,y,ml,'LineWidth',2);
title("2D Case: Parametric Estimation")
xlabel('X_1')
ylabel('X_2')
legend("Class A", "Class B", "Class C","ML Boundary")
hold off

end