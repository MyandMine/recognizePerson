clear all;
close all;
clc;

obj=videoinput('winvideo');       %һ��ļ�������ͷ���������������Ϳ��ԣ���������ֱ��ȥ������������Ҳ����
h1=preview(obj);                 %Ԥ����Ƶ��ͬʱ��ȡ���  
h2=figure(2);                    %�½���ʾͼ��figure,ͬʱ��ȡ���
faceDetector = vision.CascadeObjectDetector();
while ishandle(h1) && ishandle(h2)              %���������һ���رվͽ�������
     frame=getsnapshot(obj);     %����ͼ��
    frame=rgb2gray(frame);     %ת�ɲ�ɫ,���frame�Ϳ��԰����Լ���Ը������
    bbox = faceDetector.step(frame);
    videoOut = insertObjectAnnotation(frame,'rectangle',bbox,'Face');
    imshow(frame);              %��ʾͼ��
    drawnow;                    % ʵʱ����ͼ��
end

delete(obj);                %ɾ������