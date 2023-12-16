%% %% Task(c) Classifier 2
close all;clear; clc ;
%Read in the images from folder images 
%out of the images in folder using 2 images for training 
% one to test or classify
girl3 = imread("C:\Users\swarn\Desktop\IIT kgp\Sem 1\DIP\capstone project\Myproject\final\images\9338535\9338535.1.jpg");%Load image to train
girl2 = imread("C:\Users\swarn\Desktop\IIT kgp\Sem 1\DIP\capstone project\Myproject\final\images\9338535\9338535.2.jpg");%Load image to train
girl1 = imread("C:\Users\swarn\Desktop\IIT kgp\Sem 1\DIP\capstone project\Myproject\final\images\9338535\9338535.3.jpg");%Load image to train

boy3 = imread("C:\Users\swarn\Desktop\IIT kgp\Sem 1\DIP\capstone project\Myproject\final\images\9338489\9338489.1.jpg");%Load image to train
boy2 = imread("C:\Users\swarn\Desktop\IIT kgp\Sem 1\DIP\capstone project\Myproject\final\images\9338489\9338489.2.jpg");%Load image to train
boy1 = imread("C:\Users\swarn\Desktop\IIT kgp\Sem 1\DIP\capstone project\Myproject\final\images\9338489\9338489.3.jpg");%Load image to train
% resizing all images to required dimensions i.e 512*512
girl3=imresize(girl3,[512,512]);
girl2=imresize(girl2,[512,512]);
girl1=imresize(girl1,[512,512]);
boy3=imresize(boy3,[512,512]);
boy2=imresize(boy2,[512,512]);
boy1=imresize(boy1,[512,512]);

windowSize = 128; %Choose window size 8,16,32,64,128

%Assign train and test data
trainData = zeros(512,512,3,4);
    trainData(:,:,:,1) = girl1; %This location must store a girl face
    trainData(:,:,:,2) = girl2; %This location must store a girl face
   
    trainData(:,:,:,3) = boy1; %This location must store a boy face
    trainData(:,:,:,4) = boy2; %This location must store a boy face
    
testData = zeros(512,512,3,2);
    testData(:,:,:,1) = girl3; 
    testData(:,:,:,2) = boy3; 
    
%Classifier which uses 4 images(out of which 2 are girl faces and 2 are boy faces to train the model and 
% classifies all images in images folder,
% Red labelled images are the test data and are classified using the model
% black labelled images are images used in the training to build the model
classLabels2 = Classifier_T4C2(trainData, testData);% function to classify and give label as girl or boy

