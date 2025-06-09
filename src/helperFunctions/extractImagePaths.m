function imagePaths = extractImagePaths(outputFolderPath, operator)
    %% Define to folder path
    edgesImageFolderPath = strcat(outputFolderPath,operator);
    %% Extract Images
    imagePaths = [];
    edgesImages = dir(edgesImageFolderPath);
    edgesImages = {edgesImages.name};
    for iImage=3:length(edgesImages)
        imagePaths = [imagePaths;...
            strcat(edgesImageFolderPath,"/" ,edgesImages{1,iImage})];
    end
end