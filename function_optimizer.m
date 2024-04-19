function [g] = function_optimizer(f, sigma, sensitivity, lenDisk, lenLine, lenH, lenV)
    addpath("./reference_files");

    eqImg = adapthisteq(f);

    dblImg = im2double(eqImg);

    filtImg = imgaussfilt(dblImg, sigma);
    binImg = imcomplement(imbinarize(filtImg, 'adaptive', 'Sensitivity', sensitivity));
    
    s = strel("disk", lenDisk, 0);
    fer = imerode(binImg, s);
    imgRe = imreconstruct(fer, binImg);
    imgReComp = imcomplement(imgRe);
    imgReCompE = imerode(imgReComp, s);
    reConImg = imcomplement(imreconstruct(imgReCompE, imgReComp));

    g = reConImg;

    sD = strel('line', lenLine, -45);
    sV = strel('line', lenLine, 90);
    sH = strel('line', lenLine, 0);
    dImgD = imdilate(reConImg, sD);
    dImgV = imdilate(dImgD, sV);
    dImgH = imdilate(dImgV, sH);

    g = dImgH;

    seH = strel('line', lenH, 0);
    seV = strel('line', lenV, 90);
    closedH = imclose(dImgH,seH);
    closedV = imclose(closedH,seV);

    g = closedV;
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

    g = im2double(g); 
end