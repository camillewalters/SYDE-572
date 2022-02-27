function knnplot(k,fill,line_colour,varargin)

    % set up set of test points for plotting boundary
    resolution = 5;
    x1min = -10;
    x1max = 25;
    x2min = -10;
    x2max = 35;
    x1n = resolution*(x1max - x1min);
    x2n = resolution*(x2max - x2min);

    x1 = linspace(x1min,x1max,x1n);
    x2 = linspace(x2min,x2max,x2n);
    
    testPoints = zeros(x1n, x2n);
        
    %classify each test point
    % class 1 = A
    % class 2 = B
    for m = 1:x1n
        for n = 1:x2n
            testpoint = [x1min + m/resolution; x2min + n/resolution];
            if (length(varargin) == 2)
                testPoints(m,n) = knn2class(varargin{1}, varargin{2}, testpoint,k);
            elseif (length(varargin) == 3)
                testPoints(m,n) = knn3class(varargin{1}, varargin{2}, varargin{3},testpoint,k);
            end
        end
    end

    hold on; 
    if(fill == true)
        imagesc(x1,x2,testPoints');
    end
%     colormap('parula');
    for i = 1:length(varargin)
        contour(x1,x2,testPoints' == i,1,'Color',line_colour);
    end

    
%     % plot contour
%     if (length(varargin) == 2)
%         contour(linspace(x1min,x1max,x1n), linspace(x2min,x2max,x2n),testPoints',[2 2],colour);
%     else
%         contour(linspace(x1min,x1max,x1n), linspace(x2min,x2max,x2n),testPoints', [1.5, 2.5],colour);
%     end
%     legend("Boundary, k = "+string(k));
end