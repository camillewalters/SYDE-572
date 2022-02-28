function [class] = PointClassification(X,Y,classifier, x, y)


X_inc = abs(X(1,1) - X(end, end))/(size(X,2)-1);
Y_inc = abs(Y(1,1) - Y(end, end))/(size(Y,1)-1);

X_ind = floor((x-X(1,1))/X_inc)+1;
Y_ind = floor((y-Y(1,1))/Y_inc)+1;


if Y_ind > size(classifier,1) 
    Y_ind = 1;
end

if X_ind > size(classifier,2) 
    X_ind = 1;
end

%new part
if Y_ind <= 0 
    Y_ind = 1;
end

if X_ind <= 0 
    X_ind = 1;
end   


class = classifier(Y_ind, X_ind); 

end

