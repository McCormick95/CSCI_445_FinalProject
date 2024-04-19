function [] = project5_tester()

    addpath('./images');

    f1=imread('image1.png');
    f2=imread('image2.png');
    f3=imread('image3.png');
    f4=imread('image4.png');
    f5=imread('image5.png');
    f6=imread('image6.png');
    f7=imread('image7.png');
    f8=imread('image8.png');
    f9=imread('image9.png');
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
    

    G1= imread('label1.png');
    G2= imread('label2.png');
    G3= imread('label3.png');
    G4= imread('label4.png');
    G5= imread('label5.png');
    G6= imread('label6.png');
    G7= imread('label7.png');
    G8= imread('label8.png');
    G9= imread('label9.png');
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
    [BW2] = Project5A_65(f2);
    [BW3] = Project5A_65(f3);
    [BW4] = Project5A_65(f4);
    [BW5] = Project5A_65(f5);
    [BW6] = Project5A_65(f6);
    [BW7] = Project5A_65(f7);
    [BW8] = Project5A_65(f8);
    [BW9] = Project5A_65(f9);
    [BW10] = Project5A_65(f10);
    [BW11] = Project5A_65(f11);
    [BW12] = Project5A_65(f12);
    [BW13] = Project5A_65(f13);
    [BW14] = Project5A_65(f14);
    [BW15] = Project5A_65(f15);
    [BW16] = Project5A_65(f16);
    [BW17] = Project5A_65(f17);
    [BW18] = Project5A_65(f18);
    [BW19] = Project5A_65(f19);
    [BW20] = Project5A_65(f20);



    [ACC_1, F1_1] = Project5B_65(G1,BW1)
    [ACC_2, F1_2] = Project5B_65(G2,BW2)
    [ACC_3, F1_3] = Project5B_65(G3,BW3)
    [ACC_4, F1_4] = Project5B_65(G4,BW4)
    [ACC_5, F1_5] = Project5B_65(G5,BW5)
    [ACC_6, F1_6] = Project5B_65(G6,BW6)
    [ACC_7, F1_7] = Project5B_65(G7,BW7)
    [ACC_8, F1_8] = Project5B_65(G8,BW8)
    [ACC_9, F1_9] = Project5B_65(G9,BW9)
    [ACC_10, F1_10] = Project5B_65(G10,BW10)
    [ACC_11, F1_11] = Project5B_65(G11,BW11)
    [ACC_12, F1_12] = Project5B_65(G12,BW12)
    [ACC_13, F1_13] = Project5B_65(G13,BW13)
    [ACC_14, F1_14] = Project5B_65(G14,BW14)
    [ACC_15, F1_15] = Project5B_65(G15,BW15)
    [ACC_16, F1_16] = Project5B_65(G16,BW16)
    [ACC_17, F1_17] = Project5B_65(G17,BW17)
    [ACC_18, F1_18] = Project5B_65(G18,BW18)
    [ACC_19, F1_19] = Project5B_65(G19,BW19)
    [ACC_20, F1_20] = Project5B_65(G20,BW20)
    
    figure;
    imshow(BW1);
    title("Image1--> ACC: " + ACC_1 + " F1: " + F1_1);

    
    
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