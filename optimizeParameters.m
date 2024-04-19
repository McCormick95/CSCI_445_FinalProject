function [bestSigma, bestSensitivity, bestLenDisk, bestLenLine, bestLenH, bestLenV] = optimizeParameters()
    
    addpath('./images');
    numImages =  20;

    % Initialize a cell array
    images = cell(1, numImages);
    groundTruth = cell(1, numImages);

    % Loop over the images
    for i = 1:numImages

        % % Generate file names
        % imageFileName = sprintf('image%d.png', i);
        % labelFileName = sprintf('label%d.png', i);

        % % Print file names
        % fprintf('Loading image file: %s\n', imageFileName);
        % fprintf('Loading label file: %s\n', labelFileName);

        % Read each image (replace 'image1.jpg', 'image2.jpg', etc. with your actual image file names)
        images{i} = imread(sprintf('image%d.png', i));
        groundTruth{i} = imread(sprintf('label%d.png', i));
    end
        

    % Initialize best metric to negative infinity
    bestMetric = -1;

    % Define ranges for parameters
    sigma = .5; %0.1:0.1:1;
    sensitivityRange = 0:0.1:1;
    lenDisk = 1; %:10;
    lenLineRange = 1:10;
    lenHRange = 1:10;
    lenVRange = 1:10;
    loopCount = 0;
    % Iterate over all combinations of parameters

    % sigma = 0.5;
    % sensitivityRange = 0:0.1:0.2;
    % lenDisk = 0;
    % lenLineRange = 1:2;
    % lenHRange = 1:1:2;
    % lenVRange = 1:1:2;
    % loopCount = 0;


    
    for sensitivity = sensitivityRange
        for lenLine = lenLineRange
            for lenH = lenHRange
                for lenV = lenVRange

                    tic

                    % Initialize metrics for this parameter combination
                    totalAccuracy = 0;
                    totalF1 = 0;

                    % Apply function to all images and compute metrics
                    for i = 1:numel(images)

                        % Apply function
                        [BW] = function_optimizer(images{i}, sigma, sensitivity, lenDisk, lenLine, lenH, lenV);
                        
                        % % Print size of groundTruth{i} and BW
                        % fprintf('Size of groundTruth{%d}: %s\n', i, mat2str(size(groundTruth{i})));
                        % fprintf('Size of BW: %s\n', mat2str(size(BW)));

                        % % Check if groundTruth{i} is empty
                        % if isempty(groundTruth{i})
                        %     fprintf('groundTruth{%d} is empty\n', i);
                        % end

                        % Compute metrics
                        [accuracy, F1] = Project5B_65(groundTruth{i}, BW);

                        % Update totals
                        totalAccuracy = totalAccuracy + accuracy;
                        totalF1 = totalF1 + F1;
                    end

                    % fprintf('Tot. accuracy %d \n', totalAccuracy);
                    % fprintf('Tot. F1 %d \n', totalF1);

                    % Compute average metrics
                    avgAccuracy = totalAccuracy / numel(images);
                    avgF1 = totalF1 / numel(images);

                    % Compute combined metric (you can change this to suit your needs)
                    metric = (avgAccuracy + avgF1) / 2;
                    % fprintf('metric %d \n', metric);

                    % If this metric is better than the best so far, update best parameters
                    if metric > bestMetric
                        % fprintf('you are here\n');
                        bestMetric = metric;
                        bestSigma = 0.5; %sigma;
                        bestSensitivity = sensitivity;
                        bestLenDisk = 0; %lenDisk;
                        bestLenLine = lenLine;
                        bestLenH = lenH;
                        bestLenV = lenV;
                    end

                    elapsedTime = toc;
                    fprintf('Elapsed time: %f seconds\n', elapsedTime);
                    loopCount = loopCount + 1;
                    fprintf('AVG Computed: %d\n', loopCount);
                end
            end
        end
    end
end