
function calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,operator, image, sigma1,sigma2,Nx,Ny)
    createEdgeOutputFolders(outputFolderPath, operator);
    if operator == "PDDOKernel"
        [gradientMag,xGradient, yGradient] = pddoEdgeDetector(image, sigma1,Nx);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(gradientMag, thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"PDDOKernel/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"PDDO/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end
    elseif operator == "FuzzyPDDO"
        [modifiedMembershipImage, gradMagnitude] = fuzzyPDDOEdgeDetector(image, 2,11);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(modifiedMembershipImage,thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"FuzzyPDDO/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"FuzzyPDDO/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end 
    elseif operator == "FuzzyType2PDDO"
        [modifiedMembershipImage, gradMagnitude] = fuzzyType2PDDOEdgeDetector(image, 2,11);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(modifiedMembershipImage,thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"FuzzyType2PDDO/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"FuzzyType2PDDO/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end 
    elseif operator == "Sobel"
        [gradientMag] = sobelEdgeDetector(image);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(gradientMag, thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"Sobel/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"Sobel/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end
    elseif operator == "Prewitt"
        [gradientMag] = prewittEdgeDetector(image);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(gradientMag, thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"Prewitt/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"Prewitt/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end
    elseif operator == "Scharr"
        [gradientMag] = scharrEdgeDetector(image);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(gradientMag, thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"Scharr/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"Scharr/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end
    elseif operator == "Macleod"
        [gradientMag] = macleodEdgeDetector(image, sigma1,sigma2,Nx,Ny);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(gradientMag, thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"Macleod/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"Macleod/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end
    elseif operator == "Argyle"
        [gradientMag] = argyleEdgeDetector(image, sigma1,Nx,Ny);
        for iThreshold = 1:length(thresholds)
            [gradientEdgeMap, gradientMagnitude] = ...
                detectEdges(gradientMag, thresholds(iThreshold));
            imwrite(gradientEdgeMap,strcat(outputFolderPath,"Argyle/edgeMapThreshold_",...
            num2str(thresholds(iThreshold)),".png"))
            % imwrite(gradientMagnitude,strcat(outputFolderPath,"Argyle/gradMagThreshold_",...
            % num2str(thresholds(iThreshold)),".png"))
        end
    end

end