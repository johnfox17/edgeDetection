function [gradientMagnitude,xGradient, yGradient] = pddoEdgeDetector(image, sigma,Nx)
    
    pyrunfile("firstOrderDerivativePDDOKernel.py","g01",sigma=sigma, kernelDim = Nx);
    h1 = table2array(readtable('../data/output/PDDOKernel/g10.csv'));
    h2 = table2array(readtable('../data/output/PDDOKernel/g01.csv'));
    xRadius = (size(h1,1)-1)/2;
    yRadius = (size(h2,1)-1)/2;
    h1 = fftshift(h1);
    h2 = fftshift(h2);
    h1 = h1 ./ (2*sum(abs(h1(:,xRadius+1:end)),'all'));   
    h2 = h2./(2*sum(abs(h2(1:yRadius+1,:)),'all'));
    %Calculate Gradient Magnitude
    xGradient = conv2(image, h1,'same');
    yGradient = conv2(image, h2,'same');    
    gradientMagnitude = sqrt(xGradient.^2 + yGradient.^2);
end