clc
clear
close all

I = imread('fanqie.jpg');
figure(1);
subplot(121);
imshow(rgb2gray(I));
kernel = [1,0,-1;1,0,-1;1,0,-1]; %卷积核
stride = 1; %卷积步长
key_word = 'Same'; %输出与输入size保持不变 ,‘Valid’输出会改变
Io = conv2d(I, key_word, kernel, stride); %卷积操作
subplot(122),
imshow(Io,[]);