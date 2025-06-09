clear all;
close all;

addpath('./helperFunctions/')
addpath('./edgeDetectorMethods/Sobel')
addpath('./edgeDetectorMethods/Macleod')
addpath('./edgeDetectorMethods/PDDOKernel')
addpath('./edgeDetectorMethods/Prewitt')
addpath('./edgeDetectorMethods/Scharr')
addpath('./edgeDetectorMethods/Argyle')
addpath('./edgeDetectorMethods/FuzzyPDDO')
outputFolderPath = "../data/output/noiseSensitivity/";

%Plot all figures for analysis
plotFigures = true;

%Create synthetic image
image=zeros(800,800,'uint8');
image(390:401,200:600) = 255;

%Truth Image
imageTruth=zeros(800,800,'uint8');
imageTruth(390:401,199:201) = 255;
imageTruth(390:401,599:601) = 255;
imageTruth(389:391,200:600) = 255;
imageTruth(400:402,200:600) = 255;

%Normalizing image
image = im2double(image);
imageTruth = im2double(imageTruth);

%AddNoise
noise_variance = 0.3;
image = imnoise(image,'gaussian',0,noise_variance);

%Define Thresholds
[thresholds] = calculateThresholds(0,1.0,0.01);

%Kernel Variables
%Placeholders for Sobel, Prewitt and Scharr since
%calculateAndSaveGradientEdgeMaps needs those inputs
sigma1 = 1;
sigma2 = 1;
kernelDimension = 11;

%Sobel
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Sobel', image,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsSobel = extractImagePaths(outputFolderPath,'Sobel');
tpPerThresholdedImagesSobel = compareThresholdedImagesToTruth(imagePathsSobel,imageTruth);
[finalEdgeMapSobel] = addAndThresholdEdgeMaps(imagePathsSobel,'None',false);

%Prewitt
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Prewitt', image,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsPrewitt = extractImagePaths(outputFolderPath,'Prewitt');
tpPerThresholdedImagesPrewitt = compareThresholdedImagesToTruth(imagePathsPrewitt,imageTruth);
[finalEdgeMapPrewitt] = addAndThresholdEdgeMaps(imagePathsPrewitt,'None',false);

%Scharr
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Scharr', image,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsScharr = extractImagePaths(outputFolderPath,'Scharr');
tpPerThresholdedImagesScharr = compareThresholdedImagesToTruth(imagePathsScharr,imageTruth);
[finalEdgeMapScharr] = addAndThresholdEdgeMaps(imagePathsScharr,'None',false);

%Macleod
%Kernel Variables
sigma1 = 1;
sigma2 = 1;
kernelDimension = 11;
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Macleod', image,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsMacleod = extractImagePaths(outputFolderPath,'Macleod');
tpPerThresholdedImagesMacleod = compareThresholdedImagesToTruth(imagePathsMacleod,imageTruth);
[finalEdgeMapMacleod] = addAndThresholdEdgeMaps(imagePathsMacleod,'None',false);

%Argyle
%Kernel Variables
sigma1 = 2;
sigma2 = 2;
kernelDimension = 5;
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'Argyle', image,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsArgyle = extractImagePaths(outputFolderPath,'Argyle');
tpPerThresholdedImagesArgyle = compareThresholdedImagesToTruth(imagePathsArgyle,imageTruth);
[finalEdgeMapArgyle] = addAndThresholdEdgeMaps(imagePathsArgyle,'None',false);

%PDDO Kernel
%Kernel Variables
sigma1 = 2;
sigma2 = 2;
kernelDimension = 11;
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'PDDOKernel', image,sigma1,sigma2,kernelDimension,kernelDimension);
imagePathsPDDOKernel = extractImagePaths(outputFolderPath,'PDDOKernel');
tpPerThresholdedImagesPDDOKernel = compareThresholdedImagesToTruth(imagePathsPDDOKernel,imageTruth);
[finalEdgeMapPDDOKernel] = addAndThresholdEdgeMaps(imagePathsPDDOKernel,'None',false);

%FuzzyPDDO
%Kernel Variables
%Same as PDDO Kernel
calculateAndSaveGradientEdgeMaps(thresholds,outputFolderPath,'FuzzyPDDO', image,2,2,kernelDimension,kernelDimension);
imagePathsFuzzyPDDO = extractImagePaths(outputFolderPath,'FuzzyPDDO');
tpPerThresholdedImagesFuzzyPDDO = compareThresholdedImagesToTruth(imagePathsFuzzyPDDO,imageTruth);
[finalEdgeMapFuzzyPDDO] = addAndThresholdEdgeMaps(imagePathsFuzzyPDDO,'None',false);

%% Plots
if plotFigures
    %Sobel
    figure; imagesc(finalEdgeMapSobel(8:end-7,8:end-7)); colormap gray; colorbar; title('Sobel')
    figure; imagesc(db(finalEdgeMapSobel(8:end-7,8:end-7))); colorbar; title('Sobel (dB)')
    figure; histogram(finalEdgeMapSobel(8:end-7,8:end-7)); title('Sobel')
    figure; plot(thresholds,tpPerThresholdedImagesSobel,'-o'); title('True Positives per Threshold (Sobel)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;
    
    %Prewitt
    figure; imagesc(finalEdgeMapPrewitt(8:end-7,8:end-7)); colormap gray; colorbar; title('Prewitt')
    figure; imagesc(db(finalEdgeMapPrewitt(8:end-7,8:end-7))); colorbar; title('Prewitt (dB)')
    figure; histogram(finalEdgeMapPrewitt(8:end-7,8:end-7)); title('Prewitt')
    figure; plot(thresholds,tpPerThresholdedImagesPrewitt,'-o'); title('True Positives per Threshold (Prewitt)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;

    %Scharr
    figure; imagesc(finalEdgeMapScharr(8:end-7,8:end-7)); colormap gray; colorbar; title('Scharr')
    figure; imagesc(db(finalEdgeMapScharr(8:end-7,8:end-7))); colorbar; title('Scharr (dB)')
    figure; histogram(finalEdgeMapScharr(8:end-7,8:end-7)); title('Scharr')
    figure; plot(thresholds,tpPerThresholdedImagesScharr,'-o'); title('True Positives per Threshold (Scharr)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;

    %Macleod
    figure; imagesc(finalEdgeMapMacleod(8:end-7,8:end-7)); colormap gray; colorbar; title('Macleod')
    figure; imagesc(db(finalEdgeMapMacleod(8:end-7,8:end-7))); colorbar; title('Macleod (dB)')
    figure; histogram(finalEdgeMapMacleod(8:end-7,8:end-7)); title('Macleod')
    figure; plot(thresholds,tpPerThresholdedImagesMacleod,'-o'); title('True Positives per Threshold (Macleod)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;

    %Argyle
    figure; imagesc(finalEdgeMapArgyle(8:end-7,8:end-7)); colormap gray; colorbar; title('Argyle')
    figure; imagesc(db(finalEdgeMapArgyle(8:end-7,8:end-7))); colorbar; title('Argyle (dB)')
    figure; histogram(finalEdgeMapArgyle(8:end-7,8:end-7)); title('Argyle')
    figure; plot(thresholds,tpPerThresholdedImagesArgyle,'-o'); title('True Positives per Threshold (Argyle)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;

    %PDDO Kernel
    figure; imagesc(finalEdgeMapPDDOKernel(8:end-7,8:end-7)); colormap gray; colorbar; title('PDDOKernel')
    figure; imagesc(db(finalEdgeMapPDDOKernel(8:end-7,8:end-7))); colorbar; title('PDDOKernel (dB)')
    figure; histogram(finalEdgeMapPDDOKernel(8:end-7,8:end-7)); title('PDDOKernel')
    figure; plot(thresholds,tpPerThresholdedImagesPDDOKernel,'-o'); title('True Positives per Threshold (PDDOKernel)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;

    %FuzzyPDDO
    figure; imagesc(finalEdgeMapFuzzyPDDO(8:end-7,8:end-7)); colormap gray; colorbar; title('FuzzyPDDO')
    figure; imagesc(db(finalEdgeMapFuzzyPDDO(8:end-7,8:end-7))); colorbar; title('FuzzyPDDO (dB)')
    figure; histogram(finalEdgeMapFuzzyPDDO(8:end-7,8:end-7)); title('FuzzyPDDO')
    figure; plot(thresholds,tpPerThresholdedImagesFuzzyPDDO,'-o'); title('True Positives per Threshold (FuzzyPDDO)')
    xlabel('Threshold (idx)');
    ylabel('TP (Number Pixels)');
    grid on;


end

