function [g] = Project5A_65(f)
    %Project5A_65: takes an image, processes that image to isolate the
    %              lungs in an x-ray image. 
    %
    %   INPUT:  f: image
    %
    %   OUTPUT: BW: logical image
    %

    addpath("./reference_files");
    sigma = .5;
    bestSense = 0.7;
    diskLength = 1;
    lineLength = 1;
    lengthH = 4;
    lengthV = 10;



    eqImg = adapthisteq(f);

    dblImg = im2double(eqImg);

    filtImg = imgaussfilt(dblImg, sigma);

    [T1, ] = graythresh(filtImg);
 
    binImg = imcomplement(imbinarize(filtImg, 'adaptive', 'Sensitivity', bestSense));

    
    s= strel("disk", diskLength, 0);
    fer = imerode(binImg, s);
    imgRe = imreconstruct(fer, binImg);
    imgReComp = imcomplement(imgRe);
    imgReCompE = imerode(imgReComp, s);
    reConImg = imcomplement(imreconstruct(imgReCompE, imgReComp));

    g = reConImg;

    sD = strel('line', lineLength, -45);
    sV = strel('line', lineLength, 90);
    sH = strel('line', lineLength, 0);
    dImgD = imdilate(reConImg, sD);
    dImgV = imdilate(dImgD, sV);
    dImgH = imdilate(dImgV, sH);

    g = dImgH;

    seH = strel('line', lengthH, 0);
    seV = strel('line', lengthV, 90);
    closedH = imclose(dImgH,seH);
    closedV = imclose(closedH,seV);

    g = closedV;

    % g = imfill(closedV, 'holes');

    g = imclearborder(g);

    [labeledImage, numRegions] = bwlabel(g);

    % Measure properties of image regions
    regionProps = regionprops(labeledImage, 'Area');

    % Get the areas of all regions
    allAreas = [regionProps.Area];

    % Sort areas in descending order
    [~, sortedIndices] = sort(allAreas, 'descend');

    % Create a new binary image
    g = false(size(g));

    % If there are at least two regions, keep only the two largest
    if numRegions >= 2
        g(labeledImage == sortedIndices(1)) = true;
        g(labeledImage == sortedIndices(2)) = true;
    elseif numRegions == 1
        % If there's only one region, keep it
        g(labeledImage == sortedIndices(1)) = true;
    end

    g = imfill(g, 'holes');

end