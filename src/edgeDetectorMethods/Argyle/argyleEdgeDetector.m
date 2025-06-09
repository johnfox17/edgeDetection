function [gradientMagnitude] = argyleEdgeDetector(image, sigma, Nx, Ny)
    
    xradius = ceil((Nx-1)/2);
    yradius = ceil((Ny-1)/2);
    [x,y] = meshgrid(-xradius:xradius,-yradius:yradius);
    h1 = sign(x).*exp(-0.5*x.^2/sigma^2);
    h1 = h1 ./(2*sum(h1(:,xradius+1:end),'all'));

    h2 = sign(y).*exp(-0.5*y.^2/sigma^2);
    h2 = h2 ./(2*sum(h2(1:yradius,:),'all'));
    %Calculate Gradient Magnitude
    xGradient = conv2(image, h1,'same');
    yGradient = conv2(image, h2,'same');    
    gradientMagnitude = sqrt(xGradient.^2 + yGradient.^2);
end