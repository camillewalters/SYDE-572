clear;
close all;
clf;

%generate data
lab1();

% set up set of test points for plotting boundary
resolution = 10;
x1min = -5;
x1max = 20;
x2min = 0;
x2max = 25;
x1n = resolution*(x1max - x1min);
x2n = resolution*(x2max - x2min);

testPoints = zeros(x1n, x2n);

k = 5;

%classify each test point
% class 1 = A
% class 2 = B
for m = 1:x1n
    for n = 1:x2n
        testpoint = [x1min + m/resolution; x2min + n/resolution];
        testPoints(m,n) = knn2class(Avalues, Bvalues, testpoint,k);
    end
end

% plot contour along level = 2 
contour(linspace(x1min,x1max,x1n), linspace(x2min,x2max,x2n),testPoints',[2 2]);

%nn function - returns class of nearest neighbour
function class = knn2class(Avalues, Bvalues, testpoint, k)

    Adistances = zeros(1, length(Avalues));
    for i = 1:length(Adistances)
        Adistances(i) = Edist (testpoint,Avalues(:,i));
    end

    kneighboursA = zeros(2,k);
    for i = 1:k
        [dist, index] = min(Adistances);
        kneighboursA(:,i) = Avalues(:,index);
        Adistances(index) = [];
        Avalues(:,index) = [];
    end

    Aprototype = [mean(kneighboursA(1,:)),mean(kneighboursA(2,:))];

    Adist = Edist(Aprototype, testpoint);
    
    Bdistances = zeros(1, length(Bvalues));
    for i = 1:length(Bdistances)
        Bdistances(i) = Edist (testpoint,Bvalues(:,i));
    end

    kneighboursB = zeros(2,k);
    for i = 1:k
        [dist, index] = min(Bdistances);
        kneighboursB(:,i) = Bvalues(:,index);
        Bdistances(index)=[];
        Bvalues(:,index) = [];
    end

    Bprototype = [mean(kneighboursB(1,:)),mean(kneighboursB(2,:))];

    Bdist = Edist(Bprototype, testpoint);
    
    if Adist < Bdist
        class = 1;
    else
        class = 2;
    end
end

%Euclidean distance metric 
function Edist = Edist(a, b)
    Edist = sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2);
end

