clear;clc;


disp('���ڽ������ݼ�ѵ��')
yatrain('C:\Users\ASUS\Desktop\faceqimo\pic\train','C:\Users\ASUS\Desktop\faceqimo\Mat');
disp('ģ��ѵ�����')

disp('���ڽ������ݼ�Ԥ��')
yapredicts('C:\Users\ASUS\Desktop\faceqimo\pic\test','C:\Users\ASUS\Desktop\faceqimo\Mat');


load('C:\Users\ASUS\Desktop\faceqimo\Mat\yatest.mat');
disp('���ڽ��е���Ԥ��')
strPath='C:\Users\ASUS\Desktop\faceqimo\pic\test\s1\t (1).jpeg';
pgroup1=yapredict(strPath,'C:\Users\ASUS\Desktop\faceqimo\Mat');
disp('Ԥ����Ϊ��')
if pgroup1==1
    disp('�º���')
elseif pgroup1==2
    disp('��ɰ�')
elseif pgroup1==3
    disp('���Һ�')
elseif pgroup1==4
    disp('֣����')
elseif pgroup1==5
    disp('�ӱ�')
end