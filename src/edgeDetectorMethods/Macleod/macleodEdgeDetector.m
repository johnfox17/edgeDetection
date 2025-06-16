function [gradientMagnitude] = macleodEdgeDetector(image, sigma1,sigma2, Nx, Ny)
    xradius = ceil((Nx-1)/2);
    yradius = ceil((Ny-1)/2);
    [x,y] = meshgrid(-xradius:xradius,-yradius:yradius);
    g2y = exp(-0.5*y.^2/sigma2^2);
    g1xminus = exp(-0.5*(x-sigma1).^2/sigma1^2);
    g1xplus  = exp(-0.5*(x+sigma1).^2/sigma1^2);
    h1 = g2y .* (g1xminus - g1xplus);
    %h1 = h1 ./ (2*sum(h1(:,xradius+1:end),'all'));
    s = sum(h1(:,xradius+2:end),'all');
    xcentroid = sum(h1(:,xradius+2:end).*x(:,xradius+2:end),'all')/s;
    d = 2*xcentroid;
    h1 = h1 / (s*d);
    
    [x,y] = meshgrid(-xradius:xradius,-yradius:yradius);
    g2x = exp(-0.5*x.^2/sigma2^2);
    g1yminus = exp(-0.5*(y-sigma1).^2/sigma1^2);
    g1yplus  = exp(-0.5*(y+sigma1).^2/sigma1^2);
    h2 = g2x .* (g1yminus - g1yplus);
    %h2 = h2 ./(2*sum(h2(1:yradius,:),'all'));
    s = sum(h2(yradius+2:end,:),'all');
    ycentroid = sum(h1(yradius+2:end).*y(yradius+2:end),'all')/s;
    d = 2*ycentroid;
    h2 = h2 / (s*d);

    %Calculate Gradient Magnitude
    xGradient = conv2(image, h1,'same');
    yGradient = conv2(image, h2,'same');    
    gradientMagnitude = sqrt(xGradient.^2 + yGradient.^2);

end