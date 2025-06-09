function [modifiedMembershipImage, gradientMagnitude] = fuzzyPDDOEdgeDetector(image,sigma1,kernelDim)
    [gradientMagnitude,xGradient, yGradient] = pddoEdgeDetector(image, sigma1,kernelDim);
    laplacianMagnitude = pddoLaplacian(image, sigma1,kernelDim);
    
    %Creating Fuzzy Logic Inference System
    edgeFISmain = mamfis('Name','edgeDetection');

   %Adding Inputs and Output
    edgeFISmain = addInput(edgeFISmain,[0 1],"Name","Ix");
    edgeFISmain = addInput(edgeFISmain,[0 1],"Name","Iy");
    edgeFISmain = addInput(edgeFISmain,[0 1],"Name","magGrad");
    edgeFISmain = addInput(edgeFISmain,[0 1], "Name","Ixxyy");
    edgeFISmain = addOutput(edgeFISmain,[0 1],"Name","Iout");
    
   %Contrast selection contrast images
    contrast = 4;
    switch contrast
        case 0 %high
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.25 0.4],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.25 0.4 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',1); title('Low Contrast');fontsize(16,"points");
            % 
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.25 0.4],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.25 0.4 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',2); title('Low Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.25 0.4],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.25 0.4 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',3); title('Low Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.25 0.4],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.25 0.4 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',4); title('Low Contrast');fontsize(16,"points");
        case 1 %highmid
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.2 0.35],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.2 0.35 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',1); title('High Contrast');fontsize(16,"points");
            % 
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.2 0.35],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.2 0.35 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',2); title('High Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.2 0.35],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.2 0.35 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',3); title('High Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.2 0.35],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.2 0.35 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',4); title('High Contrast');fontsize(16,"points");
        case 2 %highlow
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.18 0.3],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.18 0.3 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',1); title('High Contrast');fontsize(16,"points");
            % 
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.18 0.3],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.18 0.3 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',2); title('High Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.18 0.3],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.18 0.3 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',3); title('High Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.2 0.3],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.2 0.3 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',4); title('High Contrast');fontsize(16,"points");
        case 3 %lowhigh
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.15 0.25],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.15 0.25 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',1); title('High Contrast');fontsize(16,"points");
            % 
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.15 0.25],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.15 0.25 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',2); title('High Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.15 0.25],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.15 0.25 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',3); title('High Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.15 0.25],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.15 0.25 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',4); title('High Contrast');fontsize(16,"points");
        case 4 % Low
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.08 0.15],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.08 0.15 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',1); title('Low Contrast');fontsize(16,"points");
            % 
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.08 0.15],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.08 0.15 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',2); title('Low Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.08 0.15],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.08 0.15 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',3); title('Low Contrast');fontsize(16,"points");
            %
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.08 0.15],'Name',"Lower");
            edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.08 0.15 1 1],'Name',"Higher");
            % figure;
            % plotmf(edgeFISmain,'input',4); title('Low Contrast');fontsize(16,"points");
        otherwise
            disp('contrast not defined');

    end

    edgeFISmain = addMF(edgeFISmain,"Iout","gaussmf", [0.05 0.35],'Name',"Non-Edge");
    edgeFISmain = addMF(edgeFISmain,"Iout","gaussmf", [0.05 0.65],'Name',"Edge");
    %  edgeFISmain = addMF(edgeFISmain,"Iout","gaussmf", [0.05 0.15],'Name',"Non-Edge");
    % edgeFISmain = addMF(edgeFISmain,"Iout","gaussmf", [0.05 0.85],'Name',"Edge");
    figure;
    plotmf(edgeFISmain,'output',1);fontsize(16,"points");

    r1 = "If Ix is Higher and Iy is Higher and magGrad is Higher and Ixxyy is Lower then Iout is Edge";    
    r2 = "If Ix is Lower and Iy is Higher and magGrad is Higher and Ixxyy is Lower then Iout is Edge";    
    r3 = "If Ix is Higher and Iy is Lower and magGrad is Higher and Ixxyy is Lower then Iout is Edge";    
    r4 = "If Ix is Lower and Iy is Higher and magGrad is Lower and Ixxyy is Lower then Iout is Non-Edge";
    r5 = "If Ix is Higher and Iy is Lower and magGrad is Lower and Ixxyy is Lower then Iout is Non-Edge";
    r6 = "If Ix is Lower and Iy is Lower and magGrad is Lower and Ixxyy is Lower then Iout is Non-Edge";
    r7 = "If Ix is Lower and Iy is Lower and magGrad is Lower and Ixxyy is Higher then Iout is Non-Edge";
    % 
    fuzzyRules = [r1 r2 r3 r4 r5 r6 r7];
 
    edgeFISmain = addRule(edgeFISmain, fuzzyRules);

    Ieval2=zeros(size(xGradient));

    for ii = 1:size(xGradient,1)
        Ieval2(ii,:) = evalfis([(abs(xGradient(ii,:)));(abs(yGradient(ii,:)));(gradientMagnitude(ii,:));(abs(laplacianMagnitude(ii,:)));]',edgeFISmain);
    end
    modifiedMembershipImage = imadjust(Ieval2);

end