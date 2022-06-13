clear;clc;


disp('正在进行数据集训练')
yatrain('C:\Users\ASUS\Desktop\faceqimo\pic\train','C:\Users\ASUS\Desktop\faceqimo\Mat');
disp('模型训练完毕')

disp('正在进行数据集预测')
yapredicts('C:\Users\ASUS\Desktop\faceqimo\pic\test','C:\Users\ASUS\Desktop\faceqimo\Mat');


load('C:\Users\ASUS\Desktop\faceqimo\Mat\yatest.mat');
disp('正在进行单张预测')
strPath='C:\Users\ASUS\Desktop\faceqimo\pic\test\s1\t (1).jpeg';
pgroup1=yapredict(strPath,'C:\Users\ASUS\Desktop\faceqimo\Mat');
disp('预测结果为：')
if pgroup1==1
    disp('陈航宇')
elseif pgroup1==2
    disp('大可爱')
elseif pgroup1==3
    disp('黄忠豪')
elseif pgroup1==4
    disp('郑宁杰')
elseif pgroup1==5
    disp('钟彬')
end