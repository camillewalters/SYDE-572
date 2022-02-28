%knn function - returns class of nearest neighbour
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

