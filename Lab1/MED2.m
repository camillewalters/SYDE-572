function res = MED2( mu1, mu2, mu3, X, Y )

    classification = zeros(size(X, 1)*size(Y, 2), 1);
    testPoints = [X(:), Y(:)];
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
