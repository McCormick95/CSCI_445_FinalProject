function [ACC, F1] = Project5B_65(G, BW)
    %PROJECT4B_65: Takes in an image and a "golden" reference 
    %               image and uses these to calculate
    %              the accuracy and F-score of the image
    %
    %   INPUT:  G: "golden" reference image
    %           BW: image
    %
    %   OUTPUT: ACC: accuracy
    %           F1: F-score

    % Convert to double and binarize
    G = im2double(G);
    gold = imbinarize(G);

    % Flattens the images
    bwFlat = BW(:);
    goldFlat = gold(:);

    % Calculates the true positive, true negative
    trueNeg = sum((bwFlat == 0) & (goldFlat == 0));
    truePos = sum((bwFlat == 1) & (goldFlat == 1));

    % Calculates the false positive, and false negative
    falseNeg = sum((bwFlat == 0) & (goldFlat == 1));
    falsePos = sum((bwFlat == 1) & (goldFlat == 0));

    % Calculates the accuracy (ACC) and F-score (F1)
    ACC = (truePos + trueNeg) / (truePos + trueNeg + falsePos + falseNeg);
    F1 = (2*truePos) / (2*truePos + falsePos + falseNeg);
    
end