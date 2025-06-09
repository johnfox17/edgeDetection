
%NOTES:
%
clear all;
close all
clc;
addpath('./helperFunctions/')
addpath('./edgeDetectorMethods/Sobel')
addpath('./edgeDetectorMethods/Macleod')
addpath('./edgeDetectorMethods/PDDOKernel')
addpath('./edgeDetectorMethods/Prewitt')
addpath('./edgeDetectorMethods/Scharr')
addpath('./edgeDetectorMethods/Argyle')
addpath('./edgeDetectorMethods/FuzzyPDDO')
outputFolderPath = "../data/output/edgeOrientationSensitivity";

%Create synthetic image
image=zeros(800,800,'uint8');
image(400,200:600) = 255;

%Calculate Thresholds
[thresholds] = calculateThresholds(0,1.0,0.01);

%Normalizing image
image = im2double(image);
%% Sigma1 = 1 and Sigma2 = 1, kernelDimension = 11x11 
sigma1 = 1;
sigma2 = 1;
kernelDimension = 11;
image1 = image;
%Sobel
[gradientMagSobel_0] = sobelEdgeDetector(image1);
[gradientEdgeMapSobel_0, gradientMagnitudeSobel_0] = detectEdges(gradientMagSobel_0, 0.5);
%Prewitt
[gradientMagPrewitt_0] = prewittEdgeDetector(image1);
[gradientEdgeMapPrewitt_0, gradientMagnitudePrewitt_0] = detectEdges(gradientMagPrewitt_0, 0.5);
%Scharr
[gradientMagScharr_0] = scharrEdgeDetector(image1);
[gradientEdgeMapScharr_0, gradientMagnitudeScharr_0] = detectEdges(gradientMagScharr_0, 0.5);
%Macleod
[gradientMagMacleod_0] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_0, gradientMagnitudeMacleod_0] = detectEdges(gradientMagMacleod_0, 0.25);
%Argyle
[gradientMagArgyle_0] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_0, gradientMagnitudeArgyle_0] = detectEdges(gradientMagArgyle_0, 0.4);
%PDDO Kernel
[gradientMagPDDOKernel_0,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_0, gradientMagnitudePDDOKernel_0] = detectEdges(gradientMagPDDOKernel_0, 0.6);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_0] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_0, gradientMagnitudeFuzzyPDDO_0] = detectEdges(gradientMagFuzzyPDDO_0, 0.6);

%% Rotate Image 15 degrees
image1 = imrotate(image,15,'crop');
%Sobel
[gradientMagSobel_15] = sobelEdgeDetector(image1);
[gradientEdgeMapSobel_15, gradientMagnitudeSobel_15] = detectEdges(gradientMagSobel_15, 0.39);
%Prewitt
[gradientMagPrewitt_15] = prewittEdgeDetector(image1);
[gradientEdgeMapPrewitt_15, gradientMagnitudePrewitt_15] = detectEdges(gradientMagPrewitt_15, 0.3);
%Scharr
[gradientMagScharr_15] = scharrEdgeDetector(image1);
[gradientEdgeMapScharr_15, gradientMagnitudeScharr_15] = detectEdges(gradientMagScharr_15, 0.4);
%Macleod
[gradientMagMacleod_15] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_15, gradientMagnitudeMacleod_15] = detectEdges(gradientMagMacleod_15, 0.21);
%Argyle
[gradientMagArgyle_15] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_15, gradientMagnitudeArgyle_15] = detectEdges(gradientMagArgyle_15, 0.14);
%PDDO Kernel
[gradientMagPDDOKernel_15,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_15, gradientMagnitudePDDOKernel_15] = detectEdges(gradientMagPDDOKernel_15, 0.49);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_15] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_15, gradientMagnitudeFuzzyPDDO_15] = detectEdges(gradientMagFuzzyPDDO_15, 0.49);

%% Rotate Image 30 degrees
image1 = imrotate(image,30,'crop');
%Sobel
[gradientMagSobel_30] = sobelEdgeDetector(image1);
[gradientEdgeMapSobel_30, gradientMagnitudeSobel_30] = detectEdges(gradientMagSobel_30, 0.39);
%Prewitt
[gradientMagPrewitt_30] = prewittEdgeDetector(image1);
[gradientEdgeMapPrewitt_30, gradientMagnitudePrewitt_30] = detectEdges(gradientMagPrewitt_30, 0.3);
%Scharr
[gradientMagScharr_30] = scharrEdgeDetector(image1);
[gradientEdgeMapScharr_30, gradientMagnitudeScharr_30] = detectEdges(gradientMagScharr_30, 0.33);
%Macleod
[gradientMagMacleod_30] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_30, gradientMagnitudeMacleod_30] = detectEdges(gradientMagMacleod_30, 0.18);
%Argyle
[gradientMagArgyle_30] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_30, gradientMagnitudeArgyle_30] = detectEdges(gradientMagArgyle_30, 0.09);
%PDDO Kernel
[gradientMagPDDOKernel_30,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_30, gradientMagnitudePDDOKernel_30] = detectEdges(gradientMagPDDOKernel_30, 0.4);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_30] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_30, gradientMagnitudeFuzzyPDDO_30] = detectEdges(gradientMagFuzzyPDDO_30, 0.4);


%% Rotate Image 45 degrees
image1 = imrotate(image,45,'crop');
%Sobel
[gradientMagSobel_45] = sobelEdgeDetector(image1);
[gradientEdgeMapSobel_45, gradientMagnitudeSobel_45] = detectEdges(gradientMagSobel_45, 0.35);
%Prewitt
[gradientMagPrewitt_45] = prewittEdgeDetector(image1);
[gradientEdgeMapPrewitt_45, gradientMagnitudePrewitt_45] = detectEdges(gradientMagPrewitt_45, 0.23);
%Scharr
[gradientMagScharr_45] = scharrEdgeDetector(image1);
[gradientEdgeMapScharr_45, gradientMagnitudeScharr_45] = detectEdges(gradientMagScharr_45, 0.44);
%Macleod
[gradientMagMacleod_45] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_45, gradientMagnitudeMacleod_45] = detectEdges(gradientMagMacleod_45, 0.19);
%Argyle
[gradientMagArgyle_45] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_45, gradientMagnitudeArgyle_45] = detectEdges(gradientMagArgyle_45, 0.06);
%PDDO Kernel
[gradientMagPDDOKernel_45,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_45, gradientMagnitudePDDOKernel_45] = detectEdges(gradientMagPDDOKernel_45, 0.42);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_45] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_45, gradientMagnitudeFuzzyPDDO_45] = detectEdges(gradientMagFuzzyPDDO_45, 0.42);


angleResponse_Sobel_15 = max(gradientMagnitudeSobel_15,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_30 = max(gradientMagnitudeSobel_30,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_45 = max(gradientMagnitudeSobel_45,[],"all")/max(gradientMagnitudeSobel_0,[],"all");

angleResponse_Prewitt_15 = max(gradientMagnitudePrewitt_15,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_30 = max(gradientMagnitudePrewitt_30,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_45 = max(gradientMagnitudePrewitt_45,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");

angleResponse_Scharr_15 = max(gradientMagnitudeScharr_15,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_30 = max(gradientMagnitudeScharr_30,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_45 = max(gradientMagnitudeScharr_45,[],"all")/max(gradientMagnitudeScharr_0,[],"all");

angleResponse_Macleod_15 = max(gradientMagnitudeMacleod_15,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_30 = max(gradientMagnitudeMacleod_30,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_45 = max(gradientMagnitudeMacleod_45,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");

angleResponse_Argyle_15 = max(gradientMagnitudeArgyle_15,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_30 = max(gradientMagnitudeArgyle_30,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_45 = max(gradientMagnitudeArgyle_45,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");

angleResponse_PDDO_15 = max(gradientMagnitudePDDOKernel_15,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_30 = max(gradientMagnitudePDDOKernel_30,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_45 = max(gradientMagnitudePDDOKernel_45,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");

x = [1 2 3 4 5 6];
ySobel =[angleResponse_Sobel_15 angleResponse_Sobel_30 angleResponse_Sobel_45];
yPrewitt =[angleResponse_Prewitt_15 angleResponse_Prewitt_30 angleResponse_Prewitt_45];
yScharr =[angleResponse_Scharr_15 angleResponse_Scharr_30 angleResponse_Scharr_45];
yPDDO =[angleResponse_PDDO_15 angleResponse_PDDO_30 angleResponse_PDDO_45];
yMacleod =[angleResponse_Macleod_15 angleResponse_Macleod_30 angleResponse_Macleod_45];
yArgyle =[angleResponse_Argyle_15 angleResponse_Argyle_30 angleResponse_Argyle_45];

figure; scatter(x(1), ySobel(1), 'red', 'filled')
hold on;
scatter(x(1),ySobel(2), 'black', 'filled')
scatter(x(1),ySobel(3), 'blue', 'filled')
scatter(x(2),yPrewitt(1), 'red', 'filled')
scatter(x(2),yPrewitt(2), 'black', 'filled')
scatter(x(2),yPrewitt(3), 'blue', 'filled')
scatter(x(3),yScharr(1), 'red', 'filled')
scatter(x(3),yScharr(2), 'black', 'filled')
scatter(x(3),yScharr(3), 'blue', 'filled')
scatter(x(4),yPDDO(1), 'red', 'filled')
scatter(x(4),yPDDO(2), 'black', 'filled')
scatter(x(4),yPDDO(3), 'blue', 'filled') 
scatter(x(5),yMacleod(1), 'red', 'filled')
scatter(x(5),yMacleod(2), 'black', 'filled')
scatter(x(5),yMacleod(3), 'blue', 'filled')
scatter(x(6),yArgyle(1), 'red', 'filled')
scatter(x(6),yArgyle(2), 'black', 'filled')
scatter(x(6),yArgyle(3), 'blue', 'filled')

grid on;
xlim([0.5 6.5])
ylim([0.0 1.3])
xticks([1 2 3 4 5 6 ])
xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle'})
title('Isotropy Test (sigma1 = 1, sigma2 = 1, kernelDim = 11x11)')
xlabel('Edge Detection Method')
ylabel('Angle Response')
legend('15 Degrees','30 Degrees','45 Degrees');
labelpoints([x(1) x(1) x(1)],ySobel,ySobel,'E',0.1)
labelpoints([x(2) x(2) x(2)],yPrewitt,yPrewitt,'E',0.1)
labelpoints([x(3) x(3) x(3)],yScharr,yScharr,'E',0.1)
labelpoints([x(5) x(5) x(5)],yMacleod,yMacleod,'E',0.1)
labelpoints([x(6) x(6) x(6)],yArgyle,yArgyle,'E',0.1)

labelpoints([x(4)],yPDDO(3),yPDDO(3),'E',0.1)
labelpoints([x(4)],yPDDO(2),yPDDO(2),'S',0.1)
labelpoints([x(4)],yPDDO(1),yPDDO(1),'N',0.1)
%fontsize(16,"points");

%% Sigma1 = 2 and Sigma2 = 1, kernelDimension = 11x11 
sigma1 = 2;
sigma2 = 2;
kernelDimension = 11;
image1 = image;
%Macleod
[gradientMagMacleod_0] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_0, gradientMagnitudeMacleod_0] = detectEdges(gradientMagMacleod_0, 0.13);
%Argyle
[gradientMagArgyle_0] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_0, gradientMagnitudeArgyle_0] = detectEdges(gradientMagArgyle_0, 0.22);
%PDDO Kernel
[gradientMagPDDOKernel_0,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_0, gradientMagnitudePDDOKernel_0] = detectEdges(gradientMagPDDOKernel_0, 0.31);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_0] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_0, gradientMagnitudeFuzzyPDDO_0] = detectEdges(gradientMagFuzzyPDDO_0, 0.6);

%% Rotate Image 15 degrees
image1 = imrotate(image,15,'crop');
%Macleod
[gradientMagMacleod_15] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_15, gradientMagnitudeMacleod_15] = detectEdges(gradientMagMacleod_15, 0.13);
%Argyle
[gradientMagArgyle_15] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_15, gradientMagnitudeArgyle_15] = detectEdges(gradientMagArgyle_15, 0.12);
%PDDO Kernel
[gradientMagPDDOKernel_15,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_15, gradientMagnitudePDDOKernel_15] = detectEdges(gradientMagPDDOKernel_15, 0.28);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_15] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_15, gradientMagnitudeFuzzyPDDO_15] = detectEdges(gradientMagFuzzyPDDO_15, 0.49);

%% Rotate Image 30 degrees
image1 = imrotate(image,30,'crop');
%Macleod
[gradientMagMacleod_30] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_30, gradientMagnitudeMacleod_30] = detectEdges(gradientMagMacleod_30, 0.13);
%Argyle
[gradientMagArgyle_30] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_30, gradientMagnitudeArgyle_30] = detectEdges(gradientMagArgyle_30, 0.09);
%PDDO Kernel
[gradientMagPDDOKernel_30,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_30, gradientMagnitudePDDOKernel_30] = detectEdges(gradientMagPDDOKernel_30, 0.27);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_30] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_30, gradientMagnitudeFuzzyPDDO_30] = detectEdges(gradientMagFuzzyPDDO_30, 0.4);


%% Rotate Image 45 degrees
image1 = imrotate(image,45,'crop');
%Macleod
[gradientMagMacleod_45] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_45, gradientMagnitudeMacleod_45] = detectEdges(gradientMagMacleod_45, 0.11);
%Argyle
[gradientMagArgyle_45] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_45, gradientMagnitudeArgyle_45] = detectEdges(gradientMagArgyle_45, 0.06);
%PDDO Kernel
[gradientMagPDDOKernel_45,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_45, gradientMagnitudePDDOKernel_45] = detectEdges(gradientMagPDDOKernel_45, 0.22);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_45] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_45, gradientMagnitudeFuzzyPDDO_45] = detectEdges(gradientMagFuzzyPDDO_45, 0.42);


angleResponse_Sobel_15 = max(gradientMagnitudeSobel_15,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_30 = max(gradientMagnitudeSobel_30,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_45 = max(gradientMagnitudeSobel_45,[],"all")/max(gradientMagnitudeSobel_0,[],"all");

angleResponse_Prewitt_15 = max(gradientMagnitudePrewitt_15,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_30 = max(gradientMagnitudePrewitt_30,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_45 = max(gradientMagnitudePrewitt_45,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");

angleResponse_Scharr_15 = max(gradientMagnitudeScharr_15,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_30 = max(gradientMagnitudeScharr_30,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_45 = max(gradientMagnitudeScharr_45,[],"all")/max(gradientMagnitudeScharr_0,[],"all");

angleResponse_Macleod_15 = max(gradientMagnitudeMacleod_15,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_30 = max(gradientMagnitudeMacleod_30,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_45 = max(gradientMagnitudeMacleod_45,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");

angleResponse_Argyle_15 = max(gradientMagnitudeArgyle_15,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_30 = max(gradientMagnitudeArgyle_30,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_45 = max(gradientMagnitudeArgyle_45,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");

angleResponse_PDDO_15 = max(gradientMagnitudePDDOKernel_15,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_30 = max(gradientMagnitudePDDOKernel_30,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_45 = max(gradientMagnitudePDDOKernel_45,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");

x = [1 2 3 4 5 6];
ySobel =[angleResponse_Sobel_15 angleResponse_Sobel_30 angleResponse_Sobel_45];
yPrewitt =[angleResponse_Prewitt_15 angleResponse_Prewitt_30 angleResponse_Prewitt_45];
yScharr =[angleResponse_Scharr_15 angleResponse_Scharr_30 angleResponse_Scharr_45];
yPDDO =[angleResponse_PDDO_15 angleResponse_PDDO_30 angleResponse_PDDO_45];
yMacleod =[angleResponse_Macleod_15 angleResponse_Macleod_30 angleResponse_Macleod_45];
yArgyle =[angleResponse_Argyle_15 angleResponse_Argyle_30 angleResponse_Argyle_45];

figure; scatter(x(1), ySobel(1), 'red', 'filled')
hold on;
scatter(x(1),ySobel(2), 'black', 'filled')
scatter(x(1),ySobel(3), 'blue', 'filled')
scatter(x(2),yPrewitt(1), 'red', 'filled')
scatter(x(2),yPrewitt(2), 'black', 'filled')
scatter(x(2),yPrewitt(3), 'blue', 'filled')
scatter(x(3),yScharr(1), 'red', 'filled')
scatter(x(3),yScharr(2), 'black', 'filled')
scatter(x(3),yScharr(3), 'blue', 'filled')
scatter(x(4),yPDDO(1), 'red', 'filled')
scatter(x(4),yPDDO(2), 'black', 'filled')
scatter(x(4),yPDDO(3), 'blue', 'filled') 
scatter(x(5),yMacleod(1), 'red', 'filled')
scatter(x(5),yMacleod(2), 'black', 'filled')
scatter(x(5),yMacleod(3), 'blue', 'filled')
scatter(x(6),yArgyle(1), 'red', 'filled')
scatter(x(6),yArgyle(2), 'black', 'filled')
scatter(x(6),yArgyle(3), 'blue', 'filled')

grid on;
xlim([0.5 6.5])
ylim([0.0 1.3])
xticks([1 2 3 4 5 6 ])
xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle'})
title('Isotropy Test (sigma1 = 2, sigma2 = 2, kernelDim = 11x11)')
xlabel('Edge Detection Method')
ylabel('Angle Response')
legend('15 Degrees','30 Degrees','45 Degrees');
labelpoints([x(1) x(1) x(1)],ySobel,ySobel,'E',0.1)
labelpoints([x(2) x(2) x(2)],yPrewitt,yPrewitt,'E',0.1)
labelpoints([x(3) x(3) x(3)],yScharr,yScharr,'E',0.1)
labelpoints([x(5) x(5) x(5)],yMacleod,yMacleod,'E',0.1)
labelpoints([x(6) x(6) x(6)],yArgyle,yArgyle,'E',0.1)

labelpoints([x(4)],yPDDO(3),yPDDO(3),'E',0.1)
labelpoints([x(4)],yPDDO(2),yPDDO(2),'S',0.1)
labelpoints([x(4)],yPDDO(1),yPDDO(1),'N',0.1)
%fontsize(16,"points");
%% Sigma1 = 1 and Sigma2 = 1, kernelDimension = 5x5 
sigma1 = 1;
sigma2 = 1;
kernelDimension = 5;
image1 = image;
%Macleod
[gradientMagMacleod_0] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_0, gradientMagnitudeMacleod_0] = detectEdges(gradientMagMacleod_0, 0.29);
%Argyle
[gradientMagArgyle_0] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_0, gradientMagnitudeArgyle_0] = detectEdges(gradientMagArgyle_0, 0.4);
%PDDO Kernel
[gradientMagPDDOKernel_0,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_0, gradientMagnitudePDDOKernel_0] = detectEdges(gradientMagPDDOKernel_0, 0.69);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_0] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_0, gradientMagnitudeFuzzyPDDO_0] = detectEdges(gradientMagFuzzyPDDO_0, 0.6);

%% Rotate Image 15 degrees
image1 = imrotate(image,15,'crop');
%Macleod
[gradientMagMacleod_15] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_15, gradientMagnitudeMacleod_15] = detectEdges(gradientMagMacleod_15, 0.22);
%Argyle
[gradientMagArgyle_15] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_15, gradientMagnitudeArgyle_15] = detectEdges(gradientMagArgyle_15, 0.21);
%PDDO Kernel
[gradientMagPDDOKernel_15,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_15, gradientMagnitudePDDOKernel_15] = detectEdges(gradientMagPDDOKernel_15, 0.46);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_15] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_15, gradientMagnitudeFuzzyPDDO_15] = detectEdges(gradientMagFuzzyPDDO_15, 0.49);

%% Rotate Image 30 degrees
image1 = imrotate(image,30,'crop');
%Macleod
[gradientMagMacleod_30] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_30, gradientMagnitudeMacleod_30] = detectEdges(gradientMagMacleod_30, 0.23);
%Argyle
[gradientMagArgyle_30] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_30, gradientMagnitudeArgyle_30] = detectEdges(gradientMagArgyle_30, 0.15);
%PDDO Kernel
[gradientMagPDDOKernel_30,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_30, gradientMagnitudePDDOKernel_30] = detectEdges(gradientMagPDDOKernel_30, 0.45);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_30] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_30, gradientMagnitudeFuzzyPDDO_30] = detectEdges(gradientMagFuzzyPDDO_30, 0.4);


%% Rotate Image 45 degrees
image1 = imrotate(image,45,'crop');
%Macleod
[gradientMagMacleod_45] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_45, gradientMagnitudeMacleod_45] = detectEdges(gradientMagMacleod_45, 0.21);
%Argyle
[gradientMagArgyle_45] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_45, gradientMagnitudeArgyle_45] = detectEdges(gradientMagArgyle_45, 0.14);
%PDDO Kernel
[gradientMagPDDOKernel_45,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_45, gradientMagnitudePDDOKernel_45] = detectEdges(gradientMagPDDOKernel_45, 0.44);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_45] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_45, gradientMagnitudeFuzzyPDDO_45] = detectEdges(gradientMagFuzzyPDDO_45, 0.42);


angleResponse_Sobel_15 = max(gradientMagnitudeSobel_15,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_30 = max(gradientMagnitudeSobel_30,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_45 = max(gradientMagnitudeSobel_45,[],"all")/max(gradientMagnitudeSobel_0,[],"all");

angleResponse_Prewitt_15 = max(gradientMagnitudePrewitt_15,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_30 = max(gradientMagnitudePrewitt_30,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_45 = max(gradientMagnitudePrewitt_45,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");

angleResponse_Scharr_15 = max(gradientMagnitudeScharr_15,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_30 = max(gradientMagnitudeScharr_30,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_45 = max(gradientMagnitudeScharr_45,[],"all")/max(gradientMagnitudeScharr_0,[],"all");

angleResponse_Macleod_15 = max(gradientMagnitudeMacleod_15,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_30 = max(gradientMagnitudeMacleod_30,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_45 = max(gradientMagnitudeMacleod_45,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");

angleResponse_Argyle_15 = max(gradientMagnitudeArgyle_15,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_30 = max(gradientMagnitudeArgyle_30,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_45 = max(gradientMagnitudeArgyle_45,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");

angleResponse_PDDO_15 = max(gradientMagnitudePDDOKernel_15,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_30 = max(gradientMagnitudePDDOKernel_30,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_45 = max(gradientMagnitudePDDOKernel_45,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");

x = [1 2 3 4 5 6];
ySobel =[angleResponse_Sobel_15 angleResponse_Sobel_30 angleResponse_Sobel_45];
yPrewitt =[angleResponse_Prewitt_15 angleResponse_Prewitt_30 angleResponse_Prewitt_45];
yScharr =[angleResponse_Scharr_15 angleResponse_Scharr_30 angleResponse_Scharr_45];
yPDDO =[angleResponse_PDDO_15 angleResponse_PDDO_30 angleResponse_PDDO_45];
yMacleod =[angleResponse_Macleod_15 angleResponse_Macleod_30 angleResponse_Macleod_45];
yArgyle =[angleResponse_Argyle_15 angleResponse_Argyle_30 angleResponse_Argyle_45];

figure; scatter(x(1), ySobel(1), 'red', 'filled')
hold on;
scatter(x(1),ySobel(2), 'black', 'filled')
scatter(x(1),ySobel(3), 'blue', 'filled')
scatter(x(2),yPrewitt(1), 'red', 'filled')
scatter(x(2),yPrewitt(2), 'black', 'filled')
scatter(x(2),yPrewitt(3), 'blue', 'filled')
scatter(x(3),yScharr(1), 'red', 'filled')
scatter(x(3),yScharr(2), 'black', 'filled')
scatter(x(3),yScharr(3), 'blue', 'filled')
scatter(x(4),yPDDO(1), 'red', 'filled')
scatter(x(4),yPDDO(2), 'black', 'filled')
scatter(x(4),yPDDO(3), 'blue', 'filled') 
scatter(x(5),yMacleod(1), 'red', 'filled')
scatter(x(5),yMacleod(2), 'black', 'filled')
scatter(x(5),yMacleod(3), 'blue', 'filled')
scatter(x(6),yArgyle(1), 'red', 'filled')
scatter(x(6),yArgyle(2), 'black', 'filled')
scatter(x(6),yArgyle(3), 'blue', 'filled')

grid on;
xlim([0.5 6.5])
ylim([0.0 1.3])
xticks([1 2 3 4 5 6 ])
xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle'})
title('Isotropy Test (sigma1 = 1, sigma2 = 1, kernelDim = 5x5)')
xlabel('Edge Detection Method')
ylabel('Angle Response')
legend('15 Degrees','30 Degrees','45 Degrees');
labelpoints([x(1) x(1) x(1)],ySobel,ySobel,'E',0.1)
labelpoints([x(2) x(2) x(2)],yPrewitt,yPrewitt,'E',0.1)
labelpoints([x(3) x(3) x(3)],yScharr,yScharr,'E',0.1)
labelpoints([x(5) x(5) x(5)],yMacleod,yMacleod,'E',0.1)
labelpoints([x(6) x(6) x(6)],yArgyle,yArgyle,'E',0.1)

labelpoints([x(4)],yPDDO(3),yPDDO(3),'E',0.1)
labelpoints([x(4)],yPDDO(2),yPDDO(2),'S',0.1)
labelpoints([x(4)],yPDDO(1),yPDDO(1),'N',0.1)
%fontsize(16,"points");

%% Sigma1 = 2 and Sigma2 = 2, kernelDimension = 5x5 
sigma1 = 2;
sigma2 = 2;
kernelDimension = 5;
image1 = image;
%Macleod
[gradientMagMacleod_0] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_0, gradientMagnitudeMacleod_0] = detectEdges(gradientMagMacleod_0, 0.29);
%Argyle
[gradientMagArgyle_0] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_0, gradientMagnitudeArgyle_0] = detectEdges(gradientMagArgyle_0, 0.29);
%PDDO Kernel
[gradientMagPDDOKernel_0,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_0, gradientMagnitudePDDOKernel_0] = detectEdges(gradientMagPDDOKernel_0, 0.57);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_0] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_0, gradientMagnitudeFuzzyPDDO_0] = detectEdges(gradientMagFuzzyPDDO_0, 0.6);

%% Rotate Image 15 degrees
image1 = imrotate(image,15,'crop');
%Macleod
[gradientMagMacleod_15] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_15, gradientMagnitudeMacleod_15] = detectEdges(gradientMagMacleod_15, 0.22);
%Argyle
[gradientMagArgyle_15] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_15, gradientMagnitudeArgyle_15] = detectEdges(gradientMagArgyle_15, 0.21);
%PDDO Kernel
[gradientMagPDDOKernel_15,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_15, gradientMagnitudePDDOKernel_15] = detectEdges(gradientMagPDDOKernel_15, 0.48);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_15] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_15, gradientMagnitudeFuzzyPDDO_15] = detectEdges(gradientMagFuzzyPDDO_15, 0.49);

%% Rotate Image 30 degrees
image1 = imrotate(image,30,'crop');
%Macleod
[gradientMagMacleod_30] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_30, gradientMagnitudeMacleod_30] = detectEdges(gradientMagMacleod_30, 0.2);
%Argyle
[gradientMagArgyle_30] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_30, gradientMagnitudeArgyle_30] = detectEdges(gradientMagArgyle_30, 0.19);
%PDDO Kernel
[gradientMagPDDOKernel_30,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_30, gradientMagnitudePDDOKernel_30] = detectEdges(gradientMagPDDOKernel_30, 0.4);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_30] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_30, gradientMagnitudeFuzzyPDDO_30] = detectEdges(gradientMagFuzzyPDDO_30, 0.4);


%% Rotate Image 45 degrees
image1 = imrotate(image,45,'crop');
%Macleod
[gradientMagMacleod_45] = macleodEdgeDetector(image1, sigma1,sigma2,kernelDimension,kernelDimension);
[gradientEdgeMapMacleod_45, gradientMagnitudeMacleod_45] = detectEdges(gradientMagMacleod_45, 0.16);
%Argyle
[gradientMagArgyle_45] = argyleEdgeDetector(image1, sigma1,kernelDimension,kernelDimension);
[gradientEdgeMapArgyle_45, gradientMagnitudeArgyle_45] = detectEdges(gradientMagArgyle_45, 0.14);
%PDDO Kernel
[gradientMagPDDOKernel_45,xGradient, yGradient] = pddoEdgeDetector(image1, sigma1,kernelDimension);
[gradientEdgeMapPDDOKernel_45, gradientMagnitudePDDOKernel_45] = detectEdges(gradientMagPDDOKernel_45, 0.33);
%Fuzzy PDDO
% [modifiedMembershipImage, gradientMagFuzzyPDDO_45] = fuzzyPDDOEdgeDetector(image1, sigma1,kernelDimension);
% [gradientEdgeMapFuzzyPDDO_45, gradientMagnitudeFuzzyPDDO_45] = detectEdges(gradientMagFuzzyPDDO_45, 0.42);


angleResponse_Sobel_15 = max(gradientMagnitudeSobel_15,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_30 = max(gradientMagnitudeSobel_30,[],"all")/max(gradientMagnitudeSobel_0,[],"all");
angleResponse_Sobel_45 = max(gradientMagnitudeSobel_45,[],"all")/max(gradientMagnitudeSobel_0,[],"all");

angleResponse_Prewitt_15 = max(gradientMagnitudePrewitt_15,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_30 = max(gradientMagnitudePrewitt_30,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");
angleResponse_Prewitt_45 = max(gradientMagnitudePrewitt_45,[],"all")/max(gradientMagnitudePrewitt_0,[],"all");

angleResponse_Scharr_15 = max(gradientMagnitudeScharr_15,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_30 = max(gradientMagnitudeScharr_30,[],"all")/max(gradientMagnitudeScharr_0,[],"all");
angleResponse_Scharr_45 = max(gradientMagnitudeScharr_45,[],"all")/max(gradientMagnitudeScharr_0,[],"all");

angleResponse_Macleod_15 = max(gradientMagnitudeMacleod_15,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_30 = max(gradientMagnitudeMacleod_30,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");
angleResponse_Macleod_45 = max(gradientMagnitudeMacleod_45,[],"all")/max(gradientMagnitudeMacleod_0,[],"all");

angleResponse_Argyle_15 = max(gradientMagnitudeArgyle_15,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_30 = max(gradientMagnitudeArgyle_30,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");
angleResponse_Argyle_45 = max(gradientMagnitudeArgyle_45,[],"all")/max(gradientMagnitudeArgyle_0,[],"all");

angleResponse_PDDO_15 = max(gradientMagnitudePDDOKernel_15,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_30 = max(gradientMagnitudePDDOKernel_30,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");
angleResponse_PDDO_45 = max(gradientMagnitudePDDOKernel_45,[],"all")/max(gradientMagnitudePDDOKernel_0,[],"all");

x = [1 2 3 4 5 6];
ySobel =[angleResponse_Sobel_15 angleResponse_Sobel_30 angleResponse_Sobel_45];
yPrewitt =[angleResponse_Prewitt_15 angleResponse_Prewitt_30 angleResponse_Prewitt_45];
yScharr =[angleResponse_Scharr_15 angleResponse_Scharr_30 angleResponse_Scharr_45];
yPDDO =[angleResponse_PDDO_15 angleResponse_PDDO_30 angleResponse_PDDO_45];
yMacleod =[angleResponse_Macleod_15 angleResponse_Macleod_30 angleResponse_Macleod_45];
yArgyle =[angleResponse_Argyle_15 angleResponse_Argyle_30 angleResponse_Argyle_45];

figure; scatter(x(1), ySobel(1), 'red', 'filled')
hold on;
scatter(x(1),ySobel(2), 'black', 'filled')
scatter(x(1),ySobel(3), 'blue', 'filled')
scatter(x(2),yPrewitt(1), 'red', 'filled')
scatter(x(2),yPrewitt(2), 'black', 'filled')
scatter(x(2),yPrewitt(3), 'blue', 'filled')
scatter(x(3),yScharr(1), 'red', 'filled')
scatter(x(3),yScharr(2), 'black', 'filled')
scatter(x(3),yScharr(3), 'blue', 'filled')
scatter(x(4),yPDDO(1), 'red', 'filled')
scatter(x(4),yPDDO(2), 'black', 'filled')
scatter(x(4),yPDDO(3), 'blue', 'filled') 
scatter(x(5),yMacleod(1), 'red', 'filled')
scatter(x(5),yMacleod(2), 'black', 'filled')
scatter(x(5),yMacleod(3), 'blue', 'filled')
scatter(x(6),yArgyle(1), 'red', 'filled')
scatter(x(6),yArgyle(2), 'black', 'filled')
scatter(x(6),yArgyle(3), 'blue', 'filled')

grid on;
xlim([0.5 6.5])
ylim([0.0 1.3])
xticks([1 2 3 4 5 6 ])
xticklabels({'Sobel','Prewitt', 'Scharr', 'PDDO', 'Macleod', 'Argyle'})
title('Isotropy Test (sigma1 = 2, sigma2 = 2, kernelDim = 5x5)')
xlabel('Edge Detection Method')
ylabel('Angle Response')
legend('15 Degrees','30 Degrees','45 Degrees');
labelpoints([x(1) x(1) x(1)],ySobel,ySobel,'E',0.1)
labelpoints([x(2) x(2) x(2)],yPrewitt,yPrewitt,'E',0.1)
labelpoints([x(3) x(3) x(3)],yScharr,yScharr,'E',0.1)
labelpoints([x(5) x(5) x(5)],yMacleod,yMacleod,'E',0.1)
labelpoints([x(6) x(6) x(6)],yArgyle,yArgyle,'E',0.1)

labelpoints([x(4)],yPDDO(3),yPDDO(3),'E',0.1)
labelpoints([x(4)],yPDDO(2),yPDDO(2),'S',0.1)
labelpoints([x(4)],yPDDO(1),yPDDO(1),'N',0.1)
%fontsize(16,"points");

    
