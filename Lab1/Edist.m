%Euclidean distance metric 
function Edist = Edist(a, b)
    Edist = sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2);
end