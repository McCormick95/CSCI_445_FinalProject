function [] = project5_tester()

    addpath('./images');
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
    end

    
    
    % figure;
    % imshow(BW);
    % title("Image1--> ACC: " + ACC_1 + " F1: " + F1_1);

    
    
    % GTest = zeros(200,300);
    % GTest(50:150, 100:200) = 1;
    % GTest = imbinarize(GTest);
    % BWTest = zeros(200,300);
    % BWTest(60:160, 120:230) = 1;
    % BWTest = imbinarize(BWTest);
    % [ACCTest, F1Test] = Project4B_65(GTest, BWTest);

    % disp("Test Image: ")
    % disp(ACCTest)
    % disp(F1Test)
    % disp('-----------------------------------')
    % disp("Image A: ")
    % disp(ACC_1)
    % disp(F1_1)
    % disp('-----------------------------------')
    % disp("Image B: ")
    % disp(ACC_2)
    % disp(F1_2)
    % disp('-----------------------------------')
    % disp("Image C: ")
    % disp(ACC_3)
    % disp(F1_3)
    % disp('-----------------------------------')
    % disp("Image D: ")
    % disp(ACC_4)
    % disp(F1_4)
    % disp('-----------------------------------')

    
    % figure;
    % subplot(2, 2, 1);
    % imshow(BW1);
    % title("ImageA--> R: " + ratio1 + " C: " + count1);
    
    % subplot(2, 2, 2);
    % imshow(BW2);
    % title("ImageB--> R: " + ratio2 + " C: " + count2);

    % subplot(2, 2, 3);
    % imshow(BW3);
    % title("ImageC--> R: " + ratio3 + " C: " + count3);

    % subplot(2, 2, 4); 
    % imshow(BW4);
    % title("ImageD--> R: " + ratio4 + " C: " + count4);
    
    
    %imshow(BW);
    %ratio
    %count
end