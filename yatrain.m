function yatrain(str1,str2)
[~,~,FaceContainer,faceLabel]=pyrd(15,5,0,str1);
%nFaces=size(FaceContainer,1);
[lowDimFazes,W,Z]=PCA(FaceContainer,15);
[Y,A0,B0] = scaling(lowDimFazes);
data = Y;  
group = faceLabel; 
idx = randperm(size(data,1));
N = length(idx);
xdata = data(idx(1:N),:);
xgroup = group(idx(1:N));
svmStr = svmtrain(xgroup,xdata,'-c 0.6 -s 0 -t 2 -g 0.2');
%-s c-svc(svm¿‡–Õ) -c svc-cost 
%-t®CRBF∫Ø ˝£∫exp(-gamma|u-v|^2) 

if str2==0
    save('Mat/yatrain.mat', 'svmStr', 'W','Z','A0','B0');
else
    str2=strcat(str2,'/yatrain.mat');
    save(str2, 'svmStr', 'W','Z','A0','B0');
end

