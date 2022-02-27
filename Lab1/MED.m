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
classC = C';
meanC = mean(classC);

% Class D
nD = 200;
muD = [15;10];
sigmaD = [8 0; 0 8];
classD = D';
meanD = mean(classD);

% Class E
nE = 150;
muE = [10;5];
sigmaE = [10 -5; -5 20];
classE = E';
meanE = mean(classE);

% setup case 1
resolution = 10;
x1min = min([classA(:,1); classB(:,1)]);
x1max = max([classA(:,1); classB(:,1)]);

y1min = min([classA(:,2); classB(:,2)]);
y1max = max([classA(:,2); classB(:,2)]);

x1 = linspace(x1min, x1max, resolution*(x1max - x1min));
y1 = linspace(y1min, y1max, resolution*(y1max - y1min));
[X1, Y1] = meshgrid(x1, y1);

% plot case 1
boundary1 = MED1(muA, muB, X1, Y1);
figure(1);
contour(X1, Y1, boundary1, 'Color', 'black')
hold on;

% setup case 2
resolution = 10;
x2min = min([classC(:,1); classD(:,1); classE(:,1)]);
x2max = max([classC(:,1); classD(:,1); classE(:,1)]);
y2min = min([classC(:,2); classD(:,2); classE(:,2)]);
y2max = max([classC(:,2); classD(:,2); classE(:,2)]);
x2 = linspace(x2min, x2max, resolution*(x2max - x2min));
y2 = linspace(y2min, y2max, resolution*(y2max - y2min));
[X2, Y2] = meshgrid(x2, y2);

% plot case 2
boundary2 = MED2(muC, muD, muE, X2, Y2);
figure(2);

contour(X2, Y2, boundary2, 'Color', 'black')
hold on;

function res = MED1( mu1, mu2, X, Y )

    classification = zeros(size(X, 1)*size(Y, 2), 1);
    testPoints = [X(:), Y(:)]; % reshape to column vector

    for i = 1:length(testPoints)
        d1 = sqrt((mu1(1) - testPoints(i,1))^2 + (mu1(2) - testPoints(i,2))^2);
        d2 = sqrt((mu2(1) - testPoints(i,1))^2 + (mu2(2) - testPoints(i,2))^2);

        if (d1 < d2)
            classification(i) = 1;
        elseif (d2 < d1)
            classification(i) = 2;
        else
            classification(i) = 0;
        end
    end 
    res = reshape(classification, size(X,1), size(Y,2));
end

function res = MED2( mu1, mu2, mu3, X, Y )

    classification = zeros(size(X, 1)*size(Y, 2), 1);
    testPoints = [X(:), Y(:)]; % reshape to column vector

    for i = 1:length(testPoints)
        d1 = sqrt((mu1(1) - testPoints(i,1))^2 + (mu1(2) - testPoints(i,2))^2);
        d2 = sqrt((mu2(1) - testPoints(i,1))^2 + (mu2(2) - testPoints(i,2))^2);
        d3 = sqrt((mu3(1) - testPoints(i,1))^2 + (mu3(2) - testPoints(i,2))^2);

        if (d1 < d2 && d1 < d3)
            classification(i) = 1;
        elseif (d2 < d1 && d2 < d3)
            classification(i) = 2;
        elseif (d3 < d1 && d3 < d2)
            classification(i) = 3;  
        else
            classification(i) = 0;
        end
    end 
    res = reshape(classification, size(X,1), size(Y,2));
end