function [laplacianMagnitude] = pddoLaplacian(image, sigma,kernelDim)
    pyrunfile("secondOrderDerivativePDDOKernel.py","g02",sigma=sigma,...
        kernelDim = kernelDim);
    G20 = fftshift(table2array(readtable('../data/output/PDDOKernel/g20.csv')));
    G02 = fftshift(table2array(readtable('../data/output/PDDOKernel/g02.csv')));
    xRadius = (size(G20,1)-1)/2;
    yRadius = (size(G02,1)-1)/2;
    G20 = G20 ./ (sum(abs(G20(:,xRadius+1:end)),'all'));   
    G02 = G02 ./(sum(abs(G02(1:yRadius+1,:)),'all'));
    laplacian = G20 + G02;
    %Calculating Laplacian Magnitude
    laplacianMagnitude = abs(conv2(image, laplacian,'same'));
end