% % CASE 1
figure();
hold on;
knnplot(1,true,'k',A,B);
plot_sample(A, muA,sigmaA,'r');
plot_sample(B,muB,sigmaB,'b');
title("Case 1 NN Boundary")
legend("NN Boundary","","Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
k = 5;
knnplot(k,true,'k',A,B);
plot_sample(A, muA,sigmaA,'r');
plot_sample(B,muB,sigmaB,'b');
title("Case 1 KNN Boundary")
legend("KNN Boundary, k=5","","Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
knnplot(1,false,'m',A,B);
k = 5;
knnplot(k,false,'c',A,B);
plot_sample(A, muA,sigmaA,'r');
plot_sample(B,muB,sigmaB,'b');
title("Case 1 NN vs KNN Boundary")
legend("NN","","KNN, k=5","","Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


% TESTING FOR CASE 1

%initialize vectors
Aresults_nn = zeros(1,length(Atest));
Aresults_knn = zeros(1,length(Atest));
Bresults_nn = zeros(1,length(Btest));
Bresults_knn = zeros(1,length(Btest));
confusion_NN_1 = zeros(2,2);
confusion_KNN_1 = zeros(2,2);

%determine the assigned class for each test point, for each method
%populate confusion matrix 
for j = 1:length(Atest)
    Aresults_nn(j) = knn2class(A,B,Atest(j,:),1);
    if (Aresults_nn(j) == 1)
        confusion_NN_1(1,1) = confusion_NN_1(1,1) + 1;
    elseif (Aresults_nn(j) == 2)
        confusion_NN_1(1,2) = confusion_NN_1(1,2) + 1;
    end

    Aresults_knn(j) = knn2class(A,B,Atest(j,:),5);
    if (Aresults_knn(j) == 1)
        confusion_KNN_1(1,1) = confusion_KNN_1(1,1) + 1;
    elseif (Aresults_knn(j) == 2)
        confusion_KNN_1(1,2) = confusion_KNN_1(1,2) + 1;
    end
end
for j = 1:length(Btest)
    Bresults_nn(j) = knn2class(A,B,Btest(j,:),1);
    if (Bresults_nn(j) == 2)
        confusion_NN_1(2,2) = confusion_NN_1(2,2) + 1;
    elseif (Bresults_nn(j) == 1)
        confusion_NN_1(2,1) = confusion_NN_1(2,1) + 1;
    end

    Bresults_knn(j) = knn2class(A,B,Btest(j,:),5);
    if (Bresults_knn(j) == 2)
        confusion_KNN_1(2,2) = confusion_KNN_1(2,2) + 1;
    elseif (Bresults_knn(j) == 1)
        confusion_KNN_1(2,1) = confusion_KNN_1(2,1) + 1;
    end
end

%calculate overall error
correct_nn_1 = trace(confusion_NN_1);
sum_nn_1 = sum(confusion_NN_1,'all');
error_NN_1 = 1 - correct_nn_1 / sum_nn_1; 

correct_knn_1 = trace(confusion_KNN_1);
sum_knn_1 = sum(confusion_KNN_1,'all');
error_KNN_1 = 1 - correct_knn_1 / sum_knn_1; 
    


% CASE 2
figure();
hold on;
knnplot(1,true,'k',C,D,E);
plot_sample(C, muC,sigmaC,'r');
plot_sample(D,muD,sigmaD,'b');
plot_sample(E,muE,sigmaB,'g');
title("Case 2 NN Boundary")
legend("NN Boundary","","","Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
k=5;
knnplot(k,true,'k',C,D,E);
plot_sample(C, muC,sigmaC,'r');
plot_sample(D,muD,sigmaD,'b');
plot_sample(E,muE,sigmaE,'g');
title("Case 2 KNN Boundary")
legend("KNN Boundary, k = 5","","","Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')


figure();
hold on;
knnplot(1,false,'m',C,D,E);
k = 5;
knnplot(k,false,'c',C,D,E);
plot_sample(C, muC,sigmaC,'r');
plot_sample(D,muD,sigmaD,'b');
plot_sample(E,muE,sigmaE,'g');
title("Case 2 NN vs KNN Boundary")
legend("NN","","","KNN, k=5","","","Class C", "Class C Standard Deviation Contour", "Class D", "Class D Standard Deviation Contour", "Class E", "Class E Standard Deviations Contour",'Location', 'best')
xlabel('X_1')
ylabel('X_2')



% TESTING FOR CASE 2
%create the test data: num_tests sets of each of C, D, E
%initialize vectors
Cresults_nn = zeros(1,length(Ctest));
Cresults_knn = zeros(1,length(Ctest));
Dresults_nn = zeros(1,length(Dtest));
Dresults_knn = zeros(1,length(Dtest));
Eresults_nn = zeros(1,length(Etest));
Eresults_knn = zeros(1,length(Etest));

confusion_NN_2 = zeros(3,3);
confusion_KNN_2 = zeros(3,3);

%determine the assigned class for each test point, for each method
%populate confusion matrix 
for j = 1:length(Ctest)
    Cresults_nn(j) = knn3class(C,D,E,Ctest(j,:),1);
    if (Cresults_nn(j) == 1)
        confusion_NN_2(1,1) = confusion_NN_2(1,1) + 1;
    elseif (Cresults_nn(j) == 2)
        confusion_NN_2(1,2) = confusion_NN_2(1,2) + 1;
    elseif (Cresults_nn(j) == 3)
        confusion_NN_2(1,3) = confusion_NN_2(1,3) + 1;
    end

    Cresults_knn(j) = knn3class(C,D,E,Ctest(j,:),5);
    if (Cresults_knn(j) == 1)
        confusion_KNN_2(1,1) = confusion_KNN_2(1,1) + 1;
    elseif (Cresults_knn(j) == 2)
        confusion_KNN_2(1,2) = confusion_KNN_2(1,2) + 1;
    elseif (Cresults_knn(j) == 3)
        confusion_KNN_2(1,3) = confusion_KNN_2(1,3) + 1;
    end
end

for j = 1:length(Dtest)
    Dresults_nn(j) = knn3class(C,D,E,Dtest(j,:),1);
    if (Dresults_nn(j) == 1)
        confusion_NN_2(2,1) = confusion_NN_2(2,1) + 1;
    elseif (Dresults_nn(j) == 2)
        confusion_NN_2(2,2) = confusion_NN_2(2,2) + 1;
    elseif (Dresults_nn(j) == 3)
        confusion_NN_2(2,3) = confusion_NN_2(2,3) + 1;
    end

    Dresults_knn(j) = knn3class(C,D,E,Dtest(j,:),5);
    if (Dresults_knn(j) == 1)
        confusion_KNN_2(2,1) = confusion_KNN_2(2,1) + 1;
    elseif (Dresults_knn(j) == 2)
        confusion_KNN_2(2,2) = confusion_KNN_2(2,2) + 1;
    elseif (Dresults_knn(j) == 3)
        confusion_KNN_2(2,3) = confusion_KNN_2(2,3) + 1;
    end
end

for j = 1:length(Etest)
    Eresults_nn(j) = knn3class(C,D,E,Etest(j,:),1);
    if (Eresults_nn(j) == 1)
        confusion_NN_2(3,1) = confusion_NN_2(3,1) + 1;
    elseif (Eresults_nn(j) == 2)
        confusion_NN_2(3,2) = confusion_NN_2(3,2) + 1;
    elseif (Eresults_nn(j) == 3)
        confusion_NN_2(3,3) = confusion_NN_2(3,3) + 1;
    end

    Eresults_knn(j) = knn3class(C,D,E,Etest(j,:),5);
    if (Eresults_knn(j) == 1)
        confusion_KNN_2(3,1) = confusion_KNN_2(3,1) + 1;
    elseif (Eresults_knn(j) == 2)
        confusion_KNN_2(3,2) = confusion_KNN_2(3,2) + 1;
    elseif (Eresults_knn(j) == 3)
        confusion_KNN_2(3,3) = confusion_KNN_2(3,3) + 1;
    end
end

%calculate overall error
correct_nn_2 = trace(confusion_NN_2);
sum_nn_2 = sum(confusion_NN_2,'all');
error_NN_2 = 1 - correct_nn_2 / sum_nn_2; 

correct_knn_2 = trace(confusion_KNN_2);
sum_knn_2 = sum(confusion_KNN_2,'all');
error_KNN_2 = 1 - correct_knn_2 / sum_knn_2; 