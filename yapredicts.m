function [accuracy]=yapredicts(str1,str2)
if str2==0
    load('Mat/yatrain.mat');
else
    str2=strcat(str2,'/yatrain.mat');
    load(str2);
end


[~,~,FaceContainer1,faceLabel1]=pyrd(5,5,1,str1);
%nFaces1=size(FaceContainer1,1);
%[lowDimFazes1,W1,Z1]=PCA(FaceContainer1,15);
FaceContainer1 = double(FaceContainer1);
FaceContainer1 = (FaceContainer1-Z)*W; 
Y1 = scaling(FaceContainer1,1,A0,B0);
P = size(Y1,1); 
idx1 = randperm(size(Y1,1));
ydata = Y1(idx1(1:P),:);
ygroup= faceLabel1(idx1(1:P));
%[pgroup,accuracy,~] = svmpredict(xgroup,xdata,svmStr);
[p,accuracy,~] = svmpredict(ygroup,ydata,svmStr);
save('C:\Users\ASUS\Desktop\faceqimo\Mat\yatest.mat', 'p', 'accuracy','ygroup');
