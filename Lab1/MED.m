function res = MED( mu1, mu2, X, Y )

    classification = zeros(size(X, 1)*size(Y, 2), 1);
    testPoints = [X(:), Y(:)];

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