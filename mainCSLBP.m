clc
clear all


% Load an example image (replace with your own image)
originalImage = imread('lena_std.tif');
originalImage=im2gray(originalImage);

newSize=[510 , 510];
originalImage=imresize(originalImage,newSize);
originalImage;

% Specify the amount of padding on all sides
topPad = 1;
bottomPad = 1;
leftPad = 1;
rightPad = 1;

% Define the value for padding (e.g., 0 for black, 255 for white)
paddingValue = 0;

a=zeros(169);

% Use the padarray function to add padding
paddedImage = padarray(originalImage, [topPad, leftPad], paddingValue, 'both');
paddedImage = padarray(originalImage, [bottomPad, rightPad], paddingValue, 'both');

% Display the padded image
paddedImage;
sz=size(paddedImage);






LbpImage=uint8(zeros(size(originalImage)));



% Initialize a cell array to store the 3x3 windows
% Loop through the image and extract 3x3 windows

for i = 2:(sz(1) - 1)
    for j = 2:(sz(2) - 1)
        % Extract the 3x3 window centered at (i, j)
        window = paddedImage(i-1:i+1, j-1:j+1);
        % Store the window in the cell array
 
        sum=myfcn_CSLBP(window); % calculates cs_lbp value for each 3*3 window
        
        CSLbpImage(i-1,j-1)=uint8(sum);

    end
end
imshow(CSLbpImage,[])

