function [classNum] = PointClassification(X,Y,classifier, x, y)


X_inc = abs(X(1,1) - X(end, end))/(size(X,2)-1);
Y_inc = abs(Y(1,1) - Y(end, end))/(size(Y,1)-1);

X_indx = floor((x-X(1,1))/X_inc)+1;
Y_indx = floor((y-Y(1,1))/Y_inc)+1;


if Y_indx > size(classifier,1) 
    Y_indx = 1;
end

if X_indx > size(classifier,2) 
    X_indx = 1;
end


classNum = classifier(Y_indx, X_indx); 

end

