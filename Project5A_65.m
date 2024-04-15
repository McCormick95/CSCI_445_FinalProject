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
    
    g = imhmin(g, 0.099);
    Ls = watershed(g);
    g = Ls == 0;

    edges = edge(g,"canny",0.1);

    % g = im2double(edges);
    % %OTSU's METHOD:
    % f = medfilt2(g);
    
    % [T1, ] = graythresh(f);
 
    % %convert the image to binary
    % g = imbinarize(f, T1);


    
end