function createEdgeOutputFolders(outputFolderPath, operator)
    if operator == "PDDOKernel"
        %create PDDO Output folder 
        outputPath = strcat(outputFolderPath,"PDDOKernel/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "FuzzyPDDO"
        %create FuzzyPDDO Output folder
        outputPath = strcat(outputFolderPath,"FuzzyPDDO/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "FuzzyType2PDDO"
        %create FuzzyType2PDDO Output folder
        outputPath = strcat(outputFolderPath,"FuzzyType2PDDO/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "Scharr"
        %create FuzzyType2PDDO Output folder
        outputPath = strcat(outputFolderPath,"Scharr/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "Sobel"
        %create FuzzyType2PDDO Output folder
        outputPath = strcat(outputFolderPath,"Sobel/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "Argyle"
        %create FuzzyType2PDDO Output folder
        outputPath = strcat(outputFolderPath,"Argyle/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "Macleod"
        %create FuzzyType2PDDO Output folder
        outputPath = strcat(outputFolderPath,"Macleod/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    elseif operator == "Prewitt"
        %create FuzzyType2PDDO Output folder
        outputPath = strcat(outputFolderPath,"Prewitt/");
        if exist(outputPath, 'dir')
            rmdir(outputPath,'s');
            mkdir(outputPath);
        else
            mkdir(outputPath);
        end
    end

end