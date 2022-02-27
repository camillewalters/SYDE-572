clear;
close all;
clf;

% % CASE 1
muA = [5 10]';
sigmaA = [8 0 ; 0 4];
Avalues = generate(muA, sigmaA,200);

muB = [10 15]';
sigmaB = [8 0 ; 0 4];
Bvalues = generate(muB, sigmaB, 200);


figure();
hold on;
knnplot(1,true,'k',Avalues,Bvalues);
plot_sample(Avalues, muA,sigmaA,'r');
plot_sample(Bvalues,muB,sigmaB,'b');
title("Case 1 NN Boundary")
legend("NN Boundary","","Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
k = 5;
knnplot(k,true,'k',Avalues,Bvalues);
plot_sample(Avalues, muA,sigmaA,'r');
plot_sample(Bvalues,muB,sigmaB,'b');
title("Case 1 KNN Boundary")
legend("KNN Boundary, k=5","","Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
knnplot(1,false,'m',Avalues,Bvalues);
k = 5;
knnplot(k,false,'c',Avalues,Bvalues);
plot_sample(Avalues, muA,sigmaA,'r');
plot_sample(Bvalues,muB,sigmaB,'b');
title("Case 1 NN vs KNN Boundary")
legend("NN","","KNN, k=5","","Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


% TESTING FOR CASE 1
%create the test data: num_tests sets of each of A, B
num_tests = 1;
A_test_size = 200;
Atests = zeros(num_tests,2,A_test_size);

B_test_size = 200;
Btests = zeros(num_tests,2,B_test_size);

for i = 1:num_tests
    figure();
    Atests(i,:,:) = generate(muA, sigmaA,A_test_size);
    Btests(i,:,:) = generate(muB, sigmaB,B_test_size);
end

%initialize vectors
Aresults_nn = zeros(num_tests,A_test_size);
Aresults_knn = zeros(num_tests,A_test_size);
Bresults_nn = zeros(num_tests,B_test_size);
Bresults_knn = zeros(num_tests,B_test_size);
confusion_nn_1 = zeros(num_tests,2,2);
confusion_knn_1 = zeros(num_tests,2,2);
error_nn_1 = zeros(num_tests,1);
error_knn_1 = zeros(num_tests,1);

for i = 1:num_tests % for each test set
    %determine the assigned class for each test point, for each method
    %populate confusion matrix 
    for j = 1:A_test_size
        Aresults_nn(i,j) = knn2class(Avalues,Bvalues,Atests(i,:,j),1);
        if (Aresults_nn(i,j) == 1)
            confusion_nn_1(i,1,1) = confusion_nn_1(i,1,1) + 1;
        elseif (Aresults_nn(i,j) == 2)
            confusion_nn_1(i,1,2) = confusion_nn_1(i,1,2) + 1;
        end

        Aresults_knn(i,j) = knn2class(Avalues,Bvalues,Atests(i,:,j),5);
        if (Aresults_knn(i,j) == 1)
            confusion_knn_1(i,1,1) = confusion_knn_1(i,1,1) + 1;
        elseif (Aresults_knn(i,j) == 2)
            confusion_knn_1(i,1,2) = confusion_knn_1(i,1,2) + 1;
        end
    end
    for j = 1:B_test_size
        Bresults_nn(i,j) = knn2class(Avalues,Bvalues,Btests(i,:,j),1);
        if (Bresults_nn(i,j) == 2)
            confusion_nn_1(i,2,2) = confusion_nn_1(i,2,2) + 1;
        elseif (Bresults_nn(i,j) == 1)
            confusion_nn_1(i,2,1) = confusion_nn_1(i,2,1) + 1;
        end

        Bresults_knn(i,j) = knn2class(Avalues,Bvalues,Btests(i,:,j),5);
        if (Bresults_knn(i,j) == 2)
            confusion_knn_1(i,2,2) = confusion_knn_1(i,2,2) + 1;
        elseif (Bresults_knn(i,j) == 1)
            confusion_knn_1(i,2,1) = confusion_knn_1(i,2,1) + 1;
        end
    end

    %calculate overall error
    correct_nn_1 = trace(squeeze(confusion_nn_1(i,:,:)));
    sum_nn_1 = sum(squeeze(confusion_nn_1(i,:)));
    error_nn_1(i) = correct_nn_1 / sum_nn_1; 
    avg_error_nn_1 = mean(error_nn_1);

    correct_knn_1 = trace(squeeze(confusion_knn_1(i,:,:)))
    sum_knn_1 = sum(squeeze(confusion_knn_1(i,:)))
    error_knn_1(i) = correct_knn_1 / sum_knn_1; 
    avg_error_knn_1 = mean(error_knn_1);

end

    


% CASE 2

muC = [5 10]';
sigmaC = [8 4; 4 40];
Cvalues = generate(muC, sigmaC, 100);

muD = [15 10]';
sigmaD = [8 0; 0 8];
Dvalues = generate(muD, sigmaD, 200);

muE = [10 5]';
sigmaE = [10 -5; -5 20];
Evalues = generate(muE, sigmaE, 150);


figure();
hold on;
knnplot(1,true,'k',Cvalues,Dvalues,Evalues);
plot_sample(Cvalues, muC,sigmaC,'r');
plot_sample(Dvalues,muD,sigmaD,'b');
plot_sample(Evalues,muE,sigmaB,'g');
title("Case 2 NN Boundary")
legend("NN Boundary","","","Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
k=5;
knnplot(k,true,'k',Cvalues,Dvalues,Evalues);
plot_sample(Cvalues, muC,sigmaC,'r');
plot_sample(Dvalues,muD,sigmaD,'b');
plot_sample(Evalues,muE,sigmaE,'g');
title("Case 2 KNN Boundary")
legend("KNN Boundary, k = 5","","","Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
knnplot(1,false,'m',Cvalues,Dvalues,Evalues);
k = 5;
knnplot(k,false,'c',Cvalues,Dvalues,Evalues);
plot_sample(Cvalues, muC,sigmaC,'r');
plot_sample(Dvalues,muD,sigmaD,'b');
plot_sample(Evalues,muE,sigmaE,'g');
title("Case 2 NN vs KNN Boundary")
legend("NN","","","KNN, k=5","","","Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')



% TESTING FOR CASE 2
%create the test data: num_tests sets of each of C, D, E
num_tests = 1;

C_test_size = 100;
Ctests = zeros(num_tests,2,C_test_size);

D_test_size = 200;
Dtests = zeros(num_tests,2,D_test_size);

E_test_size = 150;
Etests = zeros(num_tests,2,E_test_size);

for i = 1:num_tests
    figure();
    Ctests(i,:,:) = generate(muC, sigmaC,C_test_size);
    Dtests(i,:,:) = generate(muD, sigmaD,D_test_size);
    Etests(i,:,:) = generate(muE, sigmaE,E_test_size);
end

%initialize vectors
Cresults_nn = zeros(num_tests,C_test_size);
Cresults_knn = zeros(num_tests,C_test_size);
Dresults_nn = zeros(num_tests,D_test_size);
Dresults_knn = zeros(num_tests,D_test_size);
Eresults_nn = zeros(num_tests,E_test_size);
Eresults_knn = zeros(num_tests,E_test_size);

confusion_nn_2 = zeros(num_tests,3,3);
confusion_knn_2 = zeros(num_tests,3,3);
error_nn_2 = zeros(num_tests,1);
error_knn_2 = zeros(num_tests,1);

for i = 1:num_tests % for each test set
    %determine the assigned class for each test point, for each method
    %populate confusion matrix 
    for j = 1:C_test_size
        Cresults_nn(i,j) = knn3class(Cvalues,Dvalues,Evalues,Ctests(i,:,j),1);
        if (Cresults_nn(i,j) == 1)
            confusion_nn_2(i,1,1) = confusion_nn_2(i,1,1) + 1;
        elseif (Cresults_nn(i,j) == 2)
            confusion_nn_2(i,1,2) = confusion_nn_2(i,1,2) + 1;
        elseif (Cresults_nn(i,j) == 3)
            confusion_nn_2(i,1,3) = confusion_nn_2(i,1,3) + 1;
        end

        Cresults_knn(i,j) = knn3class(Cvalues,Dvalues,Evalues,Ctests(i,:,j),5);
        if (Cresults_knn(i,j) == 1)
            confusion_knn_2(i,1,1) = confusion_knn_2(i,1,1) + 1;
        elseif (Cresults_knn(i,j) == 2)
            confusion_knn_2(i,1,2) = confusion_knn_2(i,1,2) + 1;
        elseif (Cresults_knn(i,j) == 3)
            confusion_knn_2(i,1,3) = confusion_knn_2(i,1,3) + 1;
        end
    end

    for j = 1:D_test_size
        Dresults_nn(i,j) = knn3class(Cvalues,Dvalues,Evalues,Dtests(i,:,j),1);
        if (Dresults_nn(i,j) == 2)
            confusion_nn_2(i,2,2) = confusion_nn_2(i,2,2) + 1;
        elseif (Dresults_nn(i,j) == 1)
            confusion_nn_2(i,2,1) = confusion_nn_2(i,2,1) + 1;
        elseif (Dresults_nn(i,j) == 3)
            confusion_nn_2(i,2,3) = confusion_nn_2(i,2,3) + 1;
        end

        Dresults_knn(i,j) = knn3class(Cvalues,Dvalues,Evalues,Dtests(i,:,j),5);
        if (Dresults_knn(i,j) == 2)
            confusion_knn_2(i,2,2) = confusion_knn_2(i,2,2) + 1;
        elseif (Dresults_knn(i,j) == 1)
            confusion_knn_2(i,2,1) = confusion_knn_2(i,2,1) + 1;
        elseif (Dresults_knn(i,j) == 3)
            confusion_knn_2(i,2,3) = confusion_knn_2(i,2,3) + 1;
        end
    end

    for j = 1:E_test_size
        Eresults_nn(i,j) = knn3class(Cvalues,Dvalues,Evalues,Etests(i,:,j),1);
        if (Eresults_nn(i,j) == 3)
            confusion_nn_2(i,3,3) = confusion_nn_2(i,3,3) + 1;
        elseif (Eresults_nn(i,j) == 1)
            confusion_nn_2(i,3,1) = confusion_nn_2(i,3,1) + 1;
        elseif (Eresults_nn(i,j) == 2)
            confusion_nn_2(i,3,2) = confusion_nn_2(i,3,2) + 1;
        end

        Eresults_knn(i,j) = knn3class(Cvalues,Dvalues,Evalues,Etests(i,:,j),5);
        if (Eresults_knn(i,j) == 3)
            confusion_knn_2(i,3,3) = confusion_knn_2(i,3,3) + 1;
        elseif (Eresults_knn(i,j) == 1)
            confusion_knn_2(i,3,1) = confusion_knn_2(i,3,1) + 1;
        elseif (Eresults_knn(i,j) == 2)
            confusion_knn_2(i,3,2) = confusion_knn_2(i,3,2) + 1;
        end
    end

    %calculate overall error
    correct_nn_2 = trace(squeeze(confusion_nn_2(i,:,:)));
    sum_nn_2 = sum(squeeze(confusion_nn_2(i,:)));
    error_nn_2(i) = correct_nn_2 / sum_nn_2; 
    avg_error_nn_2 = mean(error_nn_2);

    correct_knn_2 = trace(squeeze(confusion_knn_2(i,:,:)))
    sum_knn_2 = sum(squeeze(confusion_knn_2(i,:)))
    error_knn_2(i) = correct_knn_2 / sum_knn_2; 
    avg_error_knn_2 = mean(error_knn_2);

end