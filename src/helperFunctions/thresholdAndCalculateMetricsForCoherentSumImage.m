function [accuracy, precision, recall, f1] = thresholdAndCalculateMetricsForCoherentSumImage(image,truthLocation, threshold)
    %% Thresholding image
    binaryImage = ones(size(image));
    binaryImage(image<threshold)=0;
    binaryImage = logical(binaryImage);
    %% Compare to ground truth
    groundTruth = load(truthLocation);
    gT = groundTruth.groundTruth;
    AccuracyArray = zeros(length(gT),1);
    PrecisionArray =zeros(length(gT),1);
    RecallArray = zeros(length(gT),1);
    F1Array = zeros(length(gT),1);
    
    for iGT1=1:length(gT)
        currentGT = gT{1, iGT1}.Boundaries;
        [Accuracy, Precision,Recall,F1] = compareToGroundTruth(binaryImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
        AccuracyArray(iGT1) = Accuracy;
        PrecisionArray(iGT1) = Precision;
        RecallArray(iGT1) = Recall;
        F1Array(iGT1) = F1;
    end

    accuracy = max(AccuracyArray);
    precision = max(PrecisionArray);
    recall = max(RecallArray);
    f1 = max(F1Array);
    
end