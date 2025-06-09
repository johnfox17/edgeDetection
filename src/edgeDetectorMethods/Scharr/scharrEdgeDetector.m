function [gradientMagnitude] = scharrEdgeDetector(image)
    h1 =[-3 0 3; -10 0 10; -3 0 3];
    h2 = h1.';
    % Calculate scaling factor and scale
    h = 2*16; % from notes 32
    h1 = h1/h;
    h2 = h2/h;
    %Calculate Gradient Magnitude
    xGradient = conv2(image, h1,'same');
    yGradient = conv2(image, h2,'same');    
    gradientMagnitude = sqrt(xGradient.^2 + yGradient.^2);
end