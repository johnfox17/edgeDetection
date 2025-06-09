function [gradientMagnitude] = prewittEdgeDetector(image)
    h1 = [-1,0,1;-1,0,1;-1,0,1];
    h2 = [1,1,1;0,0,0;-1,-1,-1]; 
    % Calculate scaling factor and scale
    h = 2*3; %from notes 6
    h1 = h1/h;
    h2 = h2/h;
    %Calculate Gradient Magnitude
    xGradient = conv2(image, h1,'same');
    yGradient = conv2(image, h2,'same');    
    gradientMagnitude = sqrt(xGradient.^2 + yGradient.^2);
end