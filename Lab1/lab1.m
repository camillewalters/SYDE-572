clear;
close all;
clf;

figure(1);
muA = [5 10]';
sigmaA = [8 0 ; 0 4];
Avalues = generate_and_plot(muA, sigmaA,200, 'r');

hold on;

muB = [10 15]';
sigmaB = [8 0 ; 0 4];
Bvalues = generate_and_plot(muB, sigmaB, 200, 'b');

xlabel('X_1')
ylabel('X_2')
title("Case 1 Clusters")
legend("Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour", 'Location', 'best')

% figure(2);
muC = [5 10]';
sigmaC = [8 4; 4 40];
% Cvlaues = generate_and_plot(muC, sigmaC, 100, 'r');

hold on;

muD = [15 10]';
sigmaD = [8 0; 0 8];
% Dvalues = generate_and_plot(muD, sigmaD, 200, 'b');

hold on;

muE = [10 5]';
sigmaE = [10 -5; -5 20];
% Evalues = generate_and_plot(muE, sigmaE, 150, 'g');

% xlabel('X_1')
% ylabel('X_2')
% title("Case 2 Clusters")
% legend("Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour", 'Location', 'best')

