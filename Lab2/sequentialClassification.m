function [] = sequentialClassification(a,b)

    for i = 1:3
        [sequentialDiscriminantClassifier, X, Y] = sequentialDiscriminantGenerator(a,b,999);
        currentFig = figure;
        plotClasses(a,'Class A',b,'Class B');
        hold on;
        contour(X,Y,sequentialDiscriminantClassifier, 'DisplayName', 'SD Boundary');
        title(sprintf('Sequential Classifier %d',i));
    end
    max_j = 5;
    iterations = 20;
    j_limit_range = 1:max_j;
    error_rate = zeros(max_j,iterations);
    average_error_rate = zeros(max_j,1);
    min_error_rate = zeros(max_j,1);
    max_error_rate = zeros(max_j,1);
    std_error_rate = zeros(max_j,1);
    
    for j_limit = j_limit_range
        
        for i = 1:iterations
            [sequentialDiscriminantClassifier, X, Y] = sequentialDiscriminantGenerator(a,b,j_limit);
            Sequential_classify = classifyPoints(X, Y, sequentialDiscriminantClassifier, a, 1, b, 2);
            conf_Sequential = confusionmat(Sequential_classify(:,1), Sequential_classify(:,2));
            error_rate(j_limit,i)=(conf_Sequential(1,2) + conf_Sequential(2,1))/(length([a;b]));
            
            if (error_rate(j_limit,i) > 0.25 && j_limit > 2)
                limitFig = figure;
                plotClasses(a,'Class A',b,'Class B');
                title(sprintf('Sequential Classifier with J = %d',j_limit));
                hold on;
                contour(X,Y,sequentialDiscriminantClassifier, 'DisplayName', sprintf('SD Boundary %d',i));
                hold on;
            end
        end
        
        average_error_rate(j_limit) = mean(error_rate(j_limit,:));
        min_error_rate(j_limit) = min(error_rate(j_limit,:));
        max_error_rate(j_limit) = max(error_rate(j_limit,:));
        std_error_rate(j_limit) = std(error_rate(j_limit,:),1); 
    end

    error_fig = figure;
    hold on;
    errorbar(j_limit_range,average_error_rate,std_error_rate,'DisplayName','Avg error rate')
    plot(j_limit_range, min_error_rate,'DisplayName','Min error rate')
    plot(j_limit_range, max_error_rate,'DisplayName','Max error rate')
    plot(j_limit_range, std_error_rate,'DisplayName','Std dev error rate')
    legend;
    title("Error Rate of Sequential Classifier versus Number of Sequential Classifiers")
    xlabel("Number of Sequential Classifiers");
    ylabel("Error rate");
end