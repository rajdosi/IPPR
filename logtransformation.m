clc
clear all
close all
a=imread('C:\Animesh\Image Processing\images\images\lena.gif');     
imshow(a);
a = im2double(a);
b = (20)*log(1 + a);
figure;
imshow(b);