clear;
close all;
clf;

%GENERATE AND PLOT CLUSTERS FOR CASE 1
figure(1);
muA = [5 10]';
sigmaA = [8 0 ; 0 4];
A= generate_and_plot(muA, sigmaA,200, 'r');

hold on;

muB = [10 15]';
sigmaB = [8 0 ; 0 4];
B=generate_and_plot(muB, sigmaB, 200, 'b');

xlabel('X_1')
ylabel('X_2')
title("Case 1 Clusters")
legend("Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour", 'Location', 'best')

%create test sets for case 1
Atest = generate(muA, sigmaA, 200);
Atest = Atest';
Btest = generate(muB, sigmaB, 200);
Btest = Btest';


%GENERATE AND PLOT CLUSTERS FOR CASE 2
figure(2);
muC = [5 10]';
sigmaC = [8 4; 4 40];
C=generate_and_plot(muC, sigmaC, 100, 'r');

hold on;

muD = [15 10]';
sigmaD = [8 0; 0 8];
D=generate_and_plot(muD, sigmaD, 200, 'b');

hold on;

muE = [10 5]';
sigmaE = [10 -5; -5 20];
E=generate_and_plot(muE, sigmaE, 150, 'g');

xlabel('X_1')
ylabel('X_2')
title("Case 2 Clusters")
legend("Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour", 'Location', 'best')

%create test sets for case 1
Ctest = generate(muC, sigmaC, 100);
Ctest = Ctest';
Dtest = generate(muD, sigmaD, 200);
Dtest = Dtest';
Etest = generate(muE, sigmaE, 150);
Etest = Etest';


% CALL CLASSIFIERS
MED();
ged2();
map();
% map2();
% nn_knn();

figure(1);
title("Case 1 MED vs MAP vs GED Boundaries");
legend("Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour", ...
    "MED Boundary","","","GED Boundary","","","MAP Boundary",'Location', 'best')

figure(2);
title("Case 2 MED vs MAP vs GED Boundaries");
legend("Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviation Contour", ...
    "MED Boundary","","","GED Boundary","","","MAP Boundary",'Location', 'best')

