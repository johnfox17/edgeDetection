function [noisyImage] = addAWGN(image, mean, variance)
    noisyImage = imnoise(image,'gaussian',mean,variance);
end



