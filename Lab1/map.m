% Lab 1
close all;
clear all;

lab1();

% Generate clusters
% Class A
nA = 200;
muA = [5;10];
sigmaA = [8 0; 0 4];
classA = A';
%classA = repmat(muA',[nA, 1]) + randn(nA,2)*chol(sigmaA);
meanA = mean(classA);

% Class B
nB = 200;
muB = [10;15];
sigmaB = [8 0; 0 4];
classB = B'
meanB = mean(classB);

% % Class C
% nC = 100;
% muC = [5;10];
% sigmaC = [8 4; 4 40];
% classC = C'
% meanC = mean(classC);
% 
% 
% % Class D
% nD = 200;
% muD = [15;10];
% sigmaD = [8 0; 0 8];
% classD = D'
% meanD = mean(classD);
% 
% % Class E
% nE = 150;
% muE = [10;5];
% sigmaE = [10 -5; -5 20];
% classE = E'
% meanE = mean(classE);

% Classes A & B

% set-up grid in featurespace to be populated with classifications
minValue = floor(min(min(classA, classB)));
maxValue = ceil(max(max(classA, classB)));
feature1Vals = minValue(1):0.1:maxValue(1);
feature2Vals = minValue(2):0.1:maxValue(2);
arrSize = [size(feature2Vals,2) size(feature1Vals,2)];
pointsCase1 = zeros(arrSize);


% Set the a priori class probabilities proportional to the number of 
% samples in each class.
priorA = nA / (nA + nB);
priorB = nB / (nA + nB);

%initialize posteriors
logPosteriorA = zeros(arrSize);
logPosteriorB = zeros(arrSize);

for i = 1:size(feature1Vals,2)
    for j = 1:size(feature2Vals,2)
        x = [feature1Vals(i), feature2Vals(j)];
        logLikihoodA = -log(2*pi*sqrt(det(sigmaA))) -0.5 * (x - meanA) * inv(sigmaA) * (x - meanA)';
        logLikihoodB = -log(2*pi*sqrt(det(sigmaB))) -0.5 * (x - meanB) * inv(sigmaB) * (x - meanB)';
        logPosteriorA(j,i) = logLikihoodA + log(priorA);
        logPosteriorB(j,i) = logLikihoodB + log(priorB);
        
        if(logPosteriorA(j,i) > logPosteriorB(j,i))
            pointsCase1(j,i) = 1; %class A            
        elseif(logPosteriorA(j,i) < logPosteriorB(j,i))
            pointsCase1(j,i) = 2; %class B
        else
            pointsCase1(j,i) = 0;
        end
        
    end
end

%plotting

set(gca, 'ydir', 'normal');
[X_MAP_1, Y_MAP_1] = meshgrid(feature1Vals, feature2Vals);
contour(X_MAP_1,Y_MAP_1,pointsCase1,[2 2],'DisplayName','MAP boundary')

% 
% classes = [classA; classB; classC; classD; classE];
% maxValue = ceil(max(classes));
% minValue = floor(min(classes));
% feature1Vals = minValue(1):0.1:maxValue(1);
% feature2Vals = minValue(2):0.1:maxValue(2);
% arrSize = [size(feature2Vals,2) size(feature1Vals,2)];
% pointsCase2 = zeros(arrSize);
% 
% priorC = nC / (nC + nD + nE);
% priorD = nD / (nC + nD + nE);
% priorE = nE / (nC + nD + nE);
% 
% %initialize posteriors
% logPosteriorC = zeros(arrSize);
% logPosteriorD = zeros(arrSize);
% logPosteriorE = zeros(arrSize);
% 
% for i = 1:size(feature1Vals,2)
%     for j = 1:size(feature2Vals,2)
%         x = [feature1Vals(i), feature2Vals(j)];
%         
%         logLikihoodC = -log(2*pi*sqrt(det(sigmaC))) -0.5 * (x - meanC) * inv(sigmaC) * (x - meanC)';
%         logLikihoodD = -log(2*pi*sqrt(det(sigmaD))) -0.5 * (x - meanD) * inv(sigmaD) * (x - meanD)';
%         logLikihoodE = -log(2*pi*sqrt(det(sigmaE))) -0.5 * (x - meanE) * inv(sigmaE) * (x - meanE)';
%         
%         logPosteriorC(j,i) = logLikihoodC + log(priorC);
%         logPosteriorD(j,i) = logLikihoodD + log(priorD);
%         logPosteriorE(j,i) = logLikihoodE + log(priorE);
%         
%         if(logPosteriorC(j,i) > logPosteriorD(j,i) && logPosteriorC(j,i) > logPosteriorE(j,i))
%             pointsCase2(j,i) = 1; %class C
%         elseif(logPosteriorD(j,i) > logPosteriorC(j,i) && logPosteriorD(j,i) > logPosteriorE(j,i))
%             pointsCase2(j,i) = 2; %class D
%         elseif(logPosteriorE(j,i) > logPosteriorC(j,i) && logPosteriorE(j,i) > logPosteriorD(j,i))
%             pointsCase2(j,i) = 3; %class E
%         else
%             pointsCase2(j,i) = 0; 
%         end
%     end
% end
% 
% 
% figure
% hold on;
% set(gca, 'ydir', 'normal');
% [X_MAP_2, Y_MAP_2] = meshgrid(feature1Vals, feature2Vals);
% contour(X_MAP_2,Y_MAP_2,pointsCase2, 'DisplayName','MAP boundary')
