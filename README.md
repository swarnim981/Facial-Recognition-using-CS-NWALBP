
## FACE RECOGNITION USING CS-NWALBP 
This paper is based on the implementation of facial recognition by using the feature extraction process CS-NWALBP(Center symmetric neighborhood weighted average local binary pattern). To further improve the performance of the existing local binary pattern (LBP) operator which is the first operator used to solve the complex illumination problem with facial recognition, neighborhood weighted average LBP (NWALBP) is first proposed for fully considering the strong correlations between pixel pairs in the neighborhood, which extends the traditional LBP uni-layer neighborhood template window to the bi-layer neighborhood template window and calculates the weighted average of bi-layer neighborhood pixels in each direction. Then, inspired by
center symmetric LBP (CS-LBP), center symmetric NWALBP (CS-NWALBP) is further proposed, which can effectively reduce computation complexity by only comparing the
weighted average values of the neighborhood pixels that are symmetric about the center pixel

## INSTALLATION
THE CODE IS WRITTEN IN MATLAB
## DOCUMENTATION
NWALBP is an improved LBP operator that is better for facial recognition under complex illuminations. For fully considering the strong correlations between pixel pairs in the neighborhood, the template window with radius 1 and size of 3*3is extended to that with a radius of 2 and size of 5 by 5. Then, the weighted average values of the neighborhood pixels from the
inner and outer layers adjacent to the center pixel are calculated

## main.m
This function is the main code which is used to classify images baed on cs-nwalbp
## nwlbp_calculation
This function gives weights arounf the center pixel
by considering inner and outer layers in 5*5 window
## myfcn_LBP
This function used to calculate LBP pattren for given 3*3 window
## myfcn_binaryToDecimal
This function is used to convert binary code into its corresponding decimal value

## Get_Windows
This function is used to get divide image into windows based on given window size
##  Get_Normalized_Histograms
This function is used to get normalised histograms for each window
## myfcn_getGlobalHist
THis function gives global histogram by concatenating histograms of all windows in an a given image

## Classifier_T4C2
This function is used to classify the given input images into 2 classes .Here i classified the images into girl and boy and labelled them 
 ##REFERENCES:
 
 Chen, T., et al.: A novel face recognition method based on the fusion of LBP and HOG. IET Image Process. 15, 3559–3572 (2021). https://doi.org/10.1049/ipr2.12192

## myfcn_getGlobalHist
THis function gives global histogram by concatenating histograms of all windows in an a given image
