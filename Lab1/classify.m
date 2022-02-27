function [classifiedPoints] = classify(X,Y, classifier, varargin)

    classNum =  size(varargin,2)/ 2;
    classifiedPoints = [];
    
    for i = 1:classNum
       originalPoints = varargin{(i-1)*2+1};
       for index = 1:size(originalPoints, 1)
          point = originalPoints(index,:);
          classification = PointClassification(X,Y,classifier,point(1,1), point(1,2));
          classifiedPoints = [classifiedPoints; i classification];
       end
    end
end

