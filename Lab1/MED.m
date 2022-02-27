% Class A
nA = 200;
muA = [5;10]';
sigmaA = [8 0; 0 4];

% Class B
nB = 200;
muB = [10;15]';
sigmaB = [8 0; 0 4];

% Class C
nC = 100;
muC = [5;10]';
sigmaC = [8 4; 4 40];

% Class D
nD = 200;
muD = [15;10]';
sigmaD = [8 0; 0 8];

% Class E
nE = 150;
muE = [10;5]';
sigmaE = [10 -5; -5 20];

% setup 
resolution = 10;
x1min = -5;
x1max = 20;
x2min = 0;
x2max = 25;
x1 = linspace(x1min, x1max, resolution*(x1max - x1min));
x2 = linspace(x2min, x2max, resolution*(x2max - x2min));
[X1, X2] = meshgrid(x1, x2);

% plot case 1
boundary1 = MED1(muA, muB, X1, X2);
figure(1);
contour(X1, X2, boundary1, 'Color', 'black')
hold off;

% plot case 2
boundary2 = MED2(muC, muD, muE, X1, X2);
figure(2);
contour(X1, X2, boundary2, 'Color', 'black')
hold off;

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