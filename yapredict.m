function [pgroup1]=yapredict(strPath,str2)
if str2==0
    load('Mat/yatrain.mat');
else
    str2=strcat(str2,'/yatrain.mat');
    load(str2);
end

ya=zeros(1,10000);
img=imread(strPath);
figure;
imshow(img);
img=rgb2gray(img);
img=imresize(img,[100,100]);
ya(1,:) = img(:);
xNewFace = double(ya);
xNewFace = (xNewFace-Z)*W;
Y2 = scaling(xNewFace,1,A0,B0);
m=ones(1,1);
pgroup1 = svmpredict(m,Y2,svmStr);

