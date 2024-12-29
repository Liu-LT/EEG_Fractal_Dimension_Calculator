function fractalDimension = CalculateFD(imagePath)
    % Load the image and convert it to grayscale and binary
    img = imread(imagePath);
    bwImg = imbinarize(rgb2gray(img));
    % Get the size of the image
    [rows, cols] = size(bwImg);
    % Initialize parameters
    S = max(rows, cols);
    p = floor(log2(S));
    S0 = 2^p;
    N = 0;
    boxCounts = zeros(1, p+1);
    scales = zeros(1, p+1);

    % Loop until the box size is less than 1
    while S > 1
        S = S0 / 2^N;
        scales(N+1) = S;
        numBoxes = 0;
    
        for x = 1:S:cols
            for y = 1:S:rows
                xEnd = min(x + S - 1, cols);
                yEnd = min(y + S - 1, rows);
                box = bwImg(y:yEnd, x:xEnd);
                % Calculate the pixels
                if any(box(:))
                    numBoxes = numBoxes + 1;
                end
            end
        end
        boxCounts(N+1) = numBoxes;
        N = N + 1;
    end

    % Perform regression to calculate the fractal dimension
    logScales = log(1 ./ scales);
    logCounts = log(boxCounts);
    p = polyfit(logScales, logCounts, 1); % Least squares fitting
    fractalDimension = p(1);
    disp(['Estimated fractal dimension: ', num2str(fractalDimension)]);
end



