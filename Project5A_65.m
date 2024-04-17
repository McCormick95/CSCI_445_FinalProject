function [g] = Project5A_65(f)
    %Project5A_65: 
    %
    %   INPUT:  f: image
    %
    %   OUTPUT: BW: logical image
    %

    addpath("./reference_files");
    k = 1000;
    n = 10000;

    % g2 – create the superpixel image of f with n desired superpixels.
    g2 = im2double(f);

    g = imgaussfilt(g2, 8);
    g = imgradient(g, "sobel");
    g = imgaussfilt(g, 3);
    

    [L2, NL2] = superpixels(g2, n);
    
    sp2 = zeros(size(g2),'like',g2);
    
    idx2 = label2idx(L2);
    
    for labelVal = 1:NL2
        grayIdx = idx2{labelVal};
        sp2(grayIdx) = mean(g2(grayIdx));
    end

    g2 = mat2gray(sp2);

    [idx3, C3] = kmeans(g2(:), k);
    
    g2 = reshape(C3(idx3, :), size(f));
    g = mat2gray(g2);

    g1 = im2double(g);

    [idx1, C1] = kmeans(g1(:), k);
    
    g = reshape(C1(idx1, :), size(f));

    g = imgaussfilt(g, 2);
    g = imsharpen(g, "Radius", 2, "Amount", 1.5);
    
    % [T1, ] = graythresh(g);
 
    % %convert the image to binary
    % g = imbinarize(g, T1);
    
    edges = edge(g,"canny",0.099);

    % se90 = strel('line',1,90);
    % se0 = strel('line',1,0);
    % g = imdilate(edges,[se90 se0]);
    

    % s= strel("line", 100, 0);
    % % Erode the image 'f' using the structuring element 's'
    % fer = imerode(g, s);

    % % Reconstruct the original image 'f' from the eroded image 'fer'
    % imgRe = imreconstruct(fer,g);

    % % Complement the reconstructed image 'imgRe'
    % imgReComp = imcomplement(imgRe);

    % % Erode the complemented image 'imgReComp' using the structuring element 's'
    % imgReCompE = imerode(imgReComp, s);

    % % Reconstruct the complemented image 'imgReComp' 
    % % from the eroded image 'imgReCompE' and then complement the result
    % g = imcomplement(imreconstruct(imgReCompE, imgReComp));

    se = strel('line', 4, 8);
    edges = imclose(edges,se);

    se = strel('line', 4, 8);
    edges = imclose(edges,se);

    se90 = strel('line', 1, 10);
    se0 = strel('line', 1,0);
    edges = imdilate(edges,[se90 se0]);

    s= strel("line", 100, 0);
    % Erode the image 'f' using the structuring element 's'
    fer = imerode(edges, s);

    % Reconstruct the original image 'f' from the eroded image 'fer'
    imgRe = imreconstruct(fer, edges);

    % Complement the reconstructed image 'imgRe'
    imgReComp = imcomplement(imgRe);

    % Erode the complemented image 'imgReComp' using the structuring element 's'
    imgReCompE = imerode(imgReComp, s);

    % Reconstruct the complemented image 'imgReComp' 
    % from the eroded image 'imgReCompE' and then complement the result
    g = imcomplement(imreconstruct(imgReCompE, imgReComp));

    comb = imoverlay(g, edges, 'w');
    g = im2double(comb);

    % %OTSU's METHOD:
    % f = medfilt2(g);
    
    % [T1, ] = graythresh(f);
 
    % %convert the image to binary
    % g = imbinarize(f, T1);

    % g = imgradient(g, "sobel");
    
    % g = imhmin(g, 0.1);
    % Ls = watershed(g);
    % g = Ls == 0;

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