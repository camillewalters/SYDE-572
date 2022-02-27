%knn function - returns class of nearest neighbour
function class = knn3class(Avalues, Bvalues, Cvalues, testpoint, k)


    %FIRST CLASS
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
    

    % SECOND CLASS
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


    % THIRD CLASS
    Cdistances = zeros(1, length(Cvalues));
    for i = 1:length(Cdistances)
        Cdistances(i) = Edist (testpoint,Cvalues(:,i));
    end

    kneighboursC = zeros(2,k);
    for i = 1:k
        [dist, index] = min(Cdistances);
        kneighboursC(:,i) = Cvalues(:,index);
        Cdistances(index)=[];
        Cvalues(:,index) = [];
    end

    Cprototype = [mean(kneighboursC(1,:)),mean(kneighboursC(2,:))];
    Cdist = Edist(Cprototype, testpoint);


    
    if (Adist < Bdist) && (Adist < Cdist)
        class = 1;
    elseif (Bdist < Adist) && (Bdist < Cdist)
        class = 2;
    else
        class = 3;
    end
end

