clear;
close all;
clf;

figure(1);
muA = [5 10]';
sigmaA = [8 0 ; 0 4];
generate_and_plot(muA, sigmaA,200, 'r');

hold on;

muB = [10 15]';
sigmaB = [8 0 ; 0 4];
generate_and_plot(muB, sigmaB, 200, 'b');
hold on;

% % MED
resolution = 10;
x1min = -5;
x1max = 20;
x2min = 0;
x2max = 25;
x1 = linspace(x1min, x1max, resolution*(x1max - x1min));
x2 = linspace(x2min, x2max, resolution*(x2max - x2min));
[X1, X2] = meshgrid(x1, x2);

% plot MED
boundary1 = MED(muA, muB, X1, X2);
figure(1);
contour(X1, X2, boundary1, 'Color', 'black')
hold off;

xlabel('X_1')
ylabel('X_2')
title("Case 1 Clusters")
legend("Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour", 'Location', 'best');

% --------------------------------------------------------------------------------------------------------

figure(2);
muC = [5 10]';
sigmaC = [8 4; 4 40];
generate_and_plot(muC, sigmaC, 100, 'r')

hold on;

muD = [15 10]';
sigmaD = [8 0; 0 8];
generate_and_plot(muD, sigmaD, 200, 'b')

hold on;

muE = [10 5]';
sigmaE = [10 -5; -5 20];
generate_and_plot(muE, sigmaE, 150, 'g')

% plot MED
boundary2 = MED2(muC, muD, muE, X1, X2);
figure(2);
contour(X1, X2, boundary2, 'Color', 'black')
hold off;

xlabel('X_1')
ylabel('X_2')
title("Case 2 Clusters")
legend("Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour", 'Location', 'best')

