function [Accuracy, Precision,Recall,F1] = compareToGroundTruth(image, groundTruth)
    
    % SE = strel("disk",1);
    % groundTruth= imdilate(groundTruth,SE);
    cm = confusionchart(image(:),groundTruth(:));
    values = cm.NormalizedValues;
    TP = values(2,2);
    FP = values(1,2);
    TN = values(1,1);
    FN = values(2,1);
    if (TP+TN+FP+FN)~=0 && TP>150 && FN<2500
        Accuracy = (TP+TN)/(TP+TN+FP+FN);
    else
        Accuracy = 0;
    end
    if (TP+FP)~=0 && TP>150 && FN<2500
        Precision = TP/(TP+FP);
    else
        Precision = 0;
    end
    if (TP+FN)~=0 && TP>150 && FN<2500
        Recall = TP/(TP+FN);
        if Recall == 1
            disp('Here');
        end
    else
        Recall = 0;
    end
    if (Precision+Recall)~=0 && TP>150 && FN<2500
        F1 = 2*(Precision*Recall)/(Precision+Recall);
    else
        F1 = 0;
    end
end