function [] = project5_tester()
    f1=imread('project3a.tif');
    f2=imread('project3b.tif');
    f3=imread('project3c.tif');
    f4=imread('project3d.tif');

    Ga= imread('project4aG.tif');
    Gb= imread('project4bG.tif');
    Gc= imread('project4cG.tif');
    Gd= imread('project4dG.tif');

    [BW1,ratio1,count1] = Project4A_65(f1);
    [BW2,ratio2,count2] = Project4A_65(f2);
    [BW3,ratio3,count3] = Project4A_65(f3);
    [BW4,ratio4,count4] = Project4A_65(f4);

    [ACC_1, F1_1] = Project4B_65(Ga,BW1);
    [ACC_2, F1_2] = Project4B_65(Gb,BW2);
    [ACC_3, F1_3] = Project4B_65(Gc,BW3);
    [ACC_4, F1_4] = Project4B_65(Gd,BW4);


    GTest = zeros(200,300);
    GTest(50:150, 100:200) = 1;
    GTest = imbinarize(GTest);
    BWTest = zeros(200,300);
    BWTest(60:160, 120:230) = 1;
    BWTest = imbinarize(BWTest);
    [ACCTest, F1Test] = Project4B_65(GTest, BWTest);

    disp("Test Image: ")
    disp(ACCTest)
    disp(F1Test)
    disp('-----------------------------------')
    disp("Image A: ")
    disp(ACC_1)
    disp(F1_1)
    disp('-----------------------------------')
    disp("Image B: ")
    disp(ACC_2)
    disp(F1_2)
    disp('-----------------------------------')
    disp("Image C: ")
    disp(ACC_3)
    disp(F1_3)
    disp('-----------------------------------')
    disp("Image D: ")
    disp(ACC_4)
    disp(F1_4)
    disp('-----------------------------------')

    
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