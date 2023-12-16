function hist= myfcn_getGlobalHist(originalImage)
%converting RGB image into Gray scale image
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
%creating an array of zeros with dimensions of input image
nwalbpImage=uint8(zeros(size(originalImage)));



% Initialize a cell array to store the 5x5 windows
% Loop through the image and extract 5x5 windows

for i = 3:(sz(1) - 2)
    for j = 3:(sz(2) -2)
        % Extract the 5 * 5 window centered at (i, j) 
        % i.e extracting 5 *5 window for each pixel in its neighbourhood
        window = paddedImage(i-2:i+2, j-2:j+2);
        % Store the window in the cell array
 
       g= nwlbp_calculation(window);% function gives 3 * 3 matrix which contain weight values in eight different directions calculated by krish operator
        ImgLBP=myfcn_LBP(g);% gives LBP code of given 3*3 window
        sum=myfcn_binaryToDecimal(ImgLBP);% converts binary to decimal number
        nwalbpImage(i-2,j-2)=sum; % replacing the pixel with its correspoding NWALBP code
    end   
end
imshow(nwalbpImage) % displays NWALBP feature image


%% Task (A)extracting windows from NWALBP image and normalise histograms of these windows


nwalbpImage=imresize(nwalbpImage,[512,512]);

windowSize = 128; %window Size can be 4,8,16,32,64 or 128 for  images    
windows = Get_Windows(nwalbpImage, windowSize);%Get windows
[normalisedHistograms, histograms] = Get_Normalized_Histograms(windows);%Get normalise histograms of these windows



%% Task(B) Show each window and its histogram side by side per second
   i = 0;
   for h = 1:size(normalisedHistograms,1)
        i = i+ 1;% i is the current window number being shown
        %Plot window and histogram side by side per window
        figure(1)
        subplot(2,2,1), imshow(nwalbpImage);title('Original Image');
        subplot(2,2,2), imshow(windows(:,:,h)); title(strcat('Window: ',num2str(i)));
        subplot(2,2,3), plot(0:255, normalisedHistograms(h,:)); title(strcat('Normalised Histogram of nwaLBP Window: ',num2str(i)));                 
            ax = gca;ax.FontSize = 5;%makes title font size smaller to prevent overlap with y axis values

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

hist=globalHistogram;
end

