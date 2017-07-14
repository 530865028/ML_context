clc
clear
close all

I = imread('fanqie.jpg');
figure(1);
subplot(121);
imshow(rgb2gray(I));
kernel = [1,0,-1;1,0,-1;1,0,-1]; %�����
stride = 1; %�������
key_word = 'Same'; %���������size���ֲ��� ,��Valid�������ı�
Io = conv2d(I, key_word, kernel, stride); %�������
subplot(122),
imshow(Io,[]);