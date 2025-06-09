function [thresholds] = calculateThresholds(minThreshold,maxThreshold,deltaThreshold)
    % Threshold arrays
    thresholds = minThreshold:deltaThreshold:maxThreshold;
end