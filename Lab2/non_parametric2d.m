function non_parametric2d(a,b,c)
% From parzen.m: 
% [p,x,y] = parzen( data, res, win )    
%
%  data - two-column matrix of (x,y) points
%         (third row/col optional point frequency)
%  res  - resolution (step size)
%         optionally [res lowx lowy highx highy]
%  win  - optional, gives form of window 
%          if a scalar - radius of square window
%          if a vector - radially symmetric window
%          if a matrix - actual 2D window shape
%
%  x    - locations along x-axis
%  y    - locations along y-axis
%  p    - estimated 2D PDF

% set up
x_min = min([a(:,1); b(:,1); c(:,1)]) - 10;
x_max = max([a(:,1); b(:,1); c(:,1)]) + 10;
y_min = min([a(:,2); b(:,2); c(:,2)]) - 10;
y_max = max([a(:,2); b(:,2); c(:,2)]) + 10;
inc = 0.5;
res = [inc x_min y_min x_max y_max];

% Use a Gaussian Parzen window (σ2 = 400) on the learning data to estimate a PDF for each cluster. 
[pdf_a,x_a,y_a] = parzen(a, res, gausswin(1000, 24.975));
[pdf_b,x_b,yb] = parzen(b, res, gausswin(1000, 24.975));
[pdf_c,x_c,y_c] = parzen(c, res, gausswin(1000, 24.975));

% Apply an ML classifier to the estimated PDFs 
probA = reshape(pdf_a,[],1);
probB = reshape(pdf_b,[],1);
probC = reshape(pdf_c,[],1);

d = [probA probB probC];
[M,I] = max(d, [], 2); % I returns class of max likelihood
ml = reshape(I, size(pdf_a));

% plot the classification boundaries together with the cluster data.
figure(2);
contour(x_a, y_a', ml);
hold on;
scatter(a(:,1), a(:,2));
scatter(b(:,1), b(:,2));
scatter(c(:,1), c(:,2));
title("2D Case: Non-Parametric Estimation")
xlabel('X_1')
ylabel('X_2')
legend("Class A", "Class B", "Class C")
hold off;

end