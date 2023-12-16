function class = Classifier_T4C2(trainData, testData) 
% Train 4 and Classify 2 - works
windowSize = 128; %window Size can be 4,8,16,32,64 or 128 for  images   

%Get train images from 4D double matrix trainData and convert to uint8
%In traindata 1 and 2 are girl faces & 3 and 4 are boy faces
train_image1 = uint8(trainData(:,:,:,1));
train_image2 = uint8(trainData(:,:,:,2));
train_image3 = uint8(trainData(:,:,:,3));
train_image4= uint8(trainData(:,:,:,4));
%Get test images from 4D double matrix testData and convert to uint8
test_image1 = uint8(testData(:,:,:,1));
test_image2 = uint8(testData(:,:,:,2));



%Image to be classified are:
%girl image for traindata
girl1TrainGlobal1 = myfcn_getGlobalHist(train_image1);

%girl image for traindata
girl2TrainGlobal2 = myfcn_getGlobalHist(train_image2);

%boy image for traindata
boy1TrainGlobal1= myfcn_getGlobalHist(train_image3);
%boy image for traindata
boy2TrainGlobal2= myfcn_getGlobalHist(train_image4);

%girl image for testdata
test1global = myfcn_getGlobalHist(test_image1);


%boy image for testdata
test2global = myfcn_getGlobalHist(test_image2);


rows = size(train_image1,1);%number of rows in image
columns = size(train_image1,2);%number of columns in image
numberOfWindows = (rows/windowSize)*(columns/windowSize);%number of windows
columnsInGlobalHistogram = size(test1global,2);%number of columns in global histogram, assuming all images are of same dimensions

imagesGlobalHistograms = zeros(numberOfWindows,columnsInGlobalHistogram);%intitialises size of imagesGlobalHistogram
imagesGlobalHistograms(1,:) = girl1TrainGlobal1;%
imagesGlobalHistograms(2,:) = girl2TrainGlobal2;%

imagesGlobalHistograms(3,:) = boy1TrainGlobal1;%
imagesGlobalHistograms(4,:) = boy2TrainGlobal2;%

imagesGlobalHistograms(5,:) = test1global;% test image to be classified
imagesGlobalHistograms(6,:) = test2global;% %test image to be classified

%Comment: Images used in train are being classified 
%Search Space:----------------------------

for i = 1:size(imagesGlobalHistograms,1)
%we are calculating he Euclidean distance between their global histograms and the global histograms of reference images.
%girl1
girl1TrainGlobal1 = myfcn_getGlobalHist(train_image1);
Dface1car2 = sqrt( sum( ((imagesGlobalHistograms(i,:) - girl1TrainGlobal1).^2)));
D(1,2) = Dface1car2; 

%girl2

 girl2TrainGlobal2= myfcn_getGlobalHist(train_image2);
Dface1car3 = sqrt( sum( ((imagesGlobalHistograms(i,:)- girl2TrainGlobal2).^2)));
D(1,3) = Dface1car3;



%boy1
%img = imread('DatasetA/face-2.jpg');%Load image from Dataset A 
 boy1TrainGlobal1=myfcn_getGlobalHist(train_image4);
Dface1face3 = sqrt( sum( ((imagesGlobalHistograms(i,:)- boy1TrainGlobal1).^2)));
D(2,2) = Dface1face3;

%boy2
%img = imread('DatasetA/face-3.jpg');%Load image from Dataset A
 boy2TrainGlobal2= myfcn_getGlobalHist(train_image3);
Dface1face3 = sqrt( sum( ((imagesGlobalHistograms(i,:)- boy2TrainGlobal2).^2)));
D(2,3) = Dface1face3;
% end of search space --------------------------

D(2,1) = 100; %D first row for girl, 2nd row for boy
D(1,1) = 100;
%Now classify to class with shortest euclidean distance
minD = D(1,1);
class(i) = "";
for r =1 : 2
    for c = 1:3
        if D(r,c) < minD
            minD = D(r,c);
            if r == 1
                class(i) = "girl face";
            else
                class(i) = "boy face";
            end
        end
    end
end
end
figure(); 
subplot(2,3,1);imshow(train_image1); title(class(1)); 
subplot(2,3,2);imshow(train_image2); title(class(2));
subplot(2,3,4);imshow(train_image3); title(class(3));
subplot(2,3,5);imshow(train_image4); title(class(4));
subplot(2,3,3);imshow(test_image1); title('\color{red}' + class(5));
subplot(2,3,6);imshow(test_image2); title('\color{red}' + class(6));
end