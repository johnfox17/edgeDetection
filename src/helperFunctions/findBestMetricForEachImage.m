function [maxAccuracyIdx, maxPrecisionIdx, maxRecallIdx, maxF1Idx] = ...
    findBestMetricForEachImage(metrics)
    [numImages, ~] = size(metrics);
    maxAccuracyIdx = 1;
    maxPrecisionIdx = 1;
    maxRecallIdx = 1;
    maxF1Idx = 1;
    for iImage = 1:numImages
        if metrics{iImage}.accuracy >= metrics{maxAccuracyIdx}.accuracy
            maxAccuracyIdx = iImage;
        end
        if metrics{iImage}.precision >= metrics{maxPrecisionIdx}.precision
            maxPrecisionIdx = iImage;
        end
        if metrics{iImage}.recall>= metrics{maxRecallIdx}.recall
            maxRecallIdx = iImage;
        end
        if metrics{iImage}.f1 >= metrics{maxF1Idx}.f1
            maxF1Idx = iImage;
        end
        
    end
end