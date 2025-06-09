function [finalEdgeMapThresholded] = addAndThresholdEdgeMaps(pathToImages,threshold,weightedSum)
    finalEdgeMap = zeros(size(imread(pathToImages(1))));
    numEdgeMaps = length(pathToImages); 
    weights = ones(numEdgeMaps,1);
    if weightedSum
        x = (-floor(numEdgeMaps/2):floor(numEdgeMaps/2))/numEdgeMaps;
        sigmaSquared = .001;
        weights = exp(-(x-0.25).^2/(sigmaSquared));        
    end
    for iImage=1:length(pathToImages)       
        currentImage = imread(pathToImages(iImage));
        finalEdgeMap = finalEdgeMap + weights(iImage)*currentImage;
    end
    %finalEdgeMap = finalEdgeMap/sum(weights);
    finalEdgeMap = finalEdgeMap;
    if threshold~='None'
        finalEdgeMapThresholded = ones(size(finalEdgeMap));
        finalEdgeMapThresholded(finalEdgeMap<threshold)=0;
    else
        finalEdgeMapThresholded = finalEdgeMap; 
    end
    
end