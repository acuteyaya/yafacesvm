function [imgRow,imgCol,FaceContainer,faceLabel] = pyrd(nFacePerPerson,nPerson,bTest,str)
    if str==0 
        str='C:\Users\ASUS\Desktop\robotlook\pic\train\s';
    end
    str=strcat(str,'\s');
    imgRow=100;
    imgCol=100;
    FaceContainer=zeros(nFacePerPerson*nPerson,imgRow*imgCol);
    faceLabel=zeros (nFacePerPerson*nPerson,1);
    for i=1:nPerson
        i1=mod(i,10);
        i0=char(i/10);
        strPath=str;
        if (i0~=0)
          strPath=strcat(strPath,48+i0);
        end
        strPath=strcat(strPath,48+i1);
        strPath=strcat (strPath,'\');
        tempstrPath=strPath;
        if bTest==0
            tempstrPath=strcat(tempstrPath,'n (');
            for j=1:nFacePerPerson
                strPath=tempstrPath;
                strPath=strcat(strPath,num2str(j));
                strPath=strcat(strPath,')');
                strPath=strcat(strPath,'.jpeg');
                
                img=imread(strPath);
                gray=rgb2gray(img);
                img=imresize(gray,[100,100]);
                FaceContainer((i-1)*nFacePerPerson+j, :) = img(:)';
                faceLabel((i-1)*nFacePerPerson+j) = i;
            end
        elseif bTest==1
            tempstrPath=strcat(tempstrPath,'t (');
            for j=1:nFacePerPerson
                strPath=tempstrPath;
                strPath=strcat(strPath,num2str(j));
                strPath=strcat(strPath,')');
                strPath=strcat(strPath,'.jpeg');
                
                img=imread(strPath);
                gray=rgb2gray(img);
                img=imresize(gray,[100,100]);
                FaceContainer((i-1)*nFacePerPerson+j, :) = img(:)';
                faceLabel((i-1)*nFacePerPerson+j) = i;
            end
        end    
    end
    %save('C:\Users\ASUS\Desktop\FaceRec\MatFaceMat.mat','FaceContainer');
end