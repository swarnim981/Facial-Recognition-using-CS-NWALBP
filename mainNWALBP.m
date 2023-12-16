%main file to create NWALBP filter


clc
clear all


% Load an example image (replace with your own image)
%originalImage = imread('lena_std.tif');
originalImage=imread("lena_std.tif");
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
        ImgLBP=myfcn_LBP(g);
        sum=myfcn_binaryToDecimal(ImgLBP);
        nwalbpImage(i-2,j-2)=sum;
    end
    
    
    
end
imshow(nwalbpImage)


%% qww


nwalbpImage=imresize(nwalbpImage,[512,512]);

windowSize = 128; %window Size can be 4,8,16,32,64 or 128 for Dataset A images    
windows = Get_Windows(nwalbpImage, windowSize);%Get windows
%windowsLBP = ICV_Get_LBP_Windows(img, windowSize);%Split Image into LBP windows and get windows
[normalisedHistograms, histograms] = Get_Normalized_Histograms(windows);%Get normalise histograms of these windows



%% Task(a) Show each window and its histogram side by side per second
   i = 0;
   for h = 1:size(normalisedHistograms,1)
        i = i+ 1;% i is the current window number being shown
        %Plot window and histogram side by side per window
        figure(1)
        subplot(2,2,1), imshow(nwalbpImage);title('Original Image');
        subplot(2,2,2), imshow(windows(:,:,h)); title(strcat('Window: ',num2str(i)));
        subplot(2,2,3), plot(0:255, normalisedHistograms(h,:)); title(strcat('Normalised Histogram of nwaLBP Window: ',num2str(i)));                 
            ax = gca;ax.FontSize = 5;%makes title font size smaller to prevent overlap with y axis values
        %subplot(2,2,4), imshow(windows(:,:,h)); title(strcat('nwaLBP of Window: ',num2str(i)));
        pause(0.7);%Delay execution by this many seconds
   end
   %Take normalised histograms of nwaLBP windows and concatonate them 
[windowSizeColumns,windowSizeRows,numberOfWindows]  = size(windows,1,2,3);
numberOfColumnsInGlobal = numberOfWindows * 256; %256, for 0 to 255 pixel intensity values
numberOfHistograms = size(normalisedHistograms,1);%each window has a histogram 
numberOfIntensityValues = size(normalisedHistograms,2); %256
globalHistogram = zeros(1, numberOfColumnsInGlobal);
n = 1;
    for h = 1 : numberOfHistograms
     for i = 1:numberOfIntensityValues
      globalHistogram(1,n) = normalisedHistograms(h,i);
      n = n +1;
     end
    end

figure();plot(globalHistogram); 
xlabel('concatenation of histogram of each window')
ylabel('probability distribution function(pixes/total no of pixels)')
title('global histogram')

%% 
