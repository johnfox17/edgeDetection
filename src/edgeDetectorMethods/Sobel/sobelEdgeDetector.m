function [gradientMagnitude] = sobelEdgeDetector(image)
    h1 = [-1,0,1;-2,0,2;-1,0,1];
    h2 = [1,2,1;0,0,0;-1,-2,-1];
    % Calculate scaling factor and scale
    h = 2*4; %8 From jrod notes
    h1 = h1/h;
    h2 = h2/h;
    %Calculate Gradient Magnitude
    xGradient = conv2(image, h1,'same');
    yGradient = conv2(image, h2,'same');    
    gradientMagnitude = sqrt(xGradient.^2 + yGradient.^2);
    
end