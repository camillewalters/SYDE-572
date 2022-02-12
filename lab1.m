clear;
close all;
clf;

muA = [5 10]';
sigmaA = [8 0 ; 0 4];

[VA,DA] = eig(sigmaA)

WAinv = inv((VA)')*DA^0.5;

zA = zeros(2,200);

for i =1:200
    plus = randn(2,1);
    plus = WAinv*plus;
    zA(:,i) = muA + plus;
end

hold on;
x1A = zA(1,:);
x2A = zA(2,:);
scatter(x1A,x2A, 'r');

plot_ellipse(muA(1),muA(2), atan(VA(2,1)/VA(1,1)), sqrt(DA(1,1)), sqrt(DA(2,2)), 'r')
hold on;

muA = [10 15]';
sigmaA = [8 0 ; 0 4];

[VA,DA] = eig(sigmaA)

WAinv = inv((VA)')*DA^0.5;

zA = zeros(2,200);

for i =1:200
    plus = randn(2,1);
    plus = WAinv*plus;
    zA(:,i) = muA + plus;
end

hold on;
x1A = zA(1,:);
x2A = zA(2,:);
scatter(x1A,x2A, 'b');

plot_ellipse(muA(1),muA(2), atan(VA(2,1)/VA(1,1)), sqrt(DA(1,1)), sqrt(DA(2,2)), 'b')
xlabel('X_1')
ylabel('X_2')
title("Case 1 Clusters")
legend("Class A", "Class A Standard Deviation Contour", "Class B", "Class B Standard Deviation Contour")

% muB = [10 15]';
% sigmaB = [16 0 ; 0 4];
% 
% WBinv = [sqrt(16) 0; 0 2];
% 
% zB = zeros(2,200);
% 
% for i =1:200
%     plus = randn(2,1);
%     plus = WBplus;
%     zB(:,i) = muB + plus;
% end
% 
% x1B = zB(1,:);
% x2B = zB(2,:);
% scatter(x1B,x2B);
% 
% %Class A
% muA = [5 10];;
% sigmaA = [8 0; 0 4];
% R = chol(sigmaA);
% zA = repmat(muA,200,1) + randn(200,2)*R;
% s = size(zA);
% x= zA(:,1);
% z=zA(:,2);
% scatter(x,z,'filled','r');
% hold on;
% 
% %Class B
% muB = [10 15];
% sigmaB = [8 0; 0 4];
% R = chol(sigmaB);
% zB = repmat(muB,200,1) + randn(200,2)*R;
% x= zB(:,1);
% z=zB(:,2);
% scatter(x,z,'filled','b');
% xlabel("X_1");
% ylabel("X_2");
% title("Case 1 Clusters");
% hold on;
% 
% plot_ellipse(muA(1),muA(2), 0, sqrt(sigmaA(1,1)), sqrt(sigmaA(2,2)), 'r')
% hold on;
% plot_ellipse(muB(1),muB(2), 0, sqrt(sigmaB(1,1)), sqrt(sigmaB(2,2)), 'b')
% 
% 
% % %%CASE 2
% % muC = [5 10];
% % sigmaC = [8 4; 4 40];
% % R = chol(sigmaC);
% % zC = repmat(muC,100,1) + randn(100,2)*R;
% % x= zC(:,1);
% % z=zC(:,2);
% % scatter(x,z,'filled','r');
% % hold on;
% % 
% % muD = [15 10];
% % sigmaD = [8 0; 0 8];
% % R = chol(sigmaD);
% % zD = repmat(muD,200,1) + randn(200,2)*R;
% % x= zD(:,1);
% % z=zD(:,2);
% % scatter(x,z,'filled','b');
% % hold on;
% % 
% % muE = [10 5];
% % sigmaE = [10 -5; -5 20];
% % R = chol(sigmaE);
% % zE = repmat(muE,150,1) + randn(150,2)*R;
% % x= zE(:,1);
% % z=zE(:,2);
% % scatter(x,z,'filled','g');
% % hold on;
% 
% 
% 
