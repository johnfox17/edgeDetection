function [metrics] = calculateMetrics(pathToImages,truthLocation)

    %% Compare to ground truth
    groundTruth = load(truthLocation);
    gT = groundTruth.groundTruth;
    AccuracyArray = zeros(length(gT),1);
    PrecisionArray =zeros(length(gT),1);
    RecallArray = zeros(length(gT),1);
    F1Array = zeros(length(gT),1);
    metrics = cell(length(pathToImages), 1);
    for iImage=1:length(pathToImages)
        for iGT1=1:length(gT)
            currentImage = imread(pathToImages(iImage));
            currentGT = gT{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end

        metrics{iImage}.accuracy = max(AccuracyArray);
        metrics{iImage}.precision = max(PrecisionArray);
        metrics{iImage}.recall = max(RecallArray);
        metrics{iImage}.f1 = max(F1Array);
    end
end