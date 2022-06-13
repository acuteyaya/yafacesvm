'''
File Name          : python.py
Author             : CUTEYAYA
Version            : V1.0.1
Created on         : 29/12/2021
'''

import matlab.engine
from PySide2.QtWidgets import QApplication
from PySide2.QtUiTools import QUiLoader
eng = matlab.engine.start_matlab()
bj=0
bj1=0
sj=r'C:\Users\ASUS\Desktop\robotlook\pic'
mx=r'C:\Users\ASUS\Desktop\faceqimo\Mat'

class Stats:
    def __init__(self):
        self.ui = QUiLoader().load(r"C:\Users\ASUS\Desktop\faceqimo\ya.ui")
        self.ui.pushButton.clicked.connect(self.handleCalc1)#
        self.ui.pushButton_3.clicked.connect(self.handleCalc2)#全国
        self.ui.pushButton_4.clicked.connect(self.handleCalc3)#今日
        self.ui.textEdit_2.setPlaceholderText("未训练")
        self.ui.textEdit.setPlaceholderText("未开始预测")
    def handleCalc1(self):
        global mx,sj,bj1
        self.ui.textEdit_2.setPlaceholderText("(" + str(bj1) + ")" + "模型训练中.........")
        i1 = self.ui.lineEdit.text()
        i2 = self.ui.lineEdit_2.text()
        sj=i1
        mx=i2
        print('正在进行数据集训练')
        eng.yatrain(sj, mx, nargout=0)
        print('模型训练完毕')
        self.ui.textEdit_2.setPlaceholderText("("+str(bj1)+")"+"训练完毕:"+'\n'+"              人脸识别模型路径->"+mx+"\yatrain.mat")
        bj1 = bj1 + 1
        bj1 = bj1 % 99
        print()
    def handleCalc2(self):
        global mx,sj,bj
        self.ui.textEdit.setPlaceholderText("(" + str(bj) + ")" + "人物预测中.........")
        i1 = self.ui.lineEdit_3.text()
        i2 = self.ui.lineEdit_4.text()
        sj = i1
        mx = i2
        print('正在进行数据集预测')
        y=eng.yapredicts(sj,mx)
        print('模型预测准确率为',end='')
        print(y[0][0],end='')
        print('%')
        self.ui.textEdit.setPlaceholderText("("+str(bj)+")"+"模型预测准确率为:"+str(y[0][0])+"%")
        bj=bj+1
        bj=bj%99
        print()
    def handleCalc3(self):
        global mx, sj, bj
        self.ui.textEdit.setPlaceholderText("(" + str(bj) + ")" + "模型预测中.........")
        i1 = self.ui.lineEdit_5.text()
        i2 = self.ui.lineEdit_4.text()
        sj = i1
        mx = i2
        print('正在进行单张预测')
        y = int(eng.yapredict(sj, mx))
        print('模型预测人脸为', end='')
        if y == 1:
            yt='1'
        elif y == 2:
            yt='大大大可爱'
        elif y == 3:
            yt='2'
        elif y == 4:
            yt='3'
        elif y == 5:
            yt='4'
        print(yt)
        self.ui.textEdit.setPlaceholderText("(" + str(bj) + ")" + "模型预测人脸为:"+yt)
        bj = bj + 1
        bj = bj % 99
        print()
if __name__ == '__main__':
    app = QApplication([])
    stats = Stats()
    stats.ui.show()
    app.exec_()