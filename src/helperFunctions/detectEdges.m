function [gradientEdgeMap, gradientMagnitude] = detectEdges(gradientMagnitude,...
    threshold)
    %Threshold Gradient Map
    gradientEdgeMap = ones(size(gradientMagnitude));
    gradientEdgeMap(gradientMagnitude<threshold)=0;
    % se = strel('disk',1);
    % gradientEdgeMap = imclose(logical(gradientEdgeMap),se);
    gradientEdgeMap = bwskel(logical(gradientEdgeMap));
    gradientMagnitude = gradientEdgeMap.*(gradientMagnitude);
     

end