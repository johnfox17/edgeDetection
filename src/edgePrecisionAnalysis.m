clear all;
close all
% clc;
addpath('./helperFunctions/')
addpath('./edgeDetectorMethods/Sobel')
addpath('./edgeDetectorMethods/Macleod')
addpath('./edgeDetectorMethods/PDDOKernel')
addpath('./edgeDetectorMethods/Prewitt')
addpath('./edgeDetectorMethods/Scharr')
addpath('./edgeDetectorMethods/Argyle')
addpath('./edgeDetectorMethods/FuzzyPDDO')
addpath('./edgeDetectorMethods/FuzzyType2PDDO')
addpath('../data/simData')
addpath('../data/simData/lowContrastImages')
%outputFolderPath = "../data/output/concreteLowContrast/00659/";
outputFolderPath = "../data/output/BSDS500/3063/";

%Flags
plotMetrics =true;
plotBestMetricImagesFlag = true;
calculateMetricsFlag = true; 
calculateCoherentSumImages = true;
plotMetricsCoherentSum = true;

%Load Images
%imageLab = rgb2lab(imread('00659.jpg'));
imageLab = rgb2lab(imread('3063.jpg'));
% imageLStar = imageLab(:,:,1)/(max(max(imageLab(:,:,1))));
% imageLStar = addAWGN(imageLStar, 0, 0.021);
% figure; imagesc(imageLStar); colormap gray; colorbar;
% imwrite(imageLStar,'../data/simData/noisy3063_1.jpg')
imageLStar = double(imread('../data/simData/noisy3063_1.jpg'));
imageLStar = imageLStar(:,:,1)/(max(max(imageLStar(:,:,1))));
%Load Truth
imageTruth = '3063.mat';
%Calculate Thresholds
[thresholds] = calculateThresholds(0,1.0,0.01);

%Calculate and Save Sobel Edge Maps
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Sobel', imageLStar,2,2,11,11);
imagePathsSobel = extractImagePaths(outputFolderPath,'Sobel');

%Calculate and Save Prewitt Edge Maps
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Prewitt', imageLStar,2,2,11,11);
imagePathsPrewitt = extractImagePaths(outputFolderPath,'Prewitt');

%Calculate and Save Scharr Edge Maps
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Scharr', imageLStar,2,2,11,11);
imagePathsScharr = extractImagePaths(outputFolderPath,'Scharr');

%Calculate and Save Argyle Edge Maps
sigma1 = 2;
sigma2 = 2;
kernelDimension = 5;
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Argyle', imageLStar,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsArgyle = extractImagePaths(outputFolderPath,'Argyle');

%Calculate and Save Macleod Edge Maps
sigma1 = 1;
sigma2 = 1;
kernelDimension = 11;
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Macleod', imageLStar,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsMacleod = extractImagePaths(outputFolderPath,'Macleod');

%Calculate and Save PDDOKernel Edge Maps
sigma1 = 2;
sigma2 = 2;
kernelDimension = 11;
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'PDDOKernel', imageLStar,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsPDDOKernel = extractImagePaths(outputFolderPath,'PDDOKernel');

%Calculate and Save FuzzyPDDO Edge Maps
% calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'FuzzyPDDO', imageLStar,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsFuzzyPDDO = extractImagePaths(outputFolderPath,'FuzzyPDDO');



%% Calculate Metrics
if calculateMetricsFlag
    [metricsSobel] = calculateMetrics(imagePathsSobel,imageTruth);
    [maxAccuracyIdxSobel, maxPrecisionIdxSobel, maxRecallIdxSobel, maxF1IdxSobel] = ...
        findBestMetricForEachImage(metricsSobel);
    [metricsPrewitt] = calculateMetrics(imagePathsPrewitt,imageTruth);
    [maxAccuracyIdxPrewitt, maxPrecisionIdxPrewitt, maxRecallIdxPrewitt, maxF1IdxPrewitt] = ...
        findBestMetricForEachImage(metricsPrewitt);
    [metricsScharr] = calculateMetrics(imagePathsScharr,imageTruth);
    [maxAccuracyIdxScharr, maxPrecisionIdxScharr, maxRecallIdxScharr, maxF1IdxScharr] = ...
        findBestMetricForEachImage(metricsScharr);
    [metricsArgyle] = calculateMetrics(imagePathsArgyle,imageTruth);
    [maxAccuracyIdxArgyle, maxPrecisionIdxArgyle, maxRecallIdxArgyle, maxF1IdxArgyle] = ...
        findBestMetricForEachImage(metricsArgyle);
    [metricsMacleod] = calculateMetrics(imagePathsMacleod,imageTruth);
    [maxAccuracyIdxMacleod, maxPrecisionIdxMacleod, maxRecallIdxMacleod, maxF1IdxMacleod] = ...
        findBestMetricForEachImage(metricsMacleod);
    [metricsPDDOKernel] = calculateMetrics(imagePathsPDDOKernel,imageTruth);
    [maxAccuracyIdxPDDOKernel, maxPrecisionIdxPDDOKernel, maxRecallIdxPDDOKernel, maxF1IdxPDDOKernel] = ...
        findBestMetricForEachImage(metricsPDDOKernel);
    [metricsFuzzyPDDO] = calculateMetrics(imagePathsFuzzyPDDO,imageTruth);
    [maxAccuracyIdxFuzzyPDDO, maxPrecisionIdxFuzzyPDDO, maxRecallIdxFuzzyPDDO, maxF1IdxFuzzyPDDO] = ...
        findBestMetricForEachImage(metricsFuzzyPDDO);

end
%% Calculate Coherent Sum Images
if calculateCoherentSumImages
    [finalEdgeMapSobel] = addAndThresholdEdgeMaps(imagePathsSobel,'None',false);
    %Normalize image
    finalEdgeMapSobel(8:end-7,8:end-7) = finalEdgeMapSobel(8:end-7,8:end-7)/max(finalEdgeMapSobel(8:end-7,8:end-7),[],'all');
    [finalEdgeMapPrewitt] = addAndThresholdEdgeMaps(imagePathsPrewitt,'None',false);
    %Normalize image
    finalEdgeMapPrewitt(8:end-7,8:end-7) = finalEdgeMapPrewitt(8:end-7,8:end-7)/max(finalEdgeMapPrewitt(8:end-7,8:end-7),[],'all');
    [finalEdgeMapScharr] = addAndThresholdEdgeMaps(imagePathsScharr,'None',false);
    %Normalize image
    finalEdgeMapScharr(8:end-7,8:end-7) = finalEdgeMapScharr(8:end-7,8:end-7)/max(finalEdgeMapScharr(8:end-7,8:end-7),[],'all');
    [finalEdgeMapArgyle] = addAndThresholdEdgeMaps(imagePathsArgyle,'None',false);
    %Normalize image
    finalEdgeMapArgyle(8:end-7,8:end-7) = finalEdgeMapArgyle(8:end-7,8:end-7)/max(finalEdgeMapArgyle(8:end-7,8:end-7),[],'all');
    [finalEdgeMapMacleod] = addAndThresholdEdgeMaps(imagePathsMacleod,'None',false);    
    %Normalize image
    finalEdgeMapMacleod(8:end-7,8:end-7) = finalEdgeMapMacleod(8:end-7,8:end-7)/max(finalEdgeMapMacleod(8:end-7,8:end-7),[],'all');
    [finalEdgeMapPDDOKernel] = addAndThresholdEdgeMaps(imagePathsPDDOKernel,'None',false);
    %Normalize image
    finalEdgeMapPDDOKernel(8:end-7,8:end-7) = finalEdgeMapPDDOKernel(8:end-7,8:end-7)/max(finalEdgeMapPDDOKernel(8:end-7,8:end-7),[],'all');
    [finalEdgeMapFuzzyPDDO] = addAndThresholdEdgeMaps(imagePathsFuzzyPDDO,'None',false);
    %Normalize image
    finalEdgeMapFuzzyPDDO(8:end-7,8:end-7) = finalEdgeMapFuzzyPDDO(8:end-7,8:end-7)/max(finalEdgeMapFuzzyPDDO(8:end-7,8:end-7),[],'all');
    figure; imagesc(finalEdgeMapSobel(8:end-7,8:end-7)); colormap gray; colorbar; title('Sobel (Coherent Sum)');
    figure; imagesc(finalEdgeMapPrewitt(8:end-7,8:end-7)); colormap gray; colorbar; title('Prewitt (Coherent Sum)');
    figure; imagesc(finalEdgeMapScharr(8:end-7,8:end-7)); colormap gray; colorbar; title('Scharr (Coherent Sum)');
    figure; imagesc(finalEdgeMapArgyle(8:end-7,8:end-7)); colormap gray; colorbar; title('Argyle (Coherent Sum)');
    figure; imagesc(finalEdgeMapMacleod(8:end-7,8:end-7)); colormap gray; colorbar; title('Macleod (Coherent Sum)');
    figure; imagesc(finalEdgeMapPDDOKernel(8:end-7,8:end-7)); colormap gray; colorbar; title('PDDO Kernel (Coherent Sum)');
    figure; imagesc(finalEdgeMapFuzzyPDDO(8:end-7,8:end-7)); colormap gray; colorbar; title('FuzzyPDDO (Coherent Sum)');
    bestMetricsCoherentSumThresholdSobel = zeros(4,1); %accuracy, precision, recall, f1
    bestMetricsCoherentSumThresholdPrewitt = zeros(4,1);
    bestMetricsCoherentSumThresholdScharr = zeros(4,1);
    bestMetricsCoherentSumThresholdArgyle = zeros(4,1);
    bestMetricsCoherentSumThresholdMacleod = zeros(4,1);
    bestMetricsCoherentSumThresholdPDDOKernel = zeros(4,1);
    bestMetricsCoherentSumThresholdFuzzyPDDO = zeros(4,1);
    for iThreshold = 1:length(thresholds)
        %Sobel
        [accuracyCoherentSumSobel, precisionCoherentSumSobel, recallCoherentSumSobel, f1CoherentSumSobel] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapSobel,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdSobel(1)<accuracyCoherentSumSobel
            bestMetricsCoherentSumThresholdSobel(1) = accuracyCoherentSumSobel;
            bestAccuracyThresholdSobel = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdSobel(2)<precisionCoherentSumSobel
            bestMetricsCoherentSumThresholdSobel(2) = precisionCoherentSumSobel;
            bestPrecisionThresholdSobel = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdSobel(3)<recallCoherentSumSobel
            bestMetricsCoherentSumThresholdSobel(3) = recallCoherentSumSobel;
            bestRecallThresholdSobel = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdSobel(4)<f1CoherentSumSobel
            bestMetricsCoherentSumThresholdSobel(4) = f1CoherentSumSobel;
            bestF1ThresholdSobel = thresholds(iThreshold);
        end
        %Prewitt
        [accuracyCoherentSumPrewitt, precisionCoherentSumPrewitt, recallCoherentSumPrewitt, f1CoherentSumPrewitt] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapPrewitt,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdPrewitt(1)<accuracyCoherentSumPrewitt
            bestMetricsCoherentSumThresholdPrewitt(1) = accuracyCoherentSumPrewitt;
            bestAccuracyThresholdPrewitt = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdPrewitt(2)<precisionCoherentSumPrewitt
            bestMetricsCoherentSumThresholdPrewitt(2) = precisionCoherentSumPrewitt;
            bestPrecisionThresholdPrewitt = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdPrewitt(3)<recallCoherentSumPrewitt
            bestMetricsCoherentSumThresholdPrewitt(3) = recallCoherentSumPrewitt;
            bestRecallThresholdPrewitt = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdPrewitt(4)<f1CoherentSumPrewitt
            bestMetricsCoherentSumThresholdPrewitt(4) = f1CoherentSumPrewitt;
            bestF1ThresholdPrewitt = thresholds(iThreshold);
        end
        %Scharr
        [accuracyCoherentSumScharr, precisionCoherentSumScharr, recallCoherentSumScharr, f1CoherentSumScharr] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapScharr,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdScharr(1)<accuracyCoherentSumScharr
            bestMetricsCoherentSumThresholdScharr(1) = accuracyCoherentSumScharr;
            bestAccuracyThresholdScharr = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdScharr(2)<precisionCoherentSumScharr
            bestMetricsCoherentSumThresholdScharr(2) = precisionCoherentSumScharr;
            bestPrecisionThresholdScharr = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdScharr(3)<recallCoherentSumScharr
            bestMetricsCoherentSumThresholdScharr(3) = recallCoherentSumScharr;
            bestRecallThresholdScharr = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdScharr(4)<f1CoherentSumScharr
            bestMetricsCoherentSumThresholdScharr(4) = f1CoherentSumScharr;
            bestF1ThresholdScharr = thresholds(iThreshold);
        end
        %Argyle
        [accuracyCoherentSumArgyle, precisionCoherentSumArgyle, recallCoherentSumArgyle, f1CoherentSumArgyle] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapArgyle,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdArgyle(1)<accuracyCoherentSumArgyle
            bestMetricsCoherentSumThresholdArgyle(1) = accuracyCoherentSumArgyle;
            bestAccuracyThresholdArgyle = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdArgyle(2)<precisionCoherentSumArgyle
            bestMetricsCoherentSumThresholdArgyle(2) = precisionCoherentSumArgyle;
            bestPrecisionThresholdArgyle = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdArgyle(3)<recallCoherentSumArgyle
            bestMetricsCoherentSumThresholdArgyle(3) = recallCoherentSumArgyle;
            bestRecallThresholdArgyle = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdArgyle(4)<f1CoherentSumArgyle
            bestMetricsCoherentSumThresholdArgyle(4) = f1CoherentSumArgyle;
            bestF1ThresholdArgyle = thresholds(iThreshold);
        end
        %Macleod
        [accuracyCoherentSumMacleod, precisionCoherentSumMacleod, recallCoherentSumMacleod, f1CoherentSumMacleod] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapMacleod,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdMacleod(1)<accuracyCoherentSumMacleod
            bestMetricsCoherentSumThresholdMacleod(1) = accuracyCoherentSumMacleod;
            bestAccuracyThresholdMacleod = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdMacleod(2)<precisionCoherentSumMacleod
            bestMetricsCoherentSumThresholdMacleod(2) = precisionCoherentSumMacleod;
            bestPrecisionThresholdMacleod = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdMacleod(3)<recallCoherentSumMacleod
            bestMetricsCoherentSumThresholdMacleod(3) = recallCoherentSumMacleod;
            bestRecallThresholdMacleod = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdMacleod(4)<f1CoherentSumMacleod
            bestMetricsCoherentSumThresholdMacleod(4) = f1CoherentSumMacleod;
            bestF1ThresholdMacleod = thresholds(iThreshold);
        end
        %PDDO Kernel
        [accuracyCoherentSumPDDOKernel, precisionCoherentSumPDDOKernel, recallCoherentSumPDDOKernel, f1CoherentSumPDDOKernel] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapPDDOKernel,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdPDDOKernel(1)<accuracyCoherentSumPDDOKernel
            bestMetricsCoherentSumThresholdPDDOKernel(1) = accuracyCoherentSumPDDOKernel;
            bestAccuracyThresholdPDDOKernel = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdPDDOKernel(2)<precisionCoherentSumPDDOKernel
            bestMetricsCoherentSumThresholdPDDOKernel(2) = precisionCoherentSumPDDOKernel;
            bestPrecisionThresholdPDDOKernel = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdPDDOKernel(3)<recallCoherentSumPDDOKernel
            bestMetricsCoherentSumThresholdPDDOKernel(3) = recallCoherentSumPDDOKernel;
            bestRecallThresholdPDDOKernel = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdPDDOKernel(4)<f1CoherentSumPDDOKernel
            bestMetricsCoherentSumThresholdPDDOKernel(4) = f1CoherentSumPDDOKernel;
            bestF1ThresholdPDDOKernel = thresholds(iThreshold);
        end
        %Fuzzy PDDO
        [accuracyCoherentSumFuzzyPDDO, precisionCoherentSumFuzzyPDDO, recallCoherentSumFuzzyPDDO, f1CoherentSumFuzzyPDDO] =... 
            thresholdAndCalculateMetricsForCoherentSumImage(finalEdgeMapFuzzyPDDO,imageTruth,thresholds(iThreshold));
        if bestMetricsCoherentSumThresholdFuzzyPDDO(1)<accuracyCoherentSumFuzzyPDDO
            bestMetricsCoherentSumThresholdFuzzyPDDO(1) = accuracyCoherentSumFuzzyPDDO;
            bestAccuracyThresholdFuzzyPDDO = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdFuzzyPDDO(2)<precisionCoherentSumFuzzyPDDO
            bestMetricsCoherentSumThresholdFuzzyPDDO(2) = precisionCoherentSumFuzzyPDDO;
            bestPrecisionThresholdFuzzyPDDO = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdFuzzyPDDO(3)<recallCoherentSumFuzzyPDDO
            bestMetricsCoherentSumThresholdFuzzyPDDO(3) = recallCoherentSumFuzzyPDDO;
            bestRecallThresholdFuzzyPDDO = thresholds(iThreshold);
        end
        if bestMetricsCoherentSumThresholdFuzzyPDDO(4)<f1CoherentSumFuzzyPDDO
            bestMetricsCoherentSumThresholdFuzzyPDDO(4) = f1CoherentSumFuzzyPDDO;
            bestF1ThresholdFuzzyPDDO = thresholds(iThreshold);
        end
    end
end
%% Plots of metrics of coherent sum images
if plotMetricsCoherentSum
    %Accuracy 
    x = [1 2 3 4 5 6 7];
    figure; scatter(x(1), bestMetricsCoherentSumThresholdSobel(1), 'black', 'filled')
    hold on;
    scatter(x(2),bestMetricsCoherentSumThresholdPrewitt(1), 'black', 'filled')
    scatter(x(3),bestMetricsCoherentSumThresholdScharr(1), 'black', 'filled')
    scatter(x(4),bestMetricsCoherentSumThresholdPDDOKernel(1), 'black', 'filled')
    scatter(x(5),bestMetricsCoherentSumThresholdMacleod(1), 'black', 'filled')
    scatter(x(6),bestMetricsCoherentSumThresholdArgyle(1), 'black', 'filled')
    scatter(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(1), 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('Accuracy (Coherent Sum)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),bestMetricsCoherentSumThresholdSobel(1),bestMetricsCoherentSumThresholdSobel(1) ,'E',0.1);
    labelpoints(x(2) ,bestMetricsCoherentSumThresholdPrewitt(1),bestMetricsCoherentSumThresholdPrewitt(1) ,'E',0.1)
    labelpoints(x(3) ,bestMetricsCoherentSumThresholdScharr(1),bestMetricsCoherentSumThresholdScharr(1) ,'E',0.1)
    labelpoints(x(4),bestMetricsCoherentSumThresholdPDDOKernel(1),bestMetricsCoherentSumThresholdPDDOKernel(1) ,'E',0.1)
    labelpoints(x(5),bestMetricsCoherentSumThresholdMacleod(1),bestMetricsCoherentSumThresholdMacleod(1) ,'E',0.1)
    labelpoints(x(6),bestMetricsCoherentSumThresholdArgyle(1),bestMetricsCoherentSumThresholdArgyle(1) ,'E',0.1)
    labelpoints(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(1),bestMetricsCoherentSumThresholdFuzzyPDDO(1) ,'E',0.1)
    legend("ThresholdSobel = "+num2str(bestAccuracyThresholdSobel),"ThresholdPrewitt = "+num2str(bestAccuracyThresholdPrewitt),...
        "ThresholdScharr = "+num2str(bestAccuracyThresholdScharr),"ThresholdPDDOKernel = "+num2str(bestAccuracyThresholdPDDOKernel),...
        "ThresholdArgyle = "+num2str(bestAccuracyThresholdMacleod),"Threshold = "+num2str(bestAccuracyThresholdArgyle),...
        "ThresholdFuzzyPDDO = "+num2str(bestAccuracyThresholdFuzzyPDDO));
    %Precision
    figure; scatter(x(1), bestMetricsCoherentSumThresholdSobel(2), 'black', 'filled')
    hold on;
    scatter(x(2),bestMetricsCoherentSumThresholdPrewitt(2), 'black', 'filled')
    scatter(x(3),bestMetricsCoherentSumThresholdScharr(2), 'black', 'filled')
    scatter(x(4),bestMetricsCoherentSumThresholdPDDOKernel(2), 'black', 'filled')
    scatter(x(5),bestMetricsCoherentSumThresholdMacleod(2), 'black', 'filled')
    scatter(x(6),bestMetricsCoherentSumThresholdArgyle(2), 'black', 'filled')
    scatter(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(2), 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('Precision (Coherent Sum)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),bestMetricsCoherentSumThresholdSobel(2),bestMetricsCoherentSumThresholdSobel(2) ,'E',0.1);
    labelpoints(x(2) ,bestMetricsCoherentSumThresholdPrewitt(2),bestMetricsCoherentSumThresholdPrewitt(2) ,'E',0.1)
    labelpoints(x(3) ,bestMetricsCoherentSumThresholdScharr(2),bestMetricsCoherentSumThresholdScharr(2) ,'E',0.1)
    labelpoints(x(4),bestMetricsCoherentSumThresholdPDDOKernel(2),bestMetricsCoherentSumThresholdPDDOKernel(2) ,'E',0.1)
    labelpoints(x(5),bestMetricsCoherentSumThresholdMacleod(2),bestMetricsCoherentSumThresholdMacleod(2) ,'E',0.1)
    labelpoints(x(6),bestMetricsCoherentSumThresholdArgyle(2),bestMetricsCoherentSumThresholdArgyle(2) ,'E',0.1)
    labelpoints(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(2),bestMetricsCoherentSumThresholdFuzzyPDDO(2) ,'E',0.1)
    legend("ThresholdSobel = "+num2str(bestPrecisionThresholdSobel),"ThresholdPrewitt = "+num2str(bestPrecisionThresholdPrewitt),...
        "ThresholdScharr = "+num2str(bestPrecisionThresholdScharr),"ThresholdPDDOKernel = "+num2str(bestPrecisionThresholdPDDOKernel),...
        "ThresholdArgyle = "+num2str(bestPrecisionThresholdMacleod),"Threshold = "+num2str(bestPrecisionThresholdArgyle),...
        "ThresholdFuzzyPDDO = "+num2str(bestPrecisionThresholdFuzzyPDDO));
    %Recall
    figure; scatter(x(1), bestMetricsCoherentSumThresholdSobel(3), 'black', 'filled')
    hold on;
    scatter(x(2),bestMetricsCoherentSumThresholdPrewitt(3), 'black', 'filled')
    scatter(x(3),bestMetricsCoherentSumThresholdScharr(3), 'black', 'filled')
    scatter(x(4),bestMetricsCoherentSumThresholdPDDOKernel(3), 'black', 'filled')
    scatter(x(5),bestMetricsCoherentSumThresholdMacleod(3), 'black', 'filled')
    scatter(x(6),bestMetricsCoherentSumThresholdArgyle(3), 'black', 'filled')
    scatter(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(3), 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('Recall (Coherent Sum)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),bestMetricsCoherentSumThresholdSobel(3),bestMetricsCoherentSumThresholdSobel(3) ,'E',0.1);
    labelpoints(x(2) ,bestMetricsCoherentSumThresholdPrewitt(3),bestMetricsCoherentSumThresholdPrewitt(3) ,'E',0.1)
    labelpoints(x(3) ,bestMetricsCoherentSumThresholdScharr(3),bestMetricsCoherentSumThresholdScharr(3) ,'E',0.1)
    labelpoints(x(4),bestMetricsCoherentSumThresholdPDDOKernel(3),bestMetricsCoherentSumThresholdPDDOKernel(3) ,'E',0.1)
    labelpoints(x(5),bestMetricsCoherentSumThresholdMacleod(3),bestMetricsCoherentSumThresholdMacleod(3) ,'E',0.1)
    labelpoints(x(6),bestMetricsCoherentSumThresholdArgyle(3),bestMetricsCoherentSumThresholdArgyle(3) ,'E',0.1)
    labelpoints(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(3),bestMetricsCoherentSumThresholdFuzzyPDDO(3) ,'E',0.1)
    legend("ThresholdSobel = "+num2str(bestRecallThresholdSobel),"ThresholdPrewitt = "+num2str(bestRecallThresholdPrewitt),...
        "ThresholdScharr = "+num2str(bestRecallThresholdScharr),"ThresholdPDDOKernel = "+num2str(bestRecallThresholdPDDOKernel),...
        "ThresholdArgyle = "+num2str(bestRecallThresholdMacleod),"Threshold = "+num2str(bestRecallThresholdArgyle),...
        "ThresholdFuzzyPDDO = "+num2str(bestRecallThresholdFuzzyPDDO));
    
    %F1
    figure; scatter(x(1), bestMetricsCoherentSumThresholdSobel(4), 'black', 'filled')
    hold on;
    scatter(x(2),bestMetricsCoherentSumThresholdPrewitt(4), 'black', 'filled')
    scatter(x(3),bestMetricsCoherentSumThresholdScharr(4), 'black', 'filled')
    scatter(x(4),bestMetricsCoherentSumThresholdPDDOKernel(4), 'black', 'filled')
    scatter(x(5),bestMetricsCoherentSumThresholdMacleod(4), 'black', 'filled')
    scatter(x(6),bestMetricsCoherentSumThresholdArgyle(4), 'black', 'filled')
    scatter(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(4), 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('F1 (Coherent Sum)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),bestMetricsCoherentSumThresholdSobel(4),bestMetricsCoherentSumThresholdSobel(4) ,'E',0.1);
    labelpoints(x(2) ,bestMetricsCoherentSumThresholdPrewitt(4),bestMetricsCoherentSumThresholdPrewitt(4) ,'E',0.1)
    labelpoints(x(3) ,bestMetricsCoherentSumThresholdScharr(4),bestMetricsCoherentSumThresholdScharr(4) ,'E',0.1)
    labelpoints(x(4),bestMetricsCoherentSumThresholdPDDOKernel(4),bestMetricsCoherentSumThresholdPDDOKernel(4) ,'E',0.1)
    labelpoints(x(5),bestMetricsCoherentSumThresholdMacleod(4),bestMetricsCoherentSumThresholdMacleod(4) ,'E',0.1)
    labelpoints(x(6),bestMetricsCoherentSumThresholdArgyle(4),bestMetricsCoherentSumThresholdArgyle(4) ,'E',0.1)
    labelpoints(x(7),bestMetricsCoherentSumThresholdFuzzyPDDO(4),bestMetricsCoherentSumThresholdFuzzyPDDO(4) ,'E',0.1)
    legend("ThresholdSobel = "+num2str(bestF1ThresholdSobel),"ThresholdPrewitt = "+num2str(bestF1ThresholdPrewitt),...
        "ThresholdScharr = "+num2str(bestF1ThresholdScharr),"ThresholdPDDOKernel = "+num2str(bestF1ThresholdPDDOKernel),...
        "ThresholdArgyle = "+num2str(bestF1ThresholdMacleod),"Threshold = "+num2str(bestF1ThresholdArgyle),...
        "ThresholdFuzzyPDDO = "+num2str(bestF1ThresholdFuzzyPDDO));

end
%% Plots For All Thresholds
if plotMetrics
    %Accuracy 
    x = [1 2 3 4 5 6 7];
    figure; scatter(x(1), metricsSobel{maxAccuracyIdxSobel}.accuracy, 'black', 'filled')
    hold on;
    scatter(x(2),metricsPrewitt{maxAccuracyIdxPrewitt}.accuracy, 'black', 'filled')
    scatter(x(3),metricsScharr{maxAccuracyIdxScharr}.accuracy, 'black', 'filled')
    scatter(x(4),metricsPDDOKernel{maxAccuracyIdxPDDOKernel}.accuracy, 'black', 'filled')
    scatter(x(5),metricsMacleod{maxAccuracyIdxMacleod}.accuracy, 'black', 'filled')
    scatter(x(6),metricsArgyle{maxAccuracyIdxArgyle}.accuracy, 'black', 'filled')
    scatter(x(7),metricsFuzzyPDDO{maxAccuracyIdxFuzzyPDDO}.accuracy, 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('Accuracy (Best Threshold)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),metricsSobel{maxAccuracyIdxSobel}.accuracy,...
        metricsSobel{maxAccuracyIdxSobel}.accuracy ,'E',0.1)
    labelpoints(x(2) ,metricsPrewitt{maxAccuracyIdxPrewitt}.accuracy,...
        metricsPrewitt{maxAccuracyIdxPrewitt}.accuracy,'E',0.1)
    labelpoints(x(3) ,metricsScharr{maxAccuracyIdxScharr}.accuracy,...
        metricsScharr{maxAccuracyIdxScharr}.accuracy,'E',0.1)
    labelpoints(x(4),metricsPDDOKernel{maxAccuracyIdxPDDOKernel}.accuracy,...
        metricsPDDOKernel{maxAccuracyIdxPDDOKernel}.accuracy,'E',0.1)
    labelpoints(x(5),metricsMacleod{maxAccuracyIdxMacleod}.accuracy,...
        metricsMacleod{maxAccuracyIdxMacleod}.accuracy,'E',0.1)
    labelpoints(x(6),metricsArgyle{maxAccuracyIdxArgyle}.accuracy,...
        metricsArgyle{maxAccuracyIdxArgyle}.accuracy,'E',0.1)
    labelpoints(x(7),metricsFuzzyPDDO{maxAccuracyIdxFuzzyPDDO}.accuracy,...
        metricsFuzzyPDDO{maxAccuracyIdxFuzzyPDDO}.accuracy,'E',0.1)
    %Precision
    figure; scatter(x(1), metricsSobel{maxPrecisionIdxSobel}.precision, 'black', 'filled')
    hold on;
    scatter(x(2),metricsPrewitt{maxPrecisionIdxPrewitt}.precision, 'black', 'filled')
    scatter(x(3),metricsScharr{maxPrecisionIdxScharr}.precision, 'black', 'filled')
    scatter(x(4),metricsPDDOKernel{maxPrecisionIdxPDDOKernel}.precision, 'black', 'filled')
    scatter(x(5),metricsMacleod{maxPrecisionIdxMacleod}.precision, 'black', 'filled')
    scatter(x(6),metricsArgyle{maxPrecisionIdxArgyle}.precision, 'black', 'filled')
    scatter(x(7),metricsFuzzyPDDO{maxPrecisionIdxFuzzyPDDO}.precision, 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('Precision (Best Threshold)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),metricsSobel{maxPrecisionIdxSobel}.precision,...
        metricsSobel{maxPrecisionIdxSobel}.precision ,'E',0.1)
    labelpoints(x(2) ,metricsPrewitt{maxPrecisionIdxPrewitt}.precision,...
        metricsPrewitt{maxPrecisionIdxPrewitt}.precision,'E',0.1)
    labelpoints(x(3) ,metricsScharr{maxPrecisionIdxScharr}.precision,...
        metricsScharr{maxPrecisionIdxScharr}.precision,'E',0.1)
    labelpoints(x(4),metricsPDDOKernel{maxPrecisionIdxPDDOKernel}.precision,...
        metricsPDDOKernel{maxPrecisionIdxPDDOKernel}.precision,'E',0.1)
    labelpoints(x(5),metricsMacleod{maxPrecisionIdxMacleod}.precision,...
        metricsMacleod{maxPrecisionIdxMacleod}.precision,'E',0.1)
    labelpoints(x(6),metricsArgyle{maxPrecisionIdxArgyle}.precision,...
        metricsArgyle{maxPrecisionIdxArgyle}.precision,'E',0.1)
    labelpoints(x(7),metricsFuzzyPDDO{maxPrecisionIdxFuzzyPDDO}.precision,...
        metricsFuzzyPDDO{maxPrecisionIdxFuzzyPDDO}.precision,'E',0.1)
    
    %Recall
    figure; scatter(x(1), metricsSobel{maxRecallIdxSobel}.recall, 'black', 'filled')
    hold on;
    scatter(x(2),metricsPrewitt{maxRecallIdxPrewitt}.recall, 'black', 'filled')
    scatter(x(3),metricsScharr{maxRecallIdxScharr}.recall, 'black', 'filled')
    scatter(x(4),metricsPDDOKernel{maxRecallIdxPDDOKernel}.recall, 'black', 'filled')
    scatter(x(5),metricsMacleod{maxRecallIdxMacleod}.recall, 'black', 'filled')
    scatter(x(6),metricsArgyle{maxRecallIdxArgyle}.recall, 'black', 'filled')
    scatter(x(7),metricsFuzzyPDDO{maxRecallIdxFuzzyPDDO}.recall, 'black', 'filled')
    
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('Recall (Best Threshold)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),metricsSobel{maxRecallIdxSobel}.recall,...
        metricsSobel{maxRecallIdxSobel}.recall ,'E',0.1)
    labelpoints(x(2) ,metricsPrewitt{maxRecallIdxPrewitt}.recall,...
        metricsPrewitt{maxRecallIdxPrewitt}.recall,'E',0.1)
    labelpoints(x(3) ,metricsScharr{maxRecallIdxScharr}.recall,...
        metricsScharr{maxRecallIdxScharr}.recall,'E',0.1)
    labelpoints(x(4),metricsPDDOKernel{maxRecallIdxPDDOKernel}.recall,...
        metricsPDDOKernel{maxRecallIdxPDDOKernel}.recall,'E',0.1)
    labelpoints(x(5),metricsMacleod{maxRecallIdxMacleod}.recall,...
        metricsMacleod{maxRecallIdxMacleod}.recall,'E',0.1)
    labelpoints(x(6),metricsArgyle{maxRecallIdxArgyle}.recall,...
        metricsArgyle{maxRecallIdxArgyle}.recall,'E',0.1)
    labelpoints(x(7),metricsFuzzyPDDO{maxRecallIdxFuzzyPDDO}.recall,...
        metricsFuzzyPDDO{maxRecallIdxFuzzyPDDO}.recall,'E',0.1)
    
    
    %F1
    figure; scatter(x(1), metricsSobel{maxF1IdxSobel}.f1, 'black', 'filled')
    hold on;
    scatter(x(2),metricsPrewitt{maxF1IdxPrewitt}.f1, 'black', 'filled')
    scatter(x(3),metricsScharr{maxF1IdxScharr}.f1, 'black', 'filled')
    scatter(x(4),metricsPDDOKernel{maxF1IdxPDDOKernel}.f1, 'black', 'filled')
    scatter(x(5),metricsMacleod{maxF1IdxMacleod}.f1, 'black', 'filled')
    scatter(x(6),metricsArgyle{maxF1IdxArgyle}.f1, 'black', 'filled')
    scatter(x(7),metricsFuzzyPDDO{maxF1IdxFuzzyPDDO}.f1, 'black', 'filled')
    grid on;
    xlim([0.5 7.5])
    xticks([1 2 3 4 5 6 7])
    xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle', 'FuzzyPDDO'})
    title('F1 (Best Threshold)')
    xlabel('Edge Detection Method')
    ylabel('Score')
    labelpoints(x(1),metricsSobel{maxF1IdxSobel}.f1,...
        metricsSobel{maxF1IdxSobel}.f1 ,'E',0.1)
    labelpoints(x(2) ,metricsPrewitt{maxF1IdxPrewitt}.f1,...
        metricsPrewitt{maxF1IdxPrewitt}.f1,'E',0.1)
    labelpoints(x(3) ,metricsScharr{maxF1IdxScharr}.f1,...
        metricsScharr{maxF1IdxScharr}.f1,'E',0.1)
    labelpoints(x(4),metricsPDDOKernel{maxF1IdxPDDOKernel}.f1,...
        metricsPDDOKernel{maxF1IdxPDDOKernel}.f1,'E',0.1)
    labelpoints(x(5),metricsMacleod{maxF1IdxMacleod}.f1,...
        metricsMacleod{maxF1IdxMacleod}.f1,'E',0.1)
    labelpoints(x(6),metricsArgyle{maxF1IdxArgyle}.f1,...
        metricsArgyle{maxF1IdxArgyle}.f1,'E',0.1)
    labelpoints(x(7),metricsFuzzyPDDO{maxF1IdxFuzzyPDDO}.f1,...
        metricsFuzzyPDDO{maxF1IdxFuzzyPDDO}.f1,'E',0.1)
end

%% Plot Images
if plotBestMetricImagesFlag
    %F1
    figure; imagesc(imread(imagePathsMacleod(maxF1IdxPrewitt))); colormap gray; colorbar; title('F1 - Prewitt (Best Threshold)')
    figure; imagesc(imread(imagePathsArgyle(maxF1IdxArgyle))); colormap gray; colorbar; title('F1 - Argyle (Best Threshold)')
    figure; imagesc(imread(imagePathsSobel(maxF1IdxSobel))); colormap gray; colorbar; title('F1 - Sobel (Best Threshold)')
    figure; imagesc(imread(imagePathsScharr(maxF1IdxScharr))); colormap gray; colorbar; title('F1 - Scharr (Best Threshold)')
    figure; imagesc(imread(imagePathsPDDOKernel(maxF1IdxPDDOKernel))); colormap gray; colorbar; title('F1 - PDDOKernel (Best Threshold)')
    figure; imagesc(imread(imagePathsMacleod(maxF1IdxMacleod))); colormap gray; colorbar; title('F1 - Macleod (Best Threshold)')
    figure; imagesc(imread(imagePathsFuzzyPDDO(maxF1IdxFuzzyPDDO))); colormap gray; colorbar; title('F1 - FuzzyPDDO (Best Threshold)')
        
    %Recall
    figure; imagesc(imread(imagePathsPrewitt(maxRecallIdxPrewitt))); colormap gray; colorbar; title('Recall - Prewitt (Best Threshold)')
    figure; imagesc(imread(imagePathsArgyle(maxRecallIdxArgyle))); colormap gray; colorbar; title('Recall - Argyle (Best Threshold)')
    figure; imagesc(imread(imagePathsSobel(maxRecallIdxSobel))); colormap gray; colorbar; title('Recall - Sobel (Best Threshold)')
    figure; imagesc(imread(imagePathsScharr(maxRecallIdxScharr))); colormap gray; colorbar; title('Recall - Scharr (Best Threshold)')
    figure; imagesc(imread(imagePathsPDDOKernel(maxRecallIdxPDDOKernel))); colormap gray; colorbar; title('Recall - PDDOKernel (Best Threshold)')
    figure; imagesc(imread(imagePathsMacleod(maxRecallIdxMacleod))); colormap gray; colorbar; title('Recall - Macleod (Best Threshold)')
    figure; imagesc(imread(imagePathsFuzzyPDDO(maxRecallIdxFuzzyPDDO))); colormap gray; colorbar; title('Recall - FuzzyPDDO (Best Threshold)')
    
    %Precision
    figure; imagesc(imread(imagePathsPrewitt(maxPrecisionIdxPrewitt))); colormap gray; colorbar; title('Precision - Prewitt (Best Threshold)')
    figure; imagesc(imread(imagePathsArgyle(maxPrecisionIdxArgyle))); colormap gray; colorbar; title('Precision - Argyle (Best Threshold)')
    figure; imagesc(imread(imagePathsSobel(maxPrecisionIdxSobel))); colormap gray; colorbar; title('Precision - Sobel (Best Threshold)')
    figure; imagesc(imread(imagePathsScharr(maxPrecisionIdxScharr))); colormap gray; colorbar; title('Precision - Scharr (Best Threshold)')
    figure; imagesc(imread(imagePathsPDDOKernel(maxPrecisionIdxPDDOKernel))); colormap gray; colorbar; title('Precision - PDDOKernel (Best Threshold)')
    figure; imagesc(imread(imagePathsMacleod(maxPrecisionIdxMacleod))); colormap gray; colorbar; title('Precision - Macleod (Best Threshold)')
    figure; imagesc(imread(imagePathsFuzzyPDDO(maxPrecisionIdxFuzzyPDDO))); colormap gray; colorbar; title('Precision - FuzzyPDDO (Best Threshold)')

    %Accuracy
    figure; imagesc(imread(imagePathsPrewitt(maxAccuracyIdxPrewitt))); colormap gray; colorbar; title('Accuracy - Prewitt (Best Threshold)')
    figure; imagesc(imread(imagePathsArgyle(maxAccuracyIdxArgyle))); colormap gray; colorbar; title('Accuracy - Argyle (Best Threshold)')
    figure; imagesc(imread(imagePathsSobel(maxAccuracyIdxSobel))); colormap gray; colorbar; title('Accuracy - Sobel (Best Threshold)')
    figure; imagesc(imread(imagePathsScharr(maxAccuracyIdxScharr))); colormap gray; colorbar; title('Accuracy - Scharr (Best Threshold)')
    figure; imagesc(imread(imagePathsPDDOKernel(maxAccuracyIdxPDDOKernel))); colormap gray; colorbar; title('Accuracy - PDDOKernel (Best Threshold)')
    figure; imagesc(imread(imagePathsMacleod(maxAccuracyIdxMacleod))); colormap gray; colorbar; title('Accuracy - Macleod (Best Threshold)')
    figure; imagesc(imread(imagePathsFuzzyPDDO(maxAccuracyIdxFuzzyPDDO))); colormap gray; colorbar; title('Accuracy - FuzzyPDDO (Best Threshold)')
end

