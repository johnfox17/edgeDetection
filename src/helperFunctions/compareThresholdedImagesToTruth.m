function tpPerThresholdedImagesSobel = compareThresholdedImagesToTruth(pathToImages,imageTruth)
    numEdgeMaps = length(pathToImages);
    tpPerThresholdedImagesSobel = zeros(numEdgeMaps,1);
    for iImage=1:numEdgeMaps       
        tpPerThresholdedImagesSobel(iImage) = sum(sum(imread(pathToImages(iImage)).*imageTruth));
    end

end