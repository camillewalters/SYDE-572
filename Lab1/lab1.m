clear;
close all;
clf;

figure(1);
muA = [5 10]';
sigmaA = [8 0 ; 0 4];
A= generate_and_plot(muA, sigmaA,200, 'r');
classA=A;

hold on;

muB = [10 15]';
sigmaB = [8 0 ; 0 4];
B=generate_and_plot(muB, sigmaB, 200, 'b');
classB=B;

xlabel('X_1')
ylabel('X_2')
title("Case 1 Clusters")
legend("Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour", 'Location', 'best')

figure(2);
muC = [5 10]';
sigmaC = [8 4; 4 40];
C=generate_and_plot(muC, sigmaC, 100, 'r');
classC=C;

hold on;

muD = [15 10]';
sigmaD = [8 0; 0 8];
D=generate_and_plot(muD, sigmaD, 200, 'b');
classD=D;

hold on;

muE = [10 5]';
sigmaE = [10 -5; -5 20];
E=generate_and_plot(muE, sigmaE, 150, 'g');
classE=E;

xlabel('X_1')
ylabel('X_2')
title("Case 2 Clusters")
legend("Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour", 'Location', 'best')

map();
ged2();

