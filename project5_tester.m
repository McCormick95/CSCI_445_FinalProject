function [] = project5_tester()

    addpath('./images');
    outputFolder = './outputImages'; % specify the output folder
    if ~exist(outputFolder, 'dir')
        mkdir(outputFolder); % if the folder does not exist, create it
    end

    numImages =  20;

    % Initialize a cell array
    images = cell(1, numImages);
    groundTruth = cell(1, numImages);

    % Loop over the images
    for i = 1:numImages
        images{i} = imread(sprintf('image%d.png', i));
        groundTruth{i} = imread(sprintf('label%d.png', i));
    end


    for i = 1:numel(images)

        [BW] = Project5A_65(images{i});
        [accuracy, F1] = Project5B_65(groundTruth{i}, BW);
        fprintf('Image %d: ACC: %f, F1: %f\n', i, accuracy, F1);

        
        outputFilename = fullfile(outputFolder, sprintf('output%d.png', i));
        imwrite(BW, outputFilename);
    end

end