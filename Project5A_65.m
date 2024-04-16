function [g] = Project5A_65(f)
    %Project5A_65: 
    %
    %   INPUT:  f: image
    %
    %   OUTPUT: BW: logical image
    %

    addpath("./reference_files");
    

    % g2 – create the superpixel image of f with n desired superpixels.
    g2 = im2double(f);

    g2 = imgaussfilt(g2, 1);
    g = imgradient(g2, "sobel");
    
    g = imhmin(g, 0.1);
    Ls = watershed(g);
    g = Ls == 0;

    % se90 = strel('line',1,90);
    % se0 = strel('line',1,0);
    % g = imdilate(g,[se90 se0]);
    

    % s= strel("line", 100, 0);
    % % Erode the image 'f' using the structuring element 's'
    % fer = imerode(f, s);

    % % Reconstruct the original image 'f' from the eroded image 'fer'
    % imgRe = imreconstruct(fer,f);

    % % Complement the reconstructed image 'imgRe'
    % imgReComp = imcomplement(imgRe);

    % % Erode the complemented image 'imgReComp' using the structuring element 's'
    % imgReCompE = imerode(imgReComp, s);

    % % Reconstruct the complemented image 'imgReComp' 
    % % from the eroded image 'imgReCompE' and then complement the result
    % g = imcomplement(imreconstruct(imgReCompE, imgReComp));

    % g = imfill(g, 'holes');


    %edges = edge(g,"canny",0.1);

    % g = im2double(edges);
    % %OTSU's METHOD:
    % f = medfilt2(g);
    
    % [T1, ] = graythresh(f);
 
    % %convert the image to binary
    % g = imbinarize(f, T1);


    
end