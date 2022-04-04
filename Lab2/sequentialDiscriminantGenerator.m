function [big_big_classify, X, Y] = sequentialDiscriminantGenerator(classA,classB,j_limit)
    j = 1;
    minValue = floor(min(min(classA, classB)));
    maxValue = ceil(max(max(classA, classB)));
    X = minValue(1):1:maxValue(1);
    Y = minValue(2):1:maxValue(2);
    while (j<=j_limit)
        [MED_Classifier] = MED(classA,classB, X,Y);
        MED_classify = classifyPoints(X, Y, MED_Classifier, classA, 1, classB, 2);
        conf_MED = confusionmat(MED_classify(:,1), MED_classify(:,2));
        n_a_B = conf_MED(1,2);
        n_b_A = conf_MED(2,1);
        if(n_a_B ~= 0 && n_b_A ~= 0)
            continue
        end
        big_classify(:,:,j) = MED_Classifier;
        Master_n_a_B(j) = n_a_B;
        Master_n_b_A(j) = n_b_A;
        
        if(n_a_B == 0 && ~isempty(classB))
            indexes_b_B = find(MED_classify(:,1) == 2 & MED_classify(:,2) == 2) - size(classA,1);
            classB(indexes_b_B,:) = [];
        end
        if(n_b_A == 0 && ~isempty(classA))
            indexes_a_A = find(MED_classify(:,1) == 1 & MED_classify(:,2) == 1);
            classA(indexes_a_A,:) = [];
        end
        if(isempty(classA) && isempty(classB))
            break;
        end
        
        j = j + 1;
    end
    big_big_classify = zeros(size(big_classify(:,:,1)));
    for i = 1:size(big_classify,3)
        if(Master_n_a_B(i) == 0)
            %class = 2
            big_big_classify((big_big_classify==0)&(big_classify(:,:,i)==2)) = 2;
        end
        if(Master_n_b_A(i) == 0)
            %class = 1
            big_big_classify((big_big_classify==0)&(big_classify(:,:,i)==1)) = 1;
        end
        if(i==size(big_classify,3))
            big_big_classify((big_big_classify==0)&(big_classify(:,:,i)==2)) = 2;
            big_big_classify((big_big_classify==0)&(big_classify(:,:,i)==1)) = 1;
        end
    end
end

