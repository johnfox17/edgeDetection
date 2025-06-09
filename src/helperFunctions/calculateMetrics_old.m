function [images3063PDDO, images3063Scharr, images3063Sobel,images3063Argyle, ...
    images3063Prewitt,images3063Macleod,images3063FuzzyPDDO,images3063FuzzyType2PDDO,...
    images8068PDDO, images8068Scharr, images8068Sobel,images8068Argyle,...
    images8068Prewitt,images8068Macleod, images8068FuzzyPDDO,images8068FuzzyType2PDDO,...
    scores3063FuzzyPDDO,scores3063FuzzyType2PDDO,scores3063PDDO,scores3063Scharr,...
    scores3063Sobel,scores3063Argyle,scores3063Prewitt, scores3063Macleod,...
    scores8068FuzzyPDDO,scores8068FuzzyType2PDDO,scores8068PDDO,scores8068Scharr,...
    scores8068Sobel,scores8068Argyle,scores8068Prewitt,scores8068Macleod]...
    = calculateMetrics(outputFolderPath)
  
    %% Define paths
    edgesImage3063PDDOPath = strcat(outputFolderPath,"3063/PDDO");
    edgesImage3063ScharrPath = strcat(outputFolderPath,"3063/Scharr");
    edgesImage3063SobelPath = strcat(outputFolderPath,"3063/Sobel");
    edgesImage3063ArgylePath = strcat(outputFolderPath,"3063/Argyle");
    edgesImage3063MacleodPath = strcat(outputFolderPath,"3063/Macleod");
    edgesImage3063PrewittPath = strcat(outputFolderPath,"3063/Prewitt");
    edgesImage3063FuzzyPDDOPath = strcat(outputFolderPath,"3063/FuzzyPDDO");
    edgesImage3063FuzzyType2PDDOPath = strcat(outputFolderPath,"3063/FuzzyType2PDDO");

    edgesImage8068PDDOPath = strcat(outputFolderPath,"8068/PDDO");
    edgesImage8068ScharrPath = strcat(outputFolderPath,"8068/Scharr");
    edgesImage8068SobelPath = strcat(outputFolderPath,"8068/Sobel");
    edgesImage8068ArgylePath = strcat(outputFolderPath,"8068/Argyle");
    edgesImage8068PrewittPath = strcat(outputFolderPath,"8068/Prewitt");
    edgesImage8068MacleodPath = strcat(outputFolderPath,"8068/Macleod");
    edgesImage8068FuzzyPDDOPath = strcat(outputFolderPath,"8068/FuzzyPDDO");
    edgesImage8068FuzzyType2PDDOPath = strcat(outputFolderPath,"8068/FuzzyType2PDDO");

    %% Extract Images
    images3063FuzzyType2PDDO = [];
    edgesImage3063FuzzyType2PDDO = dir(edgesImage3063FuzzyType2PDDOPath);
    edgesImage3063FuzzyType2PDDO = {edgesImage3063FuzzyType2PDDO.name};
    for iImage=3:length(edgesImage3063FuzzyType2PDDO)
        images3063FuzzyType2PDDO = [images3063FuzzyType2PDDO;...
            strcat(edgesImage3063FuzzyType2PDDOPath,"/" ,edgesImage3063FuzzyType2PDDO{1,iImage})];
    end

    images3063FuzzyPDDO = [];
    edgesImage3063FuzzyPDDO = dir(edgesImage3063FuzzyPDDOPath);
    edgesImage3063FuzzyPDDO = {edgesImage3063FuzzyPDDO.name};
    for iImage=3:length(edgesImage3063FuzzyPDDO)
        images3063FuzzyPDDO = [images3063FuzzyPDDO;...
            strcat(edgesImage3063FuzzyPDDOPath,"/" ,edgesImage3063FuzzyPDDO{1,iImage})];
    end
    
    images3063PDDO = [];
    edgesImage3063PDDO = dir(edgesImage3063PDDOPath);
    edgesImage3063PDDO = {edgesImage3063PDDO.name};
    for iImage=3:length(edgesImage3063PDDO)
        images3063PDDO = [images3063PDDO;strcat(edgesImage3063PDDOPath,"/" ,edgesImage3063PDDO{1,iImage})];
    end
    
    images3063Scharr = [];
    edgesImage3063Scharr = dir(edgesImage3063ScharrPath);
    edgesImage3063Scharr = {edgesImage3063Scharr.name};
    for iImage=3:length(edgesImage3063Scharr)
        images3063Scharr = [images3063Scharr;strcat(edgesImage3063ScharrPath,"/" ,edgesImage3063Scharr{1,iImage})];
    end
    
    images3063Sobel = [];
    edgesImage3063Sobel = dir(edgesImage3063SobelPath);
    edgesImage3063Sobel = {edgesImage3063Sobel.name};
    for iImage=3:length(edgesImage3063Sobel)
        images3063Sobel = [images3063Sobel;strcat(edgesImage3063SobelPath,"/" ,edgesImage3063Sobel{1,iImage})];
    end
    
    images3063Argyle = [];
    edgesImage3063Argyle = dir(edgesImage3063ArgylePath);
    edgesImage3063Argyle = {edgesImage3063Argyle.name};
    for iImage=3:length(edgesImage3063Argyle)
        images3063Argyle = [images3063Argyle;strcat(edgesImage3063ArgylePath,"/" ,edgesImage3063Argyle{1,iImage})];
    end

    images3063Prewitt = [];
    edgesImage3063Prewitt = dir(edgesImage3063PrewittPath);
    edgesImage3063Prewitt = {edgesImage3063Prewitt.name};
    for iImage=3:length(edgesImage3063Prewitt)
        images3063Prewitt = [images3063Prewitt;strcat(edgesImage3063PrewittPath,"/" ,edgesImage3063Prewitt{1,iImage})];
    end
    
    images3063Macleod = [];
    edgesImage3063Macleod = dir(edgesImage3063MacleodPath);
    edgesImage3063Macleod = {edgesImage3063Macleod.name};
    for iImage=3:length(edgesImage3063Macleod)
        images3063Macleod = [images3063Macleod;strcat(edgesImage3063MacleodPath,"/" ,edgesImage3063Macleod{1,iImage})];
    end

    images8068FuzzyType2PDDO = [];
    edgesImage8068FuzzyType2PDDO = dir(edgesImage8068FuzzyType2PDDOPath);
    edgesImage8068FuzzyType2PDDO = {edgesImage8068FuzzyType2PDDO.name};
    for iImage=3:length(edgesImage8068FuzzyType2PDDO)
        images8068FuzzyType2PDDO = [images8068FuzzyType2PDDO;strcat(edgesImage8068FuzzyType2PDDOPath,"/" ,edgesImage8068FuzzyType2PDDO{1,iImage})];
    end

    images8068FuzzyPDDO = [];
    edgesImage8068FuzzyPDDO = dir(edgesImage8068FuzzyPDDOPath);
    edgesImage8068FuzzyPDDO = {edgesImage8068FuzzyPDDO.name};
    for iImage=3:length(edgesImage8068FuzzyPDDO)
        images8068FuzzyPDDO = [images8068FuzzyPDDO;strcat(edgesImage8068FuzzyPDDOPath,"/" ,edgesImage8068FuzzyPDDO{1,iImage})];
    end
    
    images8068PDDO = [];
    edgesImage8068PDDO = dir(edgesImage8068PDDOPath);
    edgesImage8068PDDO = {edgesImage8068PDDO.name};
    for iImage=3:length(edgesImage8068PDDO)
        images8068PDDO = [images8068PDDO;strcat(edgesImage8068PDDOPath,"/" ,edgesImage8068PDDO{1,iImage})];
    end
    
    images8068Scharr = [];
    edgesImage8068Scharr = dir(edgesImage8068ScharrPath);
    edgesImage8068Scharr = {edgesImage8068Scharr.name};
    for iImage=3:length(edgesImage8068Scharr)
        images8068Scharr = [images8068Scharr;strcat(edgesImage8068ScharrPath,"/" ,edgesImage8068Scharr{1,iImage})];
    end
    
    images8068Sobel = [];
    edgesImage8068Sobel = dir(edgesImage8068SobelPath);
    edgesImage8068Sobel = {edgesImage8068Sobel.name};
    for iImage=3:length(edgesImage8068Sobel)
        images8068Sobel = [images8068Sobel;strcat(edgesImage8068SobelPath,"/" ,edgesImage8068Sobel{1,iImage})];
    end
    
    images8068Argyle = [];
    edgesImage8068Argyle = dir(edgesImage8068ArgylePath);
    edgesImage8068Argyle = {edgesImage8068Argyle.name};
    for iImage=3:length(edgesImage8068Argyle)
        images8068Argyle = [images8068Argyle;strcat(edgesImage8068ArgylePath,"/" ,edgesImage8068Argyle{1,iImage})];
    end
    images8068Prewitt = [];
    edgesImage8068Prewitt = dir(edgesImage8068PrewittPath);
    edgesImage8068Prewitt = {edgesImage8068Prewitt.name};
    for iImage=3:length(edgesImage8068Prewitt)
        images8068Prewitt = [images8068Prewitt;strcat(edgesImage8068PrewittPath,"/" ,edgesImage8068Prewitt{1,iImage})];
    end
    
    images8068Macleod = [];
    edgesImage8068Macleod = dir(edgesImage8068MacleodPath);
    edgesImage8068Macleod = {edgesImage8068Macleod.name};
    for iImage=3:length(edgesImage8068Macleod)
        images8068Macleod = [images8068Macleod;strcat(edgesImage8068MacleodPath,"/" ,edgesImage8068Macleod{1,iImage})];
    end

    %% Compare to ground truth

    % Image 3063
    groundTruth1 = load('3063.mat');
    gT1 = groundTruth1.groundTruth;
    
    AccuracyArray = zeros(length(gT1),1);
    PrecisionArray =zeros(length(gT1),1);
    RecallArray = zeros(length(gT1),1);
    F1Array = zeros(length(gT1),1);
    scores3063FuzzyType2PDDO = cell(length(images3063FuzzyType2PDDO), 1);
    for iImage=1:length(images3063FuzzyType2PDDO)
        
        for iGT1=1:length(gT1)
            currentImage = imread(images3063FuzzyType2PDDO(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063FuzzyType2PDDO{iImage}.accuracy = max(AccuracyArray);
        scores3063FuzzyType2PDDO{iImage}.precision = max(PrecisionArray);
        scores3063FuzzyType2PDDO{iImage}.recall = max(RecallArray);
        scores3063FuzzyType2PDDO{iImage}.f1 = max(F1Array);
    end
    
    
    AccuracyArray = zeros(length(gT1),1);
    PrecisionArray =zeros(length(gT1),1);
    RecallArray = zeros(length(gT1),1);
    F1Array = zeros(length(gT1),1);
    scores3063FuzzyPDDO = cell(length(images3063FuzzyPDDO), 1);
    for iImage=1:length(images3063FuzzyPDDO)
        
        for iGT1=1:length(gT1)
            currentImage = imread(images3063FuzzyPDDO(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063FuzzyPDDO{iImage}.accuracy = max(AccuracyArray);
        scores3063FuzzyPDDO{iImage}.precision = max(PrecisionArray);
        scores3063FuzzyPDDO{iImage}.recall = max(RecallArray);
        scores3063FuzzyPDDO{iImage}.f1 = max(F1Array);
    end
    %scores3063PDDO = zeros(length(images3063PDDO), length(gT1));
    scores3063PDDO = cell(length(images3063PDDO), 1);
    for iImage=1:length(images3063PDDO)
        for iGT1=1:length(gT1)
            currentImage = imread(images3063PDDO(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end

        scores3063PDDO{iImage}.accuracy = max(AccuracyArray);
        scores3063PDDO{iImage}.precision = max(PrecisionArray);
        scores3063PDDO{iImage}.recall = max(RecallArray);
        scores3063PDDO{iImage}.f1 = max(F1Array);
    end
    
    scores3063Scharr = cell(length(images3063Scharr), 1);
    for iImage=1:length(images3063Scharr)
        for iGT1=1:length(gT1)
            currentImage = imread(images3063Scharr(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063Scharr{iImage}.accuracy = max(AccuracyArray);
        scores3063Scharr{iImage}.precision = max(PrecisionArray);
        scores3063Scharr{iImage}.recall = max(RecallArray);
        scores3063Scharr{iImage}.f1 = max(F1Array);
    end
    
    scores3063Sobel = cell(length(images3063Sobel), 1);
    for iImage=1:length(images3063Sobel)
        for iGT1=1:length(gT1)
            currentImage = imread(images3063Sobel(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063Sobel{iImage}.accuracy = max(AccuracyArray);
        scores3063Sobel{iImage}.precision = max(PrecisionArray);
        scores3063Sobel{iImage}.recall = max(RecallArray);
        scores3063Sobel{iImage}.f1 = max(F1Array);
    end
    
    scores3063Argyle = cell(length(images3063Argyle), 1);
    for iImage=1:length(images3063Argyle)
        for iGT1=1:length(gT1)
            currentImage = imread(images3063Argyle(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063Argyle{iImage}.accuracy = max(AccuracyArray);
        scores3063Argyle{iImage}.precision = max(PrecisionArray);
        scores3063Argyle{iImage}.recall = max(RecallArray);
        scores3063Argyle{iImage}.f1 = max(F1Array);
    end
    
    scores3063Prewitt = cell(length(images3063Prewitt), 1);
    for iImage=1:length(images3063Prewitt)
        for iGT1=1:length(gT1)
            currentImage = imread(images3063Prewitt(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063Prewitt{iImage}.accuracy = max(AccuracyArray);
        scores3063Prewitt{iImage}.precision = max(PrecisionArray);
        scores3063Prewitt{iImage}.recall = max(RecallArray);
        scores3063Prewitt{iImage}.f1 = max(F1Array);
    end

    scores3063Macleod = cell(length(images3063Macleod), 1);
    for iImage=1:length(images3063Macleod)
        for iGT1=1:length(gT1)
            currentImage = imread(images3063Macleod(iImage));
            currentGT = gT1{1, iGT1}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT1) = Accuracy;
            PrecisionArray(iGT1) = Precision;
            RecallArray(iGT1) = Recall;
            F1Array(iGT1) = F1;
        end
        scores3063Macleod{iImage}.accuracy = max(AccuracyArray);
        scores3063Macleod{iImage}.precision = max(PrecisionArray);
        scores3063Macleod{iImage}.recall = max(RecallArray);
        scores3063Macleod{iImage}.f1 = max(F1Array);
    end
    % Image 8068
    %groundTruth2 = load('8068.mat');
    %groundTruth2 = load('130014.mat');
    groundTruth2 = load('87015.mat');
    gT2 = groundTruth2.groundTruth;
    
    AccuracyArray = zeros(length(gT2),1);
    PrecisionArray =zeros(length(gT2),1);
    RecallArray = zeros(length(gT2),1);
    F1Array = zeros(length(gT2),1);
    scores8068FuzzyType2PDDO = cell(length(images8068FuzzyType2PDDO), 1);
    for iImage=1:length(images8068FuzzyType2PDDO)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068FuzzyType2PDDO(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068FuzzyType2PDDO{iImage}.accuracy = max(AccuracyArray);
        scores8068FuzzyType2PDDO{iImage}.precision = max(PrecisionArray);
        scores8068FuzzyType2PDDO{iImage}.recall = max(RecallArray);
        scores8068FuzzyType2PDDO{iImage}.f1 = max(F1Array);
    end

    AccuracyArray = zeros(length(gT2),1);
    PrecisionArray =zeros(length(gT2),1);
    RecallArray = zeros(length(gT2),1);
    F1Array = zeros(length(gT2),1);
    scores8068FuzzyPDDO = cell(length(images8068FuzzyPDDO), 1);
    for iImage=1:length(images8068FuzzyPDDO)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068FuzzyPDDO(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068FuzzyPDDO{iImage}.accuracy = max(AccuracyArray);
        scores8068FuzzyPDDO{iImage}.precision = max(PrecisionArray);
        scores8068FuzzyPDDO{iImage}.recall = max(RecallArray);
        scores8068FuzzyPDDO{iImage}.f1 = max(F1Array);
    end
    
    scores8068PDDO = cell(length(images8068PDDO), 1);
    for iImage=1:length(images8068PDDO)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068PDDO(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068PDDO{iImage}.accuracy = max(AccuracyArray);
        scores8068PDDO{iImage}.precision = max(PrecisionArray);
        scores8068PDDO{iImage}.recall = max(RecallArray);
        scores8068PDDO{iImage}.f1 = max(F1Array);
    end
    
    scores8068Scharr = cell(length(images8068Scharr), 1);
    for iImage=1:length(images8068Scharr)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068Scharr(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068Scharr{iImage}.accuracy = max(AccuracyArray);
        scores8068Scharr{iImage}.precision = max(PrecisionArray);
        scores8068Scharr{iImage}.recall = max(RecallArray);
        scores8068Scharr{iImage}.f1 = max(F1Array);
    end
    
    
    scores8068Sobel = cell(length(images8068Sobel), 1);
    for iImage=1:length(images8068Sobel)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068Sobel(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068Sobel{iImage}.accuracy = max(AccuracyArray);
        scores8068Sobel{iImage}.precision = max(PrecisionArray);
        scores8068Sobel{iImage}.recall = max(RecallArray);
        scores8068Sobel{iImage}.f1 = max(F1Array);
    end
    
    scores8068Argyle = cell(length(images8068Argyle), 1);
    for iImage=1:length(images8068Argyle)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068Argyle(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068Argyle{iImage}.accuracy = max(AccuracyArray);
        scores8068Argyle{iImage}.precision = max(PrecisionArray);
        scores8068Argyle{iImage}.recall = max(RecallArray);
        scores8068Argyle{iImage}.f1 = max(F1Array);
    end
    
    scores8068Prewitt = cell(length(images8068Prewitt),1);
    for iImage=1:length(images8068Prewitt)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068Prewitt(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068Prewitt{iImage}.accuracy = max(AccuracyArray);
        scores8068Prewitt{iImage}.precision = max(PrecisionArray);
        scores8068Prewitt{iImage}.recall = max(RecallArray);
        scores8068Prewitt{iImage}.f1 = max(F1Array);
    end

    scores8068Macleod = cell(length(images8068Macleod),1);
    for iImage=1:length(images8068Macleod)
        for iGT2=1:length(gT2)
            currentImage = imread(images8068Macleod(iImage));
            currentGT = gT2{1, iGT2}.Boundaries;
            [Accuracy, Precision,Recall,F1] = compareToGroundTruth(currentImage(8:end-7,8:end-7),currentGT(8:end-7,8:end-7));
            AccuracyArray(iGT2) = Accuracy;
            PrecisionArray(iGT2) = Precision;
            RecallArray(iGT2) = Recall;
            F1Array(iGT2) = F1;
        end
        scores8068Macleod{iImage}.accuracy = max(AccuracyArray);
        scores8068Macleod{iImage}.precision = max(PrecisionArray);
        scores8068Macleod{iImage}.recall = max(RecallArray);
        scores8068Macleod{iImage}.f1 = max(F1Array);
    end
end