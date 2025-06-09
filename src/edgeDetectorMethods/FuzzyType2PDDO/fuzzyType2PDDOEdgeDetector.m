function [modifiedMembershipImage, gradientMagnitude] = fuzzyType2PDDOEdgeDetector(image,sigma1,kernelDim)
    [gradientMagnitude,xGradient, yGradient] = pddoEdgeDetector(image, sigma1,kernelDim);
    laplacianMagnitude = pddoLaplacian(image, sigma1,kernelDim);
    
    
    %Creating Fuzzy Logic Inference System
    edgeFISmain = mamfistype2('Name','edgeDetection','TypeReductionMethod',"ekm");
   
    %Adding Inputs and Output
    edgeFISmain = addInput(edgeFISmain,[0 1],"Name","Ix");
    edgeFISmain = addInput(edgeFISmain,[0 1],"Name","Iy");
    edgeFISmain = addInput(edgeFISmain,[0 1],"Name","magGrad");
    edgeFISmain = addInput(edgeFISmain,[0 1], "Name","Ixxyy");
    edgeFISmain = addOutput(edgeFISmain,[0 1],"Name","Iout");
    %High contrast images
    highContrast = false;
    if highContrast
        edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.18 0.3],'Name',"Lower",LowerLag=0.5);
        edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.18 0.3 1 1],'Name',"Higher",LowerLag=0.5);
        % figure;
        % plotmf(edgeFISmain,'input',1)
        % 
        edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.18 0.3],'Name',"Lower",LowerLag=0.5);
        edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.18 0.3 1 1],'Name',"Higher",LowerLag=0.5);
        % figure;
        % plotmf(edgeFISmain,'input',2)
        %
        edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.18 0.3],'Name',"Lower",LowerLag=0.5);
        edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.18 0.3 1 1],'Name',"Higher",LowerLag=0.5);
        % figure;
        % plotmf(edgeFISmain,'input',3)
        %
        edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.2 0.3],'Name',"Lower",LowerLag=0.5);
        edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.2 0.3 1 1],'Name',"Higher",LowerLag=0.5);
        % figure;
        % plotmf(edgeFISmain,'input',4)
    else
        edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0 0 0.08 0.15],'Name',"Lower",LowerLag=0.1);
        edgeFISmain = addMF(edgeFISmain,"Ix","trapmf", [0.08 0.15 1 1],'Name',"Higher",LowerLag=0.1);
        % figure;
        % plotmf(edgeFISmain,'input',1)
        % 
        edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0 0 0.08 0.15],'Name',"Lower",LowerLag=0.1);
        edgeFISmain = addMF(edgeFISmain,"Iy","trapmf", [0.08 0.15 1 1],'Name',"Higher",LowerLag=0.1);
        % figure;
        % plotmf(edgeFISmain,'input',2)
        %
        edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0 0 0.08 0.15],'Name',"Lower",LowerLag=0.1);
        edgeFISmain = addMF(edgeFISmain,"magGrad","trapmf", [0.08 0.15 1 1],'Name',"Higher",LowerLag=0.1);
        % figure;
        % plotmf(edgeFISmain,'input',3)
        %
        edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0 0 0.08 0.15],'Name',"Lower",LowerLag=0.5);
        edgeFISmain = addMF(edgeFISmain,"Ixxyy","trapmf", [0.08 0.15 1 1],'Name',"Higher",LowerLag=0.5);
        % figure;
        % plotmf(edgeFISmain,'input',4)
    end
    edgeFISmain = addMF(edgeFISmain,"Iout","gaussmf", [0.05 0.15],'Name',"Non-Edge",LowerLag=0.5);
    edgeFISmain = addMF(edgeFISmain,"Iout","gaussmf", [0.05 0.85],'Name',"Edge",LowerLag=0.5);
    % figure;
    % plotmf(edgeFISmain,'output',1)

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