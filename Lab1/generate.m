function zA = generate(muA,sigmaA,N)
    [VA,DA] = eig(sigmaA);
    
    WAinv = inv((VA)')*DA^0.5;
    
    zA = zeros(2,N);
    
    for i =1:N
        plus = randn(2,1);
        plus = WAinv*plus;
        zA(:,i) = muA + plus;
    end

end

