lab1();

% Class A
nA = 200;
muA = [5;10];
sigmaA = [8 0; 0 4];
classA = A';
meanA = mean(classA);

% Class B
nB = 200;
muB = [10;15];
sigmaB = [8 0; 0 4];
classB = B';
meanB = mean(classB);

% Class C
nC = 100;
muC = [5;10];
sigmaC = [8 4; 4 40];
classC = C'
meanC = mean(classC);


% Class D
nD = 200;
muD = [15;10];
sigmaD = [8 0; 0 8];
classD = D'
meanD = mean(classD);

% Class E
nE = 150;
muE = [10;5];
sigmaE = [10 -5; -5 20];
classE = E'
meanE = mean(classE);

% For Gen Euc Metric, need to find e-vals, e-vecs, apply transform, then
% classify based on MICD classifier

%% Calculate GED for Case 1
% Initialize required vars
x_1 = min([classA(:,1); classB(:,1)]) : 0.1 : max([classA(:,1); classB(:,1)]); % find min, max x-val between both classes
y_1 = min([classA(:,2); classB(:,2)]) : 0.1 : max([classA(:,2); classB(:,2)]);

[X_GED_1,Y_GED_1] = meshgrid(x_1, y_1); % grid coordinates for plotting
XY = [X_GED_1(:) Y_GED_1(:)] % space for MICD


% Class A
% Compute eigenvectors
[evec1a, eval1a] = eig(sigmaA);

% Compute orthonomal whitening transform
lambda = diag(diag(eval1a).^-(1/2));
W_1A = lambda*transpose(evec1a);

% Compute new mean
m_primeA = W*muA;

% Class B
% Compute eigenvectors
[evec1b, eval1b] = eig(sigmaB);

% Compute orthonomal whitening transform
lambda = diag(diag(eval1b).^-(1/2));
W_1B = lambda*transpose(evec1b);

% Compute new mean
m_primeB = W*muB;

% Find MICD boundary
dist_a = sqrt(sum(((XY - repmat(muA', [length(XY) 1]))*W').^2, 2)); % Calculate distance between point and sample mean
dist_b = sqrt(sum(((XY - repmat(muB', [length(XY) 1]))*W').^2, 2));

d = [dist_a dist_b];

[M,I] = min(d, [], 2); % I returns class of min distance
micd1 = reshape(I, size(X_GED_1));

figure(1)
contour(X_GED_1,Y_GED_1,micd1,'m')
hold off

%% Calculate GED for Case 2
% Initialize required vars
x_2 = min([classC(:,1); classD(:,1); classE(:,1)]) : 0.1 : max([classC(:,1); classD(:,1); classE(:,1)]); % find min, max x-val between both classes
y_2 = min([classC(:,2); classD(:,2); classE(:,2)]) : 0.1 : max([classC(:,2); classD(:,2); classE(:,2)]);

[X_GED_2,Y_GED_2] = meshgrid(x_2, y_2); % grid coordinates for plotting
XY_2 = [X_GED_2(:) Y_GED_2(:)]; % space for MICD


% Class C
% Compute eigenvectors
[evec2c, eval2c] = eig(sigmaC);

% Compute orthonomal whitening transform
lambda = diag(diag(eval2c).^-(1/2));
W_2C = lambda*transpose(evec2c); 

% Compute new mean
m_primeC = W_2*muC;

% Class D
% Compute eigenvectors
[evec2d, eval2d] = eig(sigmaD);

% Compute orthonomal whitening transform
lambda = diag(diag(eval2d).^-(1/2));
W_2D = lambda*transpose(evec2d);

% Compute new mean
m_primeD = W_2*muD;

% Class E
% Compute eigenvectors
[evec2e, eval2e] = eig(sigmaE);

% Compute orthonomal whitening transform
lambda = diag(diag(eval2e).^-(1/2));
W_2E = lambda*transpose(evec2e)

% Compute new mean
m_primeE = W_2*muE;

% Find MICD boundary
dist_c = sqrt(sum(((XY_2 - repmat(muC', [length(XY_2) 1]))*W_2C').^2, 2)); % Calculate distance between point and sample mean
dist_d = sqrt(sum(((XY_2 - repmat(muD', [length(XY_2) 1]))*W_2D').^2, 2));
dist_e = sqrt(sum(((XY_2 - repmat(muE', [length(XY_2) 1]))*W_2E').^2, 2));

d_2 = [dist_c dist_d dist_e]; % I think something is wrong here

[M_2,I_2] = min(d_2, [], 2); % I returns class of min distance
micd2 = reshape(I_2, size(X_GED_2));

figure(2)
contour(X_GED_2,Y_GED_2,micd2,'m')
hold off

%% Part 4 - GED
% Case 1

% Case 2
