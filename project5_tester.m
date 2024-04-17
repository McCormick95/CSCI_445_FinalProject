function [] = project5_tester()

    addpath('./images');

    f1=imread('image01.png');
    f2=imread('image02.png');
    f3=imread('image03.png');
    f4=imread('image04.png');
    f5=imread('image05.png');
    f6=imread('image06.png');
    f7=imread('image07.png');
    f8=imread('image08.png');
    f9=imread('image09.png');
    f10=imread('image10.png');
    f11=imread('image11.png');
    f12=imread('image12.png');
    f13=imread('image13.png');
    f14=imread('image14.png');
    f15=imread('image15.png');
    f16=imread('image16.png');
    f17=imread('image17.png');
    f18=imread('image18.png');
    f19=imread('image19.png');
    f20=imread('image20.png');
    

    G1= imread('label01.png');
    G2= imread('label02.png');
    G3= imread('label03.png');
    G4= imread('label04.png');
    G5= imread('label05.png');
    G6= imread('label06.png');
    G7= imread('label07.png');
    G8= imread('label08.png');
    G9= imread('label09.png');
    G10= imread('label10.png');
    G11= imread('label11.png');
    G12= imread('label12.png');
    G13= imread('label13.png');
    G14= imread('label14.png');
    G15= imread('label15.png');
    G16= imread('label16.png');
    G17= imread('label17.png');
    G18= imread('label18.png');
    G19= imread('label19.png');
    G20= imread('label20.png');


    [BW1] = Project5A_65(f1);


    %[ACC_1, F1_1] = Project5B_65(G1,BW1);
    

    imshow(BW1);

    
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