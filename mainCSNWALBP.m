clc
clear all


% Load an example image (replace with your own image)
originalImage = imread('lena_std.tif');
originalImage=im2gray(originalImage);

newSize=[511 , 511];
originalImage=imresize(originalImage,newSize);
size(originalImage);

% Specify the amount of padding on all sides
topPad = 2;
bottomPad = 2;
leftPad = 2;
rightPad = 2;

% Define the value for padding (e.g., 0 for black, 255 for white)
paddingValue = 0;



% Use the padarray function to add padding
paddedImage = padarray(originalImage, [topPad, leftPad], paddingValue, 'both');
paddedImage = padarray(originalImage, [bottomPad, rightPad], paddingValue, 'both');

% Display the padded image
paddedImage;
sz=size(paddedImage);






nwalbpImage=uint8(zeros(size(originalImage)));



% Initialize a cell array to store the 3x3 windows
% Loop through the image and extract 3x3 windows

for i = 3:(sz(1) - 2)
    for j = 3:(sz(2) -2)
        % Extract the 5 * 5 window centered at (i, j)
        window = paddedImage(i-2:i+2, j-2:j+2);
        % Store the window in the cell array
 
       g= nwlbp_calculation(window);
        sum=myfcn_CSNWALBP(g);
        
        csnwalbpImage(i-2,j-2)=uint8(sum);
    end
    
    
    
end
imshow(csnwalbpImage,[])



